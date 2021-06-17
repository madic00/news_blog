using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.Tags;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Tags
{
    public class EfGetTagsQuery : EfGenericGet<TagSearch, Domain.Tag, TagDto>, IGetTagsQuery
    {
        public EfGetTagsQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetTagsQuery;

        public override string Name => "Get tags";
    }
}
