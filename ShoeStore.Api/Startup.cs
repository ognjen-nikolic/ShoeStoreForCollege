using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using ShoeStore.Api.Core;
using ShoeStore.Application;
using ShoeStore.Application.Commands;
using ShoeStore.Application.Email;
using ShoeStore.Application.Queries;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Commands;
using ShoeStore.Implementation.Email;
using ShoeStore.Implementation.Logging;
using ShoeStore.Implementation.Queries;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Shoe Store", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });
            services.AddAutoMapper(this.GetType().Assembly);
            services.AddTransient<ShoeStoreContext>();
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<JwtManager>();
            services.AddHttpContextAccessor();
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonimousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });
            services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
            // register controller
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IEmailSender, SmtpEmailSender>();

            //user controller
            services.AddTransient<IGetUsers, EfUserGetAll>();
            services.AddTransient<IUserGetOne, EfUserGetOne>();
            services.AddTransient<UserAddValidator>();
            services.AddTransient<UserEditValidator>();
            services.AddTransient<UserAdminEditValidator>();
            services.AddTransient<IUserAddCommand, EfUserAddCommand>();
            services.AddTransient<IUserEditCommand, EfUserEditCommand>();
            services.AddTransient<IUserDeleteCommand, EfUserDeleteCommand>();
            services.AddTransient<IUserEditAdminCommand, EfUserEditAdminCommand>();

            //Group controller
            services.AddTransient<RoleAddValidator>();
            services.AddTransient<RoleUpdateValidator>();
            services.AddTransient<IRoleGetOne, EfRoleGetOne>();
            services.AddTransient<IRolesGet, EfRolesGet>();
            services.AddTransient<IRoleDeleteCommand, EfRoleDeleteCommand>();
            services.AddTransient<IRoleAddCommand, EfRoleAddCommand>();
            services.AddTransient<IRoleUpdateCommand, EfRoleUpdateCommand>();

            //Brands Controller 
            services.AddTransient<BrandAddValidator>();
            services.AddTransient<BrandUpdateValidator>();
            services.AddTransient<IBrandsGet, EfBrandsGet>();
            services.AddTransient<IBrandGetOne, EfBrandGetOne>();
            services.AddTransient<IBrandDeleteCommand, EfBrandDeleteCommand>();
            services.AddTransient<IBrandAddCommand, EfBrandAddCommand>();
            services.AddTransient<IBrandUpdateCommand, EfBrandUpdateCommand>();

            //Gender Controller
            services.AddTransient<GenderAddValidator>();
            services.AddTransient<GenderUpdateValidator>();
            services.AddTransient<IGendersGet, EfGendersGet>();
            services.AddTransient<IGenderGetOne, EfGenderGetOne>();
            services.AddTransient<IGenderDeleteCommand, EfGenderDeleteCommand>();
            services.AddTransient<IGenderAddCommand, EfGenderAddCommand>();
            services.AddTransient<IGenderUpdateCommand, EfGenderUpdateCommand>();

            //ShoeType COntroller
            services.AddTransient<ShoeTypeAddValidator>();
            services.AddTransient<ShoeTypeUpdateValidator>();
            services.AddTransient<IShoeTypesGet, EfShoeTypesGet>();
            services.AddTransient<IShoeTypeGetOne, EfShoeTypeGetOne>();
            services.AddTransient<IShoeTypeDeleteCommand, EfShoeTypeDeleteCommand>();
            services.AddTransient<IShoeTypeAddCommand, EfShoeTypeAddCommand>();
            services.AddTransient<IShoeTypeUpdateCommand, EfShoeTypeUpdateCommand>();

            //use case log controller
            services.AddTransient<IUseCaseLogsGet, EfUseCaseLogsGet>();

            //Product COntroller
            services.AddTransient<ProductAddValidator>();
            services.AddTransient<ProductUpdateValidator>();
            services.AddTransient<IProductsGet, EfProductsGet>();
            services.AddTransient<IProductGetOne, EfProductGetOne>();
            services.AddTransient<IProductDeleteCommand, EfProductDelete>();
            services.AddTransient<IProductAddCommand, EfProductAddCommand>();
            services.AddTransient<IProductUpdateCommand, EfProductUpdateCommand>();

            //Order COntroller
            services.AddTransient<OrderAddValidator>();
            services.AddTransient<OrderLineAddValidator>();
            services.AddTransient<OrderChanggeValidator>();
            services.AddTransient<IOrdersGet, EfOrdersGet>();
            services.AddTransient<IOrderGetOne, EfOrderGetOne>();
            services.AddTransient<IOrderAddCommand, EfOrderAddCommand>();
            services.AddTransient<IOrderChangeStatusCommand, EfOrderChangeStatusCommand>();


            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });


            services.AddControllers();


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });
            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
