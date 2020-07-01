using ShoeStore.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.Queries
{
    public interface IProductGetOne : IQuery<int, ProductDto>
    {
    }
}
