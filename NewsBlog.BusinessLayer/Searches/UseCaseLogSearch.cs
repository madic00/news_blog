using Doublel.DynamicQueryBuilder;
using Doublel.DynamicQueryBuilder.Attributes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Searches
{
    public class UseCaseLogSearch : PageSearch
    {
        [QueryProperty(ComparisonOperator.Contains, "Actor")]
        public string User { get; set; }

        [QueryProperty]
        public string UseCaseName { get; set; }

        [QueryProperty(ComparisonOperator.LessThanOrEqualsTo, "CreatedAt")]
        public DateTime? DateTo { get; set; }

        [QueryProperty(ComparisonOperator.MoreThanOrEqualsTo, "CreatedAt")]
        public DateTime? DateFrom { get; set; }

    }
}
