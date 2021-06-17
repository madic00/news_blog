using Doublel.DynamicQueryBuilder.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Searches
{
    public class CommentSearch : PageSearch
    {
        [QueryProperty]
        public int? UserId { get; set; }
        [QueryProperty]
        public int? PostId { get; set; }
        [QueryProperty]
        public int? ParentId { get; set; }
    }
}
