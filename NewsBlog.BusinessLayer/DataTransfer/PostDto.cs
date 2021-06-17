using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class PostDto : BaseDto
    {
        public string Title { get; set; }

        public string Content { get; set; }

        public string MainImg { get; set; }

        public int UserId { get; set; }

        //public UserDto User { get; set; }

        public int CategoryId { get; set; }

        public IEnumerable<PostRatingDto> Ratings { get; set; } = new List<PostRatingDto>();

        public string CategoryName { get; set; }

        public IEnumerable<PostTagDto> PostTags { get; set; } = new List<PostTagDto>();

        public IEnumerable<CommentDto> Comments { get; set; } = new List<CommentDto>();

        public double AverageRating => this.Ratings.Any() ? Ratings.Average(x => x.Rating) : 0;

    }

    public class CreatePostDto
    {
        public int? Id { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public string MainImg { get; set; }

        public IFormFile Image { get; set; }

        public int UserId { get; set; }

        public int CategoryId { get; set; }

        public IEnumerable<int> PostTags { get; set; } = new List<int>();
    }
}
