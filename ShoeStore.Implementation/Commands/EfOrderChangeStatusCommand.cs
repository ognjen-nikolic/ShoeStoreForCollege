using FluentValidation;
using Microsoft.EntityFrameworkCore;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Exceptions;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfOrderChangeStatusCommand : IOrderChangeStatusCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly OrderChanggeValidator _validator;

        public EfOrderChangeStatusCommand(ShoeStoreContext context, OrderChanggeValidator validator)
        {
            _context = context;
            _validator = validator;
        }
        public int Id => 37;

        public string Name => "Change order status command";

        public void Execute(OrderStatusChangeDto request)
        {
            _validator.ValidateAndThrow(request);
            var order = _context.Orders
                .Include(o => o.OrderLines)
                .ThenInclude(ol => ol.Product)
                .FirstOrDefault(x => x.Id == request.OrderId);

            if (order == null)
            {
                throw new EntityNotFoundException(request.OrderId, typeof(Order));
            }

            if (order.OrderStatus == OrderStatus.Delivered)
            {
                throw new EntityConflictException("Canot change status of delivered orders");
            }

            if (order.OrderStatus == OrderStatus.Recieved)
            {
                if (request.Status == OrderStatus.Delivered)
                {
                    throw new EntityConflictException("Must be in state shipped before chosing deliver");
                }
                if (request.Status == OrderStatus.Canceled)
                {
                    foreach (var line in order.OrderLines)
                    {
                        line.Product.Quantity += line.Quantity;
                    }
                }
            }
            if (order.OrderStatus == OrderStatus.Shipped)
            {
                if (request.Status == OrderStatus.Canceled)
                {
                    throw new EntityConflictException("Order is on the way cant be cannceled");
                }
            }
            if (order.OrderStatus == OrderStatus.Canceled)
            {

                if (request.Status == OrderStatus.Shipped|| request.Status == OrderStatus.Delivered)
                {
                    throw new EntityConflictException("Canceled order can be return in received only");
                }
                if (request.Status == OrderStatus.Recieved)
                {
                    foreach (var line in order.OrderLines)
                    {
                        if(line.Product != null)
                        {
                            throw new EntityConflictException("One of the products not exist you cant retrive order");
                        } 
                        line.Product.Quantity -= line.Quantity;
                        if(line.Product.Quantity < 0)
                        {
                            throw new EntityConflictException("One of the products is not available at the moment you cant retrive order");
                        }
                    }
                }
            }
            order.OrderStatus = request.Status;
            _context.SaveChanges();
        }
    }
}
