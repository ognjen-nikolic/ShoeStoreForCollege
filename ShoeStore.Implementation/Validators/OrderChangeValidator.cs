using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class OrderChanggeValidator : AbstractValidator<OrderStatusChangeDto>
    {
        public OrderChanggeValidator(ShoeStoreContext context)
        {
            RuleFor(x => (int)x.Status)
               .InclusiveBetween(0,3)
               .WithMessage("Chose right status");
        }
    }
}
