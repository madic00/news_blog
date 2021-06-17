using Doublel.DynamicQueryBuilder;
using Doublel.DynamicQueryBuilder.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Searches
{
    public class PostSearch : PageSearch
    {
        [QueryProperties(ComparisonOperator.Contains, "Title", "Content")]
        public string Keyword { get; set; }

        [QueryProperty]
        public int? CategoryId { get; set; }

        //[QueryProperty(ComparisonOperator.MoreThan, "AverageRating")]
        //public int? MinRating { get; set; }

        //[QueryProperty(ComparisonOperator.LessThan)]
        //public int? MaxRating { get; set; }


    }
}
