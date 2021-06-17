using AutoMapper;
using NewsBlog.Application.Commands.Users;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Users
{
    public class EfUpdateUserCommand : EfGenericUpdate<CreateUserDto, Domain.User>, IUpdateUserCommand
    {
        public EfUpdateUserCommand(NewsBlogContext context, IMapper mapper, UpdateUserValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfUpdateUserCommand;

        public override string Name => "Update user";
    }
}
