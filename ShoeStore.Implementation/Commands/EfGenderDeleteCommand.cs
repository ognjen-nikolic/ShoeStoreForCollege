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
    public class EfGenderDeleteCommand : IGenderDeleteCommand
    {
        private readonly ShoeStoreContext _context;

        public EfGenderDeleteCommand(ShoeStoreContext context)
        {
            _context = context;
        }
        public int Id => 20;

        public string Name => "Delete Gender";

        public void Execute(int request)
        {
            var gender = _context.Genders.Include(x => x.Products).FirstOrDefault(x => x.Id == request);
            if (gender == null)
            {
                throw new EntityNotFoundException(request, typeof(Gender));
            }
            if (gender.Products.Any(x => x.IsActive))
            {
                throw new EntityConflictException("Gender  has active products :  cant be deleted");
            }
            gender.IsDeleted = true;
            gender.IsActive = false;
            _context.SaveChanges();
        }
    }
}
