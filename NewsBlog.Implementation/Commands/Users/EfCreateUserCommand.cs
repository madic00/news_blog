using AutoMapper;
using FluentValidation;
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

namespace NewsBlog.Implementation.Commands.Users
{
    public class EfCreateUserCommand : ICreateUserCommand
    {
        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly RegisterUserValidator _validator;

        public EfCreateUserCommand(NewsBlogContext context, IMapper mapper, RegisterUserValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EfCreateUserCommand;

        public string Name => "User Registration";
        public void Execute(CreateUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = _mapper.Map<Domain.User>(request);

            if (!user.IsAdmin)
            {
                user.AddDefaultUseCases();
            }

            _context.Users.Add(user);
            _context.SaveChanges();
        }
    }
}
