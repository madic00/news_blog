using AutoMapper;
using FluentValidation;
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
    public class EfAdminUpdateUserCommand : EfGenericUpdate<AdminCreateUserDto, Domain.User>, IAdminUpdateUserCommand
    {
        public EfAdminUpdateUserCommand(NewsBlogContext context, IMapper mapper, AdminUpdateUserValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfAdminUpdateUserCommand;

        public override string Name => "Admin update user";

    }
}
