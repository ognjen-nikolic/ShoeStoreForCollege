using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.Searches
{
    public class SearchUser : PagedSearch
    {
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
