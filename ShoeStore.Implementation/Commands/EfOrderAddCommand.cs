using AutoMapper;
using FluentValidation;
using ShoeStore.Application;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfOrderAddCommand : IOrderAddCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly OrderAddValidator _validator;
        private readonly IApplicationActor _actor;

        public EfOrderAddCommand(ShoeStoreContext context, OrderAddValidator validator, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
        }
        public int Id => 36;

        public string Name =>"Add order";

        public void Execute(OrderAddDto request)
        {
            _validator.ValidateAndThrow(request);
            var order = new Order
            {
                UserId = _actor.Id,
                Address = request.Address,
                OrderDate = request.OrderDate
            };

            foreach (var item in request.Items)
            {
                var product = _context.Products.Find(item.ProductId);

                product.Quantity -= item.Quantity;

                order.OrderLines.Add(new OrderLine
                {
                    ProductId = item.ProductId,
                    Quantity = item.Quantity,
                    Name = product.Name,
                    Price = product.Price
                });
            }
            _context.Orders.Add(order);
            _context.SaveChanges();
        }
    }
}
