using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.UserUseCases;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.UserUseCases
{
    public class EfGetOneUserUseCaseQuery : EfGenericGetSingle<Domain.UserUseCase, UserUseCaseDto>, IGetOneUserUseCaseQuery
    {
        public EfGetOneUserUseCaseQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneUserUseCaseQuery;

        public override string Name => "Get one user use case";
    }
}
