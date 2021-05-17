using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Domain
{
    public class Post : Entity
    {
        public string Title { get; set; }

        public string Content { get; set; }

        public string MainImg { get; set; }

        public int UserId { get; set; }

        public virtual User User { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        public virtual ICollection<Image> Images { get; set; } = new HashSet<Image>();

        public virtual ICollection<ReadingList> ReadingLists { get; set; } = new HashSet<ReadingList>();
        
        public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();

        public virtual ICollection<PostRating> Ratings { get; set; } = new HashSet<PostRating>();

    }
}
