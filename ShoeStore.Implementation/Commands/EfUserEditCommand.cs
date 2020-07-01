using AutoMapper;
using FluentValidation;
using ShoeStore.Application;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Exceptions;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Enums;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfUserEditCommand : IUserEditCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly UserEditValidator _validator;
        private readonly IMapper _maper;
        private readonly IApplicationActor _actor;

        public EfUserEditCommand(ShoeStoreContext context, UserEditValidator validator, IMapper maper, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
            _actor = actor;
        }

        public int Id => 4;

        public string Name => "User Edit";

        public void Execute(EditUserDto request)
        {
            _validator.ValidateAndThrow(request);
            var user = _context.Users.Find(request.Id);
            var actor = _context.Users.Find(_actor.Id);
            if (user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }

            if(actor.Id != user.Id)
            {
                throw new UnauthorizedAccessException();
            }

            _maper.Map(request, user);

            _context.SaveChanges();

        }
    }
}
