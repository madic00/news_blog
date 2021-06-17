using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.Users;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Users
{
    public class EfGetUsersQuery : EfGenericGet<UserSearch, Domain.User, UserDto>, IGetUsersQuery
    {
        public EfGetUsersQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }
        public override int Id => (int)UseCasesEnum.EfGetUsersQuery;

        public override string Name => "Get users";


    }
}
