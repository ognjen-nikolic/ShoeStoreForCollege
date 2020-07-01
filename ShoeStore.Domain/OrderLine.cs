using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Domain
{
    public class OrderLine : Entity
    {
        public string Name { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public int OrderId { get; set; }
        public int? ProductId { get; set; }

        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
