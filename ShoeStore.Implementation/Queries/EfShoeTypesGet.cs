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
    public class EfShoeTypesGet : IShoeTypesGet
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfShoeTypesGet(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 23;

        public string Name =>"Get Shoe types";

        public PagedResponse<ShoeTypeDto> Execute(SearchPropertyName search)
        {
            var query = _context.ShoeTypes.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<ShoeTypeDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<ShoeTypeDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };

            return response;
        }
    }
}
