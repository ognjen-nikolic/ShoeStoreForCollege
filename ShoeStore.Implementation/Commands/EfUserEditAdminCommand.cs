using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Exceptions;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Enums;
using ShoeStore.Implementation.Static;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfUserEditAdminCommand : IUserEditAdminCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly UserAdminEditValidator _validator;
        private readonly IMapper _maper;

        public EfUserEditAdminCommand(ShoeStoreContext context, UserAdminEditValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }

        public int Id => 6;

        public string Name => "User Edit by Admin";

        public void Execute(UserAddDto request)
        {

            _validator.ValidateAndThrow(request);
            var user = _context.Users.Include(x => x.UserUserCases).FirstOrDefault(x => x.Id == request.Id);
            if (user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }
            _maper.Map(request, user);
            var useCases = new List<UserUserCase>();

            if(request.UseCases.Count() == 0)
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
