using ShoeStore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.Searches
{
    public class SearchOrder : PagedSearch
    {
        public int?  UserId { get; set; }
        public int? MinOrderLines { get; set; }
        public OrderStatus? Status { get; set; }
        public double? MinPrice { get; set; }
    }
}
