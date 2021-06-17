using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class PostRatingDto : BaseDto
    {
        public int Rating { get; set; }

        public int PostId { get; set; }

        //public virtual PostDto Post { get; set; }

        public int UserId { get; set; }

        public virtual UserDto User { get; set; }
    }
}
