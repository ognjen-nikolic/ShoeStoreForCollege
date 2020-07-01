using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoeStore.Application.DataTransfer
{
    public class OrderGetDto
    {
        public int Id { get; set; }
        public string Address { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Status { get; set; }
        public string UserInfo { get; set; }
        public IEnumerable<OrderLineGetDto> OrderLines { get; set; } = new List<OrderLineGetDto>();
        public double TotalPrice => OrderLines.Sum(x => x.Price * x.Quantity);
    }

   
}
