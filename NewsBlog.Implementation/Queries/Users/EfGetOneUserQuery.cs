using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.Users;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Users
{
    public class EfGetOneUserQuery : EfGenericGetSingle<Domain.User, UserDto>, IGetOneUserQuery
    {
        public EfGetOneUserQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneUserQuery;

        public override string Name => "Get one user";
    }
}
