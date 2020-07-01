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
    public class EfShoeTypeUpdateCommand : IShoeTypeUpdateCommand
    {

        private readonly ShoeStoreContext _context;
        private readonly ShoeTypeUpdateValidator _validator;
        private readonly IMapper _maper;

        public EfShoeTypeUpdateCommand(ShoeStoreContext context, ShoeTypeUpdateValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 27;

        public string Name => "Update Shoe type";

        public void Execute(ShoeTypeDto request)
        {
            _validator.ValidateAndThrow(request);
            var shoeType = _context.ShoeTypes.Find(request.Id);
            if (shoeType == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(ShoeType));
            }
            _maper.Map(request, shoeType);
            _context.SaveChanges();
        }
    }
}
