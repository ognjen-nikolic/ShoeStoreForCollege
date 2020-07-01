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
    public class EfBrandDeleteCommand : IBrandDeleteCommand
    {
        private readonly ShoeStoreContext _context;

        public EfBrandDeleteCommand(ShoeStoreContext context)
        {
            _context = context;
        }
        public int Id => 15;

        public string Name => "Brand Delete";

        public void Execute(int request)
        {
            var brand = _context.Brands.Include(x => x.Products).FirstOrDefault(x => x.Id == request);
            if (brand == null)
            {
                throw new EntityNotFoundException(request, typeof(Brand));
            }
            if (brand.Products.Any(x => x.IsActive))
            {
                throw new EntityConflictException("Brand has active product :  cant be deleted");
            }
            brand.IsDeleted = true;
            brand.IsActive = false;
            _context.SaveChanges();
        }
    }
}
