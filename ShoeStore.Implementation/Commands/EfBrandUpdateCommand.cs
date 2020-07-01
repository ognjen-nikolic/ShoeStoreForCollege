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
    public class EfBrandUpdateCommand : IBrandUpdateCommand
    {

        private readonly ShoeStoreContext _context;
        private readonly BrandUpdateValidator _validator;
        private readonly IMapper _maper;

        public EfBrandUpdateCommand(ShoeStoreContext context, BrandUpdateValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 17;

        public string Name => "Brand update";

        public void Execute(BrandDto request)
        {
            _validator.ValidateAndThrow(request);
            var brand = _context.Brands.Find(request.Id);
            if (brand == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Brand));
            }
            _maper.Map(request, brand);
            _context.SaveChanges();
        }
    }
}
