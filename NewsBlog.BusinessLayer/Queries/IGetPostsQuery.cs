using NewsBlog.BusinessLayer.DataTransfer;
using NewsBlog.BusinessLayer.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.BusinessLayer.Queries
{
    public interface IGetPostsQuery : IQuery<PostSearch, PageResponse<PostDto>>
    {

    }
}
