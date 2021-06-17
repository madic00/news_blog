using Doublel.DynamicQueryBuilder.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Searches
{
    public class CategorySearch : PageSearch
    {
        [QueryProperty]
        public string Name { get; set; }

    }
}
