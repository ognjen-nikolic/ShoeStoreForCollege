using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class RoleAddValidator : AbstractValidator<RoleDto>
    {
        public RoleAddValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .MinimumLength(4)
               .Must(name => !context.Roles.Any(g => g.Name == name))
               .WithMessage("Username must be unique");

        }
    }
}
