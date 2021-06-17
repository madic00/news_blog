using NewsBlog.Application.Commands.Users;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Users
{
    public class EfDeleteUserCommand : EfGenericDelete<Domain.User>, IDeleteUserCommand
    {

        public EfDeleteUserCommand(NewsBlogContext context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteUserCommand;

        public override string Name => "Delete user";
    }
}
