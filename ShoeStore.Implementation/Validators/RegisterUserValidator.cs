using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class RegisterUserValidator : AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.FirstName).NotEmpty();
            RuleFor(x => x.LastName).NotEmpty();
            RuleFor(x => x.Password).NotEmpty().MinimumLength(6);
            RuleFor(x => x.Username).NotEmpty().MinimumLength(4)
                .Must(x => !context.Users.Any(y => y.Username == x)).WithMessage("Username is already taken.");

            RuleFor(x => x.Email).NotEmpty().EmailAddress();
        }
    }
}
