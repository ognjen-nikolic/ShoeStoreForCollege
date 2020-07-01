using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
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
    public class EfUserAddCommand : IUserAddCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly UserAddValidator _validator;
        private readonly IMapper _maper;

        public EfUserAddCommand(ShoeStoreContext context, UserAddValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }

        public int Id => 3;

        public string Name => "Add User";

        public void Execute(UserAddDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Users.Add(_maper.Map<User>(request));
            _context.SaveChanges();

            var user = _context.Users.Include(x => x.UserUserCases).FirstOrDefault(x => x.Username == request.Username);
            var useCases = new List<UserUserCase>();

            if (user.RoleId == (int)Roles.Admin)
            {
                foreach (var useCase in RightListes.AdminRights())
                {
                    useCases.Add(new UserUserCase
                    {
                        UseCaseId = useCase,
                        UserId = user.Id
                    });
                }
            }
            if (user.RoleId == (int)Roles.User)
            {
                foreach (var useCase in RightListes.UserRights())
                {
                    useCases.Add(new UserUserCase
                    {
                        UseCaseId = useCase,
                        UserId = user.Id
                    });
                }
            }

            if (user.RoleId != (int)Roles.User || user.RoleId != (int)Roles.Admin)
            {
                foreach (var useCase in request.UseCases)
                {
                    useCases.Add(new UserUserCase
                    {
                        UseCaseId = useCase,
                        UserId = user.Id
                    });
                }
            }


            user.UserUserCases = useCases;
            _context.SaveChanges();

        }
        
    }
}
