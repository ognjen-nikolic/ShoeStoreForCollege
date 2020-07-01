using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class UserAdminEditValidator : AbstractValidator<UserAddDto>
    {
        public UserAdminEditValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.Username).NotEmpty().MinimumLength(4)
                 .Must(x => !context.Users.Any(y => y.Username == x)).WithMessage("Username must be unique."); 

            RuleFor(x => x.FirstName).NotEmpty().MaximumLength(30);

            RuleFor(x => x.LastName).NotEmpty().MaximumLength(30);

            RuleFor(x => x.Email).NotEmpty().EmailAddress();

            RuleFor(x => x.RoleId).NotEmpty().Must(role => context.Roles.Any(x => x.Id == role)).WithMessage("Role doesnt exist");

            RuleFor(x => x.UseCases).Must(x => x.Distinct().Count() == x.Count()).WithMessage("Duplicate cases not allowed").Must((dto, x) => dto.RoleId == (int)Roles.Admin ? x.Count() > 0 ? false : true : dto.RoleId == (int)Roles.User ? x.Count() > 0 ? false : true : true).WithMessage("If role is admin or regular use you cant change user rights, for changing rights pick another user");


            RuleFor(x => x.Password)
               .NotEmpty()
               .MinimumLength(6);

        }
    }
}
