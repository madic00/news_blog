using System.Collections.Generic;

namespace NewsBlog.Domain
{
    public class User : Entity
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }
        public string Password { get; set; }

        public string Username { get; set; }

        public bool IsAdmin { get; set; }

        public virtual ICollection<Post> Posts { get; set; } = new HashSet<Post>();
        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();

        public virtual ICollection<UserUseCase> UserUseCases { get; set; }

        public virtual ICollection<PostRating> Ratings { get; set; } = new HashSet<PostRating>();

    }
}