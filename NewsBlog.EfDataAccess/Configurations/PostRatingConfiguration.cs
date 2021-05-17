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
    public class PostRatingConfiguration : IEntityTypeConfiguration<PostRating>
    {
        public void Configure(EntityTypeBuilder<PostRating> builder)
        {
            builder.Property(x => x.UserId).IsRequired().HasColumnType("int");
            builder.Property(x => x.PostId).IsRequired().HasColumnType("int");

            builder.Property(x => x.RatingId).IsRequired().HasColumnType("int");
        }
    }
}
