using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.DataTransfer
{
    public class OrderAddDto
    {
        public DateTime OrderDate { get; set; }
        public string Address { get; set; }
        public IEnumerable<OrderLineAddDto> Items { get; set; } = new List<OrderLineAddDto>();
    }
}
