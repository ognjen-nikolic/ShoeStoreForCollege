using AutoMapper;
using FluentValidation;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfRoleAddCommand : IRoleAddCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly RoleAddValidator _validator;
        private readonly IMapper _maper;

        public EfRoleAddCommand(ShoeStoreContext context, RoleAddValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 11;

        public string Name => "Add role";

        public void Execute(RoleDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Roles.Add(_maper.Map<Role>(request));
            _context.SaveChanges();
        }
    }
}
