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
    public class EfRoleDeleteCommand : IRoleDeleteCommand
    {
        private readonly ShoeStoreContext _context;

        public EfRoleDeleteCommand(ShoeStoreContext context)
        {
            _context = context;
        }
        public int Id => 10;

        public string Name => "Delete role";

        public void Execute(int request)
        {
            var role = _context.Roles.Include(x => x.Users).FirstOrDefault(x => x.Id == request);
            if (role == null)
            {
                throw new EntityNotFoundException(request, typeof(Role));
            }
            if (role.Users.Any(x => x.IsActive))
            {
                throw new EntityConflictException("Role has active users cant be deleted");
            }
            role.IsDeleted = true;
            role.IsActive = false;
            _context.SaveChanges();
        }
    }
}
