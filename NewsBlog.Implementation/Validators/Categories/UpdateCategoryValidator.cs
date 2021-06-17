using FluentValidation;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Validators.Categories
{
    public class UpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public UpdateCategoryValidator(NewsBlogContext context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Name).Must((category, name) => !context.Categories.Any(x => x.Name == name && x.Id != category.Id));
                });

        }

    }
}
