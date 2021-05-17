using NewsBlog.BusinessLayer.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.BusinessLayer.Commands
{
    public interface IRegisterUserCommand : ICommand<RegisterUserDto>
    {

    }
}
