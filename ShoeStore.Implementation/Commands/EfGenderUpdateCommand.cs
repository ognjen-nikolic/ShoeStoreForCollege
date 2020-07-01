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
    public class EfGenderUpdateCommand : IGenderUpdateCommand
    {

        private readonly ShoeStoreContext _context;
        private readonly GenderUpdateValidator _validator;
        private readonly IMapper _maper;

        public EfGenderUpdateCommand(ShoeStoreContext context, GenderUpdateValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 22;

        public string Name =>"update gender";

        public void Execute(GenderDto request)
        {
            _validator.ValidateAndThrow(request);
            var gender = _context.Genders.Find(request.Id);
            if (gender == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Gender));
            }
            _maper.Map(request, gender);
            _context.SaveChanges();
        }
    }
}
