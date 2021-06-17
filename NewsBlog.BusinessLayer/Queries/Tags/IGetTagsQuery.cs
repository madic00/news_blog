using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Queries.Tags
{
    public interface IGetTagsQuery : IQuery<PageResponse<TagDto>, TagSearch>
    {
    }
}
