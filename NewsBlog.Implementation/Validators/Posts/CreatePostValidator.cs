using FluentValidation;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Validators.Posts
{
    public class CreatePostValidator : AbstractValidator<CreatePostDto>
    {
        public CreatePostValidator(NewsBlogContext context)
        {
            RuleFor(x => x.Title)
                .NotEmpty()
                .WithMessage("Post title is required.")
                .Must(x => !context.Posts.Any(p => p.Title == x))
                .WithMessage("Post with this title already exist.");

            RuleFor(x => x.Content).NotEmpty().WithMessage("Post content is required.");

            RuleFor(x => x.Image).NotEmpty().WithMessage("Post image is required.");

            RuleFor(x => x.UserId).NotEmpty().WithMessage("User is required.")
                .Must(x => context.Users.Any(u => u.Id == x))
                .WithMessage("Provided user doesn't exist.");

            RuleFor(x => x.CategoryId).NotEmpty().WithMessage("Category is required.")
                .Must(x => context.Categories.Any(c => c.Id == x))
                .WithMessage("Provided category doesn't exist.");

        }

    }
}
