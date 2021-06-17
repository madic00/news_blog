using Bogus;
using Microsoft.EntityFrameworkCore;
using NewsBlog.EfDataAccess.Configurations;
using NewsBlog.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.EfDataAccess
{
    public class NewsBlogContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=DESKTOP-SP3NTR5\SQLEXPRESS;Initial Catalog=news_blog;Integrated Security=True").UseLazyLoadingProxies();

            optionsBuilder.EnableSensitiveDataLogging();

            base.OnConfiguring(optionsBuilder);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new CategoryConfiguration());
            modelBuilder.ApplyConfiguration(new CommentConfiguration());
            modelBuilder.ApplyConfiguration(new PostConfiguration());
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new PostConfiguration());
            modelBuilder.ApplyConfiguration(new PostTagConfiguration());

            modelBuilder.Entity<PostTag>().HasKey(x => new { x.PostId, x.TagId });

            //var categories = new List<Category>
            //{
            //    new Category
            //    {
            //        Id = 1,
            //        CategoryName = "Sport"
            //    },
            //    new Category
            //    {
            //        Id = 2,
            //        CategoryName = "Tech"
            //    },
            //    new Category
            //    {
            //        Id = 3,
            //        CategoryName = "News"
            //    },
            //    new Category
            //    {
            //        Id = 4,
            //        CategoryName = "Business"
            //    },
            //    new Category
            //    {
            //        Id = 5,
            //        CategoryName = "Entertainment"
            //    },
            //    new Category
            //    {
            //        Id = 6,
            //        CategoryName = "Health"
            //    }
            //};

            //modelBuilder.Entity<Category>().HasData(categories);

            //var users = new List<User>();

            //for (int i = 1; i <= 40; i++)
            //{
            //    var user = new Faker<User>()
            //        .RuleFor(x => x.Id, x => i)
            //        .RuleFor(x => x.FirstName, x => x.Name.FirstName())
            //        .RuleFor(x => x.LastName, x => x.Name.LastName())
            //        .RuleFor(x => x.Email, x => x.Internet.Email())
            //        .RuleFor(x => x.Password, x => "sifra123")
            //        .RuleFor(x => x.CreatedAt, x => x.Date.Recent());

            //    users.Add(user);
            //}

            //modelBuilder.Entity<User>().HasData(users);

            //var posts = new List<Post>();

            //for (int i = 1; i <= 20; i++)
            //{
            //    var rnd = new Random();

            //    var categoryId = rnd.Next(1, 5);

            //    var post = new Faker<Post>()
            //        .RuleFor(x => x.Title, x => x.Lorem.Sentence())
            //        .RuleFor(x => x.Id, x => i)
            //        .RuleFor(x => x.Content, x => x.Lorem.Text())
            //        .RuleFor(x => x.MainImg, x => $"postImg{i}")
            //        .RuleFor(x => x.CategoryId, x => categoryId)
            //        .RuleFor(x => x.UserId, x => 1);

            //    posts.Add(post);
            //}

            //modelBuilder.Entity<Post>().HasData(posts);

            //var roles = new List<Role>
            //{
            //    new Role
            //    {
            //        Id = 1,
            //        Name = "Admin"
            //    },
            //    new Role
            //    {
            //        Id = 2,
            //        Name = "User"
            //    }
            //};

            //modelBuilder.Entity<Role>().HasData(roles);

            base.OnModelCreating(modelBuilder);
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.UtcNow;
                            e.UpdatedAt = null;
                            break;

                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.UtcNow;
                            break;

                        case EntityState.Deleted:
                            Entry(e).State = EntityState.Modified;
                            e.IsActive = false;
                            break;
                    }
                }

            }

            return base.SaveChanges();
        }


        public DbSet<Category> Categories { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<User> Users { get; set; }

        public DbSet<UseCaseLog> UseCaseLogs { get; set; }

        public DbSet<UserUseCase> UserUseCases { get; set; }

        public DbSet<PostRating> PostRatings { get; set; }

        public DbSet<Tag> Tags { get; set; }

        public DbSet<PostTag> PostTags { get; set; }

    }
}
