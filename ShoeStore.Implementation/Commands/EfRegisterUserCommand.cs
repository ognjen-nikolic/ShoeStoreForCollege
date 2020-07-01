using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Email;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Enums;
using ShoeStore.Implementation.Static;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        public int Id => 7;

        public string Name => "User Registration";

        private readonly ShoeStoreContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;
        private readonly IMapper _mapper;

        public EfRegisterUserCommand(ShoeStoreContext context, RegisterUserValidator validator, IEmailSender sender, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
            _mapper = mapper;
        }

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);
            var user = _mapper.Map<User>(request);
            user.RoleId = (int)Roles.User;
            _context.Users.Add(user);
            var useCases = new List<UserUserCase>();
            foreach (var usecase in RightListes.UserRights())
            {
                useCases.Add(new UserUserCase
                {
                    Id = user.Id,
                    UseCaseId = usecase
                });
            }
            user.UserUserCases = useCases;
            _context.SaveChanges();
            _sender.Send(new SendEmailDto
            {
                Content = "<h1>Succesfull registration! </h1>",
                SendTo = request.Email,
                Subject = "Registration"
            });
        }
    }
}
