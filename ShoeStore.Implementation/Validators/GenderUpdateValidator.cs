using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class GenderUpdateValidator : AbstractValidator<GenderDto>
    {
        public GenderUpdateValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must((dto, name) => !context.Genders.Any(g => g.Name == name && g.Id != dto.Id))
               .WithMessage("Gender Must be unique");

        }
    }
}
