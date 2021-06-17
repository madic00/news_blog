using FluentValidation;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Validators.UserUseCases
{
    public class UpdateUserUseCaseValidator : AbstractValidator<UserUseCaseDto>
    {
        public UpdateUserUseCaseValidator(NewsBlogContext context)
        {
            RuleFor(x => x.UserId).NotEmpty()
                .Must(x => context.Users.Any(u => u.Id == x))
                .WithMessage("Provided user doesn't exist")
                .DependentRules(() =>
                {
                    RuleFor(x => x.UserId).Must((userUseCase, userId) => !context.UserUseCases.Any(x => x.UserId == userUseCase.UserId && x.UseCaseId == userUseCase.UseCaseId))
                    .WithMessage("This use case is already setted for this user");
                });

            RuleFor(x => x.UseCaseId).NotEmpty()
                .Must(x => Enum.IsDefined(typeof(UseCasesEnum), x))
                .WithMessage("Provided use case doesn't exist");
        }
    }
}
