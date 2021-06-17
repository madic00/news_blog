using FluentValidation;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Validators.Users
{
    public class UpdateUserValidator : AbstractValidator<CreateUserDto>
    {
        public UpdateUserValidator(NewsBlogContext context)
        {
            RuleFor(x => x.FirstName).NotEmpty().MinimumLength(3);
            RuleFor(x => x.LastName).NotEmpty().MinimumLength(3);

            RuleFor(x => x.Password).NotEmpty().MinimumLength(6);

            RuleFor(x => x.Username).NotEmpty().MinimumLength(3)
                .DependentRules(() =>
                {
                    RuleFor(x => x.Username).Must((user, username) => !context.Users.Any(u => u.Username == username && u.Id != user.Id))
                    .WithMessage("This username is already taken.");
                });

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress()
                .DependentRules(() =>
                {
                    RuleFor(x => x.Email).Must((user, email) => !context.Users.Any(u => u.Email == email && u.Id != user.Id))
                    .WithMessage("This username is already taken.");
                });
        }
    }
}
