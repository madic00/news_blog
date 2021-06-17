using FluentValidation;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Validators.Tags
{
    public class CreateTagValidator : AbstractValidator<TagDto>
    {
        public CreateTagValidator(NewsBlogContext context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required.")
                .Must(x => !context.Tags.Any(c => c.Name == x))
                .WithMessage("Tag is already taken.");
        }
    }
}
