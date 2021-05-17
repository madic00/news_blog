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
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.HasKey(x => x.Id);
            
            builder.HasAlternateKey(x => x.Email);
            builder.Property(x => x.Email).HasMaxLength(100).HasColumnType("varchar");

            builder.Property(x => x.FirstName).IsRequired().HasMaxLength(50).HasColumnType("varchar");
            builder.Property(x => x.LastName).IsRequired().HasMaxLength(50).HasColumnType("varchar");

            builder.Property(x => x.Password).IsRequired().HasMaxLength(255).HasColumnType("varchar");

            builder.HasMany(u => u.Posts)
                .WithOne(o => o.User)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasMany(u => u.ReadingLists)
                .WithOne(rl => rl.User)
                .HasForeignKey(rl => rl.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(u => u.Comments)
                .WithOne(c => c.User)
                .HasForeignKey(c => c.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            builder.HasMany(u => u.Ratings)
                .WithOne(pr => pr.User)
                .HasForeignKey(pr => pr.UserId)
                .OnDelete(DeleteBehavior.Cascade);

        }
    }
}
