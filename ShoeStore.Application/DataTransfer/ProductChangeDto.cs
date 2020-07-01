using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.DataTransfer
{
    public class ProductChangeDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public int ShoeTypeId { get; set; }
        public int GenderId { get; set; }
        public int BrandId { get; set; }
    }
}
