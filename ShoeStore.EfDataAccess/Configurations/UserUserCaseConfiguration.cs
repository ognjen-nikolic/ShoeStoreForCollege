using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ShoeStore.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.EfDataAccess.Configurations
{
    public class UserUserCaseConfiguration : IEntityTypeConfiguration<UserUserCase>
    {
        public void Configure(EntityTypeBuilder<UserUserCase> builder)
        {
            builder.HasKey(uc => new { uc.UserId, uc.UseCaseId });

        }
    }
}
