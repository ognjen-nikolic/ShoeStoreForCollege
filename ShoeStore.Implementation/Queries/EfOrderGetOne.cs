using AutoMapper;
using Microsoft.EntityFrameworkCore;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Exceptions;
using ShoeStore.Application.Queries;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Implementation.Queries
{
    public class EfOrderGetOne : IOrderGetOne
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfOrderGetOne(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 35;

        public string Name => "Get Order";

        public OrderGetDto Execute(int search)
        {
            var order = _context.Orders
                .Include(x => x.User)
                .Include(x => x.OrderLines)
                .FirstOrDefault(o => o.Id == search);

            if (order == null)
            {
                throw new EntityNotFoundException(search, typeof(Order));
            }

            return  _mapper.Map<OrderGetDto>(order);
        }
    }
}
