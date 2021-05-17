using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Domain
{
    public class PostRating
    {
        public int Id { get; set; }
        public int UserId { get; set; }

        public virtual User User { get; set; }

        public int PostId { get; set; }

        public virtual Post Post { get; set; }

        public int RatingId { get; set; }

        public virtual Rating Rating { get; set; }
    }
}
