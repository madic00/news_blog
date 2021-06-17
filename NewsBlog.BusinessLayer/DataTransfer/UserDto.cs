using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class UserDto : BaseDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public string Username { get; set; }

        public int RoleId { get; set; }

        public virtual RoleDto RoleDto { get; set; }

        public virtual IEnumerable<PostDto> Posts { get; set; }

        public virtual IEnumerable<CommentDto> Comments { get; set; }

        public virtual IEnumerable<int> UseCases { get; set; } = new List<int>();

        public virtual IEnumerable<PostRatingDto> PostRatings { get; set; }

    }

    public class CreateUserDto : BaseDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Username { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public bool IsAdmin => false;
    }

    public class AdminCreateUserDto : BaseDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Username { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public bool IsAdmin { get; set; }

        //public int RoleId { get; set; }
    }
}
