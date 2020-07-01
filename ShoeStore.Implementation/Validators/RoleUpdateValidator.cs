using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class RoleUpdateValidator : AbstractValidator<RoleDto>
    {
        public RoleUpdateValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must((dto,name) => !context.Roles.Any(g => g.Name == name && g.Id != dto.Id))
               .WithMessage("Role Must be unique");

        }
    }
}
