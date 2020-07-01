using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.Searches
{
    public class SearchProduct : PagedSearch
    {
        public string Name { get; set; }
        public double? MinPrice { get; set; }
        public double? MaxPrice { get; set; }
        public int? ShoeTypeId { get; set; }
        public int? GenderId { get; set; }
        public int? BrandId { get; set; }
    }
}
