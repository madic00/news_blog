using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Domain
{
    public class Category : Entity
    {
        public string CategoryName { get; set; }

        public ICollection<Post> Posts { get; set; }

    }
}
