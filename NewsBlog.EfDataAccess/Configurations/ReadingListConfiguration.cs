using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using NewsBlog.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.EfDataAccess.Configurations
{
    public class ReadingListConfiguration : IEntityTypeConfiguration<ReadingList>
    {
        public void Configure(EntityTypeBuilder<ReadingList> builder)
        {
            builder.Property(x => x.UserId).IsRequired().HasColumnType("int");
            builder.Property(x => x.PostId).IsRequired().HasColumnType("int");

        }
    }
}
