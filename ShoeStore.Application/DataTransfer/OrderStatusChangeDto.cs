using ShoeStore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.DataTransfer
{
    public class OrderStatusChangeDto
    {
        public int OrderId { get; set; }
        public OrderStatus Status { get; set; } 
    }
}
