using FluentValidation;
using NewsBlog.BusinessLayer.DataTransfer;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Validators
{
    public class RegisterUserValidator : AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(NewsBlogContext _context)
        {
            RuleFor(x => x.FirstName).NotEmpty().MinimumLength(3);
            RuleFor(x => x.LastName).NotEmpty().MinimumLength(3);

            RuleFor(x => x.Password).NotEmpty().MinimumLength(6);

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress()
                .Must(x => !_context.Users.Any(user => user.Email == x))
                .WithMessage("Email is already taken.");

        }
    }
}
