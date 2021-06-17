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
    public class CreateUserUseCaseValidator : AbstractValidator<UserUseCaseDto>
    {
        public CreateUserUseCaseValidator(NewsBlogContext context)
        {
            RuleFor(x => x.UserId).NotEmpty()
                .Must(x => context.Users.Any(u => u.Id == x))
                .WithMessage("Provided user doesn't exist");

            RuleFor(x => x.UseCaseId).NotEmpty()
                .Must(x => Enum.IsDefined(typeof(UseCasesEnum), x))
                .WithMessage("Provided use case doesn't exist");
        }
    }
}
