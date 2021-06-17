using AutoMapper;
using NewsBlog.Application.Commands.UserUseCases;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators.UserUseCases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.UserUseCases
{
    public class EfCreateUserUseCaseCommand : EfGenericInsert<UserUseCaseDto, Domain.UserUseCase>, ICreateUserUseCaseCommand
    {
        public EfCreateUserUseCaseCommand(NewsBlogContext context, IMapper mapper, CreateUserUseCaseValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfCreateUserUseCaseCommand;

        public override string Name => "Create user use case";
    }
}
