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
    public class CreateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(NewsBlogContext context)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("Name is required.")
                .Must(x => !context.Categories.Any(c => c.Name == x))
                .WithMessage("Category name is taken.");

        }
    }
}
