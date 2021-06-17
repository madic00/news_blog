using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries;
using NewsBlog.Application.Queries.UseCaseLogs;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.UseCaseLogs
{
    public class EfGetUseCaseLogsQuery : EfGenericGet<UseCaseLogSearch, Domain.UseCaseLog, UseCaseLogDto>, IGetUseCaseLogsQuery
    {
        //private readonly NewsBlogContext _context;
        //private readonly IMapper _mapper;

        //public EfGetUseCaseLogsQuery(NewsBlogContext context, IMapper mapper)
        //{
        //    _context = context;
        //    _mapper = mapper;
        //}

        public EfGetUseCaseLogsQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }
        public override int Id => (int)UseCasesEnum.EfGetUseCaseLogsQuery;

        public override string Name => "Get use case logs";


        //public int Id => (int)UseCasesEnum.EfGetUseCaseLogsQuery;

        //public string Name => "Get use case logs";

        //public PageResponse<UseCaseLogDto> Execute(UseCaseLogSearch search)
        //{
        //    var logs = _context.UseCaseLogs.AsQueryable();

        //    return logs.Paged<UseCaseLogDto, Domain.UseCaseLog>(search, _mapper);
        //}

    }
}
