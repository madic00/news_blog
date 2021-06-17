using Bogus;
using Microsoft.AspNetCore.Mvc;
using NewsBlog.Domain;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace NewsBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {
        private readonly NewsBlogContext _context;

        public TestController(NewsBlogContext context)
        {
            _context = context;
        }

        // GET: api/<TestController>
        [HttpGet]
        public IActionResult Get()
        {
            var categories = new List<Category>
            {
                new Category
                {
                    Name = "IT",
                },
                new Category
                {
                    Name = "Sport"
                },
                new Category
                {
                    Name = "Cooking"
                },
                new Category
                {
                    Name = "Welness"
                },
                new Category
                {
                    Name = "Lifestyle"
                }
            };

            _context.Categories.AddRange(categories);

            _context.SaveChanges();

            return Ok();
        }

        // GET api/<TestController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var users = new List<User>();

            for(int i = 11; i <= 25; i++)
            {
                var user = new Faker<User>()
                    .RuleFor(x => x.FirstName, x => x.Name.FirstName())
                    .RuleFor(x => x.LastName, x => x.Name.LastName())
                    .RuleFor(x => x.Username, x => x.Person.UserName)
                    .RuleFor(x => x.Password, x => BCrypt.Net.BCrypt.HashPassword("sifra123"))
                    .RuleFor(x => x.IsAdmin, x => false)
                    .RuleFor(x => x.Email, x => x.Internet.ExampleEmail());

                users.Add(user);
            }

            _context.Users.AddRange(users);

            _context.SaveChanges();

            return Ok();
        }

        // POST api/<TestController>
        [HttpPost]
        public IActionResult Post()
        {
            var posts = new List<Post>();

            for(int i = 20; i <= 40; i++)
            {
                var rnd = new Random();

                var post = new Faker<Post>()
                    .RuleFor(x => x.Title, x => x.Lorem.Sentence())
                    .RuleFor(x => x.Content, x => x.Lorem.Paragraphs())
                    .RuleFor(x => x.MainImg, x => $"post{i}.jpg")
                    .RuleFor(x => x.CategoryId, x => rnd.Next(1, 5))
                    .RuleFor(x => x.UserId, x => 9);

                posts.Add(post);

            }

            _context.Posts.AddRange(posts);
            _context.SaveChanges();

            return StatusCode(201);
        }

        // PUT api/<TestController>/5
        [HttpPut()]
        public IActionResult Put()
        {
            var tags = new List<Domain.Tag>();

            for (int i = 1; i <= 25; i++)
            {
                var tag = new Faker<Tag>()
                    .RuleFor(x => x.Name, x => x.Lorem.Word());

                tags.Add(tag);

            }

            _context.Tags.AddRange(tags);
            _context.SaveChanges();

            return StatusCode(201);
        }

        // DELETE api/<TestController>/5
        [HttpDelete]
        public void Delete()
        {
            var postTags = new List<PostTag>
            {
                new PostTag
                {
                    PostId = 62,
                    TagId = 3
                },
                new PostTag
                {
                    PostId = 62,
                    TagId = 2
                }
            };

            _context.PostTags.AddRange(postTags);
            _context.SaveChanges();

        }
    }
}
