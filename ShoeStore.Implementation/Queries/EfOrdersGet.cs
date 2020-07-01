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
    public class EfOrdersGet : IOrdersGet
    {

        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfOrdersGet(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 34;

        public string Name => "Search orders";

        public PagedResponse<OrderGetDto> Execute(SearchOrder search)
        {
            var query = _context.Orders
                      .Include(x => x.User)
                      .Include(x => x.OrderLines).AsQueryable();

            if (search.UserId.HasValue)
            {
                query = query.Where(order => order.UserId == search.UserId);
            }
            if (search.MinOrderLines.HasValue)
            {
                query = query.Where(order => order.OrderLines.Count() >= search.MinOrderLines.Value);
            }

            if (search.Status.HasValue)
            {
                query = query.Where(o => o.OrderStatus == search.Status);
            }

            if (search.MinPrice.HasValue)
            {
                query = query.Where(o => o.OrderLines.Sum(x => x.Quantity * x.Price) >= search.MinPrice.Value);
            }
            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<OrderGetDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = _mapper.Map<List<OrderGetDto>>(query.Skip(skipCount).Take(search.PerPage).ToList())
            };

            return response;
        }
    }
}
