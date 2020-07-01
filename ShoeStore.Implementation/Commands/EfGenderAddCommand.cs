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
    public class EfGenderAddCommand : IGenderAddCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly GenderAddValidator _validator;
        private readonly IMapper _maper;

        public EfGenderAddCommand(ShoeStoreContext context, GenderAddValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 21;

        public string Name => "Add gender";

        public void Execute(GenderDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Genders.Add(_maper.Map<Gender>(request));
            _context.SaveChanges();
        }
    }
}
