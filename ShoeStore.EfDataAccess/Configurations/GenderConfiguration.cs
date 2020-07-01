using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ShoeStore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.EfDataAccess.Configurations
{
    public class GenderConfiguration : IEntityTypeConfiguration<Gender>
    {
        public void Configure(EntityTypeBuilder<Gender> builder)
        {
            builder.Property(g => g.Name).IsRequired();
            builder.Property(g => g.Name).HasMaxLength(15);
            builder.HasIndex(g => g.Name).IsUnique();
        }
    }
}
