using Microsoft.EntityFrameworkCore;
using ShoeStore.Application.Commands;
using ShoeStore.Application.Exceptions;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfShoeTypeDeleteCommand : IShoeTypeDeleteCommand
    {
        private readonly ShoeStoreContext _context;

        public EfShoeTypeDeleteCommand(ShoeStoreContext context)
        {
            _context = context;
        }
        public int Id => 25;

        public string Name =>"Delete Shoe type";

        public void Execute(int request)
        {
            var shoeType = _context.ShoeTypes.Include(x => x.Products).FirstOrDefault(x => x.Id == request);
            if (shoeType == null)
            {
                throw new EntityNotFoundException(request, typeof(ShoeType));
            }
            if (shoeType.Products.Any(x => x.IsActive))
            {
                throw new EntityConflictException("Shoe Type has active product :  cant be deleted");
            }
            shoeType.IsDeleted = true;
            shoeType.IsActive = false;
            _context.SaveChanges();
        }
    }
}
