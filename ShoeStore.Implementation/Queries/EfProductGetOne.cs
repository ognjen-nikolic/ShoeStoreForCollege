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
    public class EfProductGetOne : IProductGetOne
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfProductGetOne(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 30;

        public string Name => "Get product";

        public ProductDto Execute(int search)
        {
            var product = _context.Products.Include(x => x.ShoeType).Include(x => x.Gender).Include(x => x.Brand).FirstOrDefault(x => x.Id == search);
            if (product == null)
            {
                throw new EntityNotFoundException(search, typeof(Product));
            }
            return _mapper.Map<ProductDto>(product);
        }
    }
}
