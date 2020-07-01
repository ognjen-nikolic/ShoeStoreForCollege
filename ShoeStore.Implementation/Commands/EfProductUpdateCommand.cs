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
    public class EfProductUpdateCommand : IProductUpdateCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly ProductUpdateValidator _validator;
        private readonly IMapper _maper;

        public EfProductUpdateCommand(ShoeStoreContext context, ProductUpdateValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 33;

        public string Name => "Product update";

        public void Execute(ProductChangeDto request)
        {
            _validator.ValidateAndThrow(request);
            var product = _context.Products.Find(request.Id);
            if (product == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Product));
            }
            _maper.Map(request, product);
            _context.SaveChanges();
        }
    }
}
