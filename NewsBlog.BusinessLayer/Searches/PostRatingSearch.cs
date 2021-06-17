using Doublel.DynamicQueryBuilder.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Searches
{
    public class PostRatingSearch : PageSearch
    {
        [QueryProperty]
        public int? PostId { get; set; }

        [QueryProperty]
        public int? UserId { get; set; }
    }
}
