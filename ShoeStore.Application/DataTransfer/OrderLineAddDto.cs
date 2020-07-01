using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.DataTransfer
{
    public class OrderLineAddDto
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
