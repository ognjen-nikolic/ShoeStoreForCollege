using AutoMapper;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Queries;
using ShoeStore.Application.Searches;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Queries
{
    public class EfRolesGet : IRolesGet
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfRolesGet(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 9;

        public string Name =>"Search Roles";

        public IEnumerable<RoleDto> Execute(SearchRole search)
        {
            var query = _context.Roles.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return (_mapper.Map<List<RoleDto>>(query.ToList()));
        }
    }
}
