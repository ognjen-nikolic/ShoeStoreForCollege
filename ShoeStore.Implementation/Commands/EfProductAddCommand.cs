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
    public class EfProductAddCommand : IProductAddCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly ProductAddValidator _validator;
        private readonly IMapper _maper;

        public EfProductAddCommand(ShoeStoreContext context, ProductAddValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 32;

        public string Name => "Add Product";

        public void Execute(ProductChangeDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.Products.Add(_maper.Map<Product>(request));
            _context.SaveChanges();
        }
    }
}
