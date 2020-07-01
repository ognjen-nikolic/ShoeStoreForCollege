using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ShoeStore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.EfDataAccess.Configurations
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.Property(x => x.Name).IsRequired();

            builder.HasIndex(x => x.Name).IsUnique();

            builder.HasMany(pro => pro.OrderLines)
                .WithOne(x => x.Product)
                .HasForeignKey(ol => ol.ProductId)
                .OnDelete(DeleteBehavior.SetNull);
        }
    }
}
