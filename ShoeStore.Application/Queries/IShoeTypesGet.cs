using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.Queries
{
    public interface IShoeTypesGet : IQuery<SearchPropertyName,PagedResponse<ShoeTypeDto>>
    {
    }
}
