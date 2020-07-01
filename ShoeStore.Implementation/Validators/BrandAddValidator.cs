using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class BrandAddValidator : AbstractValidator<BrandDto>
    {
        public BrandAddValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.Brands.Any(g => g.Name == name))
               .WithMessage("Brand must be unique");

        }
    }
}
