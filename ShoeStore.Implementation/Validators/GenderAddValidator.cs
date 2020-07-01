using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class GenderAddValidator : AbstractValidator<GenderDto>
    {
        public GenderAddValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.Genders.Any(g => g.Name == name))
               .WithMessage("Gender must be unique");

        }
    }
}
