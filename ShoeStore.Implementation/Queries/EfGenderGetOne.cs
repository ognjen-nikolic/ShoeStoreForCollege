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
    public class EfGenderGetOne : IGenderGetOne
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfGenderGetOne(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        public int Id => 19;

        public string Name => "Get Gender";

        public GenderDto Execute(int search)
        {
            var gender = _context.Genders.Find(search);
            if (gender == null)
            {
                throw new EntityNotFoundException(search, typeof(Gender));
            }
            return _mapper.Map<GenderDto>(gender);
        }
    }
}
