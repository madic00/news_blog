using NewsBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Commands.Users
{
    public interface IAdminUpdateUserCommand : ICommand<AdminCreateUserDto>
    {
    }
}
