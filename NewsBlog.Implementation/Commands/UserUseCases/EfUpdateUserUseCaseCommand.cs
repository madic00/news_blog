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
    public class EfUpdateUserUseCaseCommand : EfGenericUpdate<UserUseCaseDto, Domain.UserUseCase>, IUpdateUserUseCaseCommand
    {
        public EfUpdateUserUseCaseCommand(NewsBlogContext context, IMapper mapper, UpdateUserUseCaseValidator validator) : base(context, mapper, validator)
        {
        }
        public override int Id => (int)UseCasesEnum.EfUpdateUserUseCaseCommand;

        public override string Name => "Update user use case";
    }
}
