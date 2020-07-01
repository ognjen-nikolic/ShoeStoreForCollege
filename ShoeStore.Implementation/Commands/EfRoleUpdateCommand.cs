using AutoMapper;
using FluentValidation;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Exceptions;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfRoleUpdateCommand : IRoleUpdateCommand
    {

        private readonly ShoeStoreContext _context;
        private readonly RoleUpdateValidator _validator;
        private readonly IMapper _maper;

        public EfRoleUpdateCommand(ShoeStoreContext context, RoleUpdateValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 12;

        public string Name => "Update Role";

        public void Execute(RoleDto request)
        {
            _validator.ValidateAndThrow(request);
            var role = _context.Roles.Find(request.Id);
            if(role == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Role));
            }
            _maper.Map(request, role);
            _context.SaveChanges();

        }
    }
}
