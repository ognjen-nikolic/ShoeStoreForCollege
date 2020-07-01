using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.Searches
{
    public class UseCaseLogSearch : PagedSearch
    {
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public string UseCaseName { get; set; }
        public string Actor { get; set; }
    }
}
