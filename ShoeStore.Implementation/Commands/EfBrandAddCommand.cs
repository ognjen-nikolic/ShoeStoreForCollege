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
    public class EfBrandAddCommand : IBrandAddCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly BrandAddValidator _validator;
        private readonly IMapper _maper;

        public EfBrandAddCommand(ShoeStoreContext context, BrandAddValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 16;

        public string Name => "Brand Add";

        public void Execute(BrandDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Brands.Add(_maper.Map<Brand>(request));
            _context.SaveChanges();
        }
    }
}
