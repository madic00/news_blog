using AutoMapper;
using FluentValidation;
using NewsBlog.Application.Commands;
using NewsBlog.Application.Commands.Users;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Extensions;
using NewsBlog.Implementation.Validators.Users;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.User
{
    //public class EfCreateUserCommand : EfGenericInsert<AdminCreateUserDto, Domain.User>, IRegisterUserCommand
    //{
    //    public EfCreateUserCommand(NewsBlogContext context, IMapper mapper, RegisterUserValidator validator) : base(context, mapper, validator)
    //    {

    //    }

    //    public override int Id => 1;

    //    public override string Name => "User Registration";

    //}

    public class EfAdminCreateUserCommand : IAdminCreateUserCommand
    {
        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly AdminCreateUserValidator _validator;

        public EfAdminCreateUserCommand(NewsBlogContext context, IMapper mapper, AdminCreateUserValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EfAdminCreateUserCommand;

        public string Name => "Admin create User";
        public void Execute(AdminCreateUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = _mapper.Map<Domain.User>(request);

            if(!user.IsAdmin)
            {
                user.AddDefaultUseCases();
            }

            _context.Users.Add(user);
            _context.SaveChanges();
        }
    }
}