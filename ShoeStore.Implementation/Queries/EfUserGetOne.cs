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
    public class EfUserGetOne : IUserGetOne
    {
        private readonly ShoeStoreContext _context;
        private readonly IMapper _mapper;

        public EfUserGetOne(ShoeStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 2;

        public string Name => "Get user by Id";

        public UserDto Execute(int search)
        {
            var user = _context.Users.Find(search);
            if(user == null)
            {
                throw new EntityNotFoundException(search,typeof(User));
            }
            return _mapper.Map<UserDto>(user);
        }
    }
}
