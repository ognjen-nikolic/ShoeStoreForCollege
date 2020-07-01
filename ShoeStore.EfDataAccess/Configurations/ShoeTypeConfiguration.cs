using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ShoeStore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.EfDataAccess.Configurations
{
    public class ShoeTypeConfiguration : IEntityTypeConfiguration<ShoeType>
    {
        public void Configure(EntityTypeBuilder<ShoeType> builder)
        {
            builder.Property(g => g.Name).IsRequired();
            builder.Property(g => g.Name).HasMaxLength(30);
            builder.HasIndex(g => g.Name).IsUnique();
        }
    }
}
