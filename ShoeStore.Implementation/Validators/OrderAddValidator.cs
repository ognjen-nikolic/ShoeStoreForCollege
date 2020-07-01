using FluentValidation;
using ShoeStore.Application.DataTransfer;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace ShoeStore.Implementation.Validators
{
    public class OrderAddValidator : AbstractValidator<OrderAddDto> 
    { 
        public OrderAddValidator(ShoeStoreContext context)
        {
            RuleFor(x => x.OrderDate)
                .GreaterThan(DateTime.Today)
                .WithMessage("Order date must be in future.")
                .LessThan(DateTime.Now.AddDays(30))
                .WithMessage("Order date can't be more than 30 days from today.");

            RuleFor(x => x.Address)
                .NotEmpty()
                .WithMessage("Address is required.");

            RuleFor(x => x.Items)
                .NotEmpty()
                .WithMessage("There must be at least one order line.")
                .Must(items => items.Select(x => x.ProductId).Distinct().Count() == items.Count())
                .WithMessage("Duplicate products are not allowed.")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.Items).SetValidator
                        (new OrderLineAddValidator(context));
                });
        }
    }
}
