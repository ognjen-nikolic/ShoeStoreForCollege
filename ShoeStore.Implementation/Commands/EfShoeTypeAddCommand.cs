using AutoMapper;
using FluentValidation;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Domain;
using ShoeStore.EfDataAccess;
using ShoeStore.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Implementation.Commands
{
    public class EfShoeTypeAddCommand : IShoeTypeAddCommand
    {
        private readonly ShoeStoreContext _context;
        private readonly ShoeTypeAddValidator _validator;
        private readonly IMapper _maper;

        public EfShoeTypeAddCommand(ShoeStoreContext context, ShoeTypeAddValidator validator, IMapper maper)
        {
            _context = context;
            _validator = validator;
            _maper = maper;
        }
        public int Id => 26;

        public string Name => "Ad shoe type";

        public void Execute(ShoeTypeDto request)
        {
            request.Id = 0;
            _validator.ValidateAndThrow(request);
            _context.ShoeTypes.Add(_maper.Map<ShoeType>(request));
            _context.SaveChanges();
        }
    }
}
