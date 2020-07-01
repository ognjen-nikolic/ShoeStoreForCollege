using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class ProductAddValidator : AbstractValidator<ProductChangeDto>
    {
        public ProductAddValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.Products.Any(g => g.Name == name))
               .WithMessage("Product name must be unique");

            RuleFor(x => x.Description).MaximumLength(100);

            RuleFor(x => x.Price).NotEmpty().GreaterThan(0);

            RuleFor(x => x.Quantity).NotEmpty().GreaterThan(0);

            RuleFor(x => x.ShoeTypeId).NotEmpty().Must(x => context.ShoeTypes.Any(y => y.Id == x));

            RuleFor(x => x.GenderId).NotEmpty().Must(x => context.Genders.Any(y => y.Id == x));

            RuleFor(x => x.BrandId).NotEmpty().Must(x => context.Brands.Any(y => y.Id == x));
        }
    }
}
