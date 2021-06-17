using NewsBlog.Application.Commands.UserUseCases;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.UserUseCases
{
    public class EfDeleteUserUseCaseCommand : EfGenericDelete<Domain.UserUseCase>, IDeleteUserUseCaseCommand
    {
        public EfDeleteUserUseCaseCommand(NewsBlogContext context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteUserUseCaseCommand;

        public override string Name => "Delete User use case";
    }
}
