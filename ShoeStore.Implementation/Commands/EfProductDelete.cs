using Microsoft.EntityFrameworkCore;
using ShoeStore.Application.Commands;
using ShoeStore.Application.Exceptions;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfProductDelete : IProductDeleteCommand
    {
        private readonly ShoeStoreContext _context;

        public EfProductDelete(ShoeStoreContext context)
        {
            _context = context;
        }
        public int Id => 31;

        public string Name => "Delete product";

        public void Execute(int request)
        {
            var product = _context.Products.Include(x => x.OrderLines).ThenInclude(x => x.Order).FirstOrDefault(x => x.Id == request);
            if (product == null)
            {
                throw new EntityNotFoundException(request, typeof(Product));
            }
            var orderLines = _context.OrderLines.Where(x => x.ProductId == request).ToList();
            foreach (var orderLine in orderLines)
            {
                orderLine.ProductId = null;
            }
            product.IsDeleted = true;
            product.IsActive = false;
            _context.SaveChanges();
        }
    }
}
