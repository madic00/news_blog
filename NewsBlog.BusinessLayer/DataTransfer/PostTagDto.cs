using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class PostTagDto
    {
        public int PostId { get; set; }

        public int TagId { get; set; }

        //public virtual PostDto Post { get; set; }

        //public virtual TagDto Tag { get; set; }
    }
}
