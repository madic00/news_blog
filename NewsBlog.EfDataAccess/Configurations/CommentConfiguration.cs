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
    public class CommentConfiguration : IEntityTypeConfiguration<Comment>
    {
        public void Configure(EntityTypeBuilder<Comment> builder)
        {
            builder.HasKey(x => x.Id);

            builder.Property(c => c.Text).IsRequired().HasMaxLength(255).HasColumnType("varchar");

            builder.Property(c => c.PostId).IsRequired();
            builder.Property(c => c.UserId).IsRequired();

            builder.HasMany(x => x.ChildrenComments)
                    .WithOne(x => x.Parent)
                    .HasForeignKey(c => c.ParentId)
                    .OnDelete(DeleteBehavior.NoAction);

        }
    }
}
