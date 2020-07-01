using AutoMapper;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Exceptions;
using ShoeStore.Application.Queries;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Implementation.Queries
{
    public class EfRoleGetOne : IRoleGetOne
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfRoleGetOne(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 8;

        public string Name => "Get one Role";

        public RoleDto Execute(int search)
        {
            var role = _context.Roles.Find(search);
            if (role == null)
            {
                throw new EntityNotFoundException(search, typeof(Role));
            }
            return _mapper.Map<RoleDto>(role);
        }
    }
}
