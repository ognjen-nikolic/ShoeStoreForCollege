using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class ShoeTypeAddValidator : AbstractValidator<ShoeTypeDto>
    {
        public ShoeTypeAddValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.ShoeTypes.Any(g => g.Name == name))
               .WithMessage("Shoe Type must be unique");

        }
    }
}
