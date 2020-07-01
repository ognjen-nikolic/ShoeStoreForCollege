using AutoMapper;
using Microsoft.EntityFrameworkCore;
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
    public class EfProductsGet : IProductsGet
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfProductsGet(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 29;

        public string Name => "products search";

        public PagedResponse<ProductDto> Execute(SearchProduct search)
        {
            var query = _context.Products.Include(x => x.Brand).Include(x => x.Gender).Include(x => x.ShoeType).AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            if (search.BrandId != null)
            {
                query = query.Where(x => x.BrandId == search.BrandId);
            }
            if (search.GenderId != null)
            {
                query = query.Where(x => x.GenderId == search.GenderId);
            }
            if (search.ShoeTypeId != null)
            {
                query = query.Where(x => x.ShoeTypeId == search.ShoeTypeId);
            }
            if (search.MinPrice != null)
            {
                query = query.Where(x => x.Price >= search.MinPrice);
            }
            if (search.MaxPrice != null)
            {
                query = query.Where(x => x.Price <= search.MaxPrice);
            }
            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<ProductDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<ProductDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };
            return response;
        }
    }
}
