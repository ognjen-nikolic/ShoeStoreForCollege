using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.DataTransfer
{
    public class ProductDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
        public string ShoeTypeName { get; set; }
        public string GenderName { get; set; }
        public string BrandName { get; set; }
    }
}
