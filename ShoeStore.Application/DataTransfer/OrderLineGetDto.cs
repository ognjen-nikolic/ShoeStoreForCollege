using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.DataTransfer
{
    public class OrderLineGetDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
    }
}
