using NewsBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Commands.UserUseCases
{
    public interface ICreateUserUseCaseCommand : ICommand<UserUseCaseDto>
    {
    }
}
