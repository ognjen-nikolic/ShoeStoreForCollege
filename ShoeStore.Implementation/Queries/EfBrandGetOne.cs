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
    public class EfBrandGetOne : IBrandGetOne
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfBrandGetOne(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id =>14;

        public string Name => "Get one Brand";

        public BrandDto Execute(int search)
        {
            var brand = _context.Brands.Find(search);
            if (brand == null)
            {
                throw new EntityNotFoundException(search, typeof(Brand));
            }
            return _mapper.Map<BrandDto>(brand);
        }
    }
}
