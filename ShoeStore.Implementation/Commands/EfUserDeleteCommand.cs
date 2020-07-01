using Microsoft.EntityFrameworkCore;
using ShoeStore.Application;
using ShoeStore.Application.Commands;
using ShoeStore.Application.Exceptions;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Input;

namespace ShoeStore.Implementation.Commands
{
    public class EfUserDeleteCommand : IUserDeleteCommand
    {
        private readonly ShoeStoreContext _context;

        public EfUserDeleteCommand(ShoeStoreContext context)
        {
            _context = context;
        }

        public int Id => 5;

        public string Name => "Delete User" ;

        public void Execute(int request)
        {
            var user = _context.Users.Include(x => x.Orders).FirstOrDefault(x => x.Id == request);
            if (user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }
            if (user.Orders.Any(x => x.OrderStatus == OrderStatus.Recieved || x.OrderStatus == OrderStatus.Shipped))
            {
                throw new EntityConflictException("User has active orders. User cant be deleted");
            }
            user.IsDeleted = true;
            user.IsActive = false;
            _context.SaveChanges();
        }
    }

}
