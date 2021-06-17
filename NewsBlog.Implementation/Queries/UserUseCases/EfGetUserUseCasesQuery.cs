using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.UserUseCases;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.UserUseCases
{
    public class EfGetUserUseCasesQuery : EfGenericGet<UserUseCaseSearch, Domain.UserUseCase, UserUseCaseDto>, IGetUserUseCasesQuery
    {
        public EfGetUserUseCasesQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetUserUseCasesQuery;

        public override string Name => "Get User use cases";
    }
}
