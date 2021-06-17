using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries;
using NewsBlog.Application.Queries.UseCaseLogs;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.UseCaseLogs
{
    public class EfGetUseCaseLogQuery : EfGenericGetSingle<Domain.UseCaseLog, UseCaseLogDto>, IGetUseCaseLogQuery
    {
        public EfGetUseCaseLogQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }
        public override int Id => (int)UseCasesEnum.EfGetUseCaseLogQuery;

        public override string Name => "Get one use case log";

    }
}
