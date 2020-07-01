using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.DataTransfer
{
    public class UserAddDto
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Password { get; set; }
        public int RoleId { get; set; }
        public IEnumerable<int> UseCases { get; set; } = new List<int>();
    }
}
