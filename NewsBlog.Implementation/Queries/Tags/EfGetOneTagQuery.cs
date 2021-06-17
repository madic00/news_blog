using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.Tags;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Tags
{
    public class EfGetOneTagQuery : EfGenericGetSingle<Domain.Tag, TagDto>, IGetOneTagQuery
    {
        public EfGetOneTagQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneTagQuery;

        public override string Name => "Get one tag";
    }
}
