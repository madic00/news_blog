using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Domain
{
    public class Image : Entity
    {
        public string Source { get; set; }
        public string Alt { get; set; }

        public int PostId { get; set; }

        public virtual Post Post { get; set; }
    }
}
