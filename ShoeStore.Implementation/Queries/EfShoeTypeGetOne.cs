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
    public class EfShoeTypeGetOne : IShoeTypeGetOne
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfShoeTypeGetOne(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 24;

        public string Name =>"Get Shoe Type";

        public ShoeTypeDto Execute(int search)
        {
            var shoeType = _context.ShoeTypes.Find(search);
            if (shoeType == null)
            {
                throw new EntityNotFoundException(search, typeof(ShoeType));
            }
            return _mapper.Map<ShoeTypeDto>(shoeType);
        }
    }
}
