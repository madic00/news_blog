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
    public class UpdateTagValidator : AbstractValidator<TagDto>
    {
        public UpdateTagValidator(NewsBlogContext context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Name).Must((tag, name) => !context.Tags.Any(x => x.Name == name && x.Id != tag.Id));
                });
        }


    }
}
