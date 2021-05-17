using AutoMapper;
using NewsBlog.BusinessLayer.Commands;
using NewsBlog.BusinessLayer.DataTransfer;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.User
{
    public class EfRegisterUserCommand : EfGenericInsert<RegisterUserDto, Domain.User>, IRegisterUserCommand
    {
        public EfRegisterUserCommand(NewsBlogContext context, IMapper mapper, RegisterUserValidator validator) : base(context, mapper, validator)
        {

        }
        public override int Id => 1;

        public override string Name => "User Registration";

    }
}
