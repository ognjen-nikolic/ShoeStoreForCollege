using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ShoeStore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.EfDataAccess.Configurations
{
    public class RoleConfiguration : IEntityTypeConfiguration<Role>
    {
        public void Configure(EntityTypeBuilder<Role> builder)
        {
            builder.Property(x => x.Name).HasMaxLength(30);
            builder.HasIndex(x => x.Name).IsUnique();
            builder.Property(x => x.Name).IsRequired();

            builder.HasMany(g => g.Users)
                   .WithOne(u => u.Role)
                   .HasForeignKey(u => u.RoleId).OnDelete(DeleteBehavior.Restrict);
        }
    }
}
