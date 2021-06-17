using NewsBlog.Application.Commands.Users;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Users
{
    public class EfAdminDeleteUserCommand : EfGenericDelete<Domain.User>, IAdminDeleteUserCommand
    {
        public EfAdminDeleteUserCommand(NewsBlogContext context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfAdminDeleteUserCommand;

        public override string Name => "Admin delete user";
    }
}
