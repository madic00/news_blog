using Doublel.DynamicQueryBuilder;
using Doublel.DynamicQueryBuilder.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Searches
{
    public class TagSearch : PageSearch
    {
        [QueryProperty(ComparisonOperator.Contains, "Name")]
        public string Name { get; set; }
    }
}
