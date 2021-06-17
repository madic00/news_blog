using FluentValidation;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Validators.PostRating
{
    public class CreatePostRatingValidator : AbstractValidator<PostRatingDto>
    {
        public CreatePostRatingValidator(NewsBlogContext context) 
        {
            RuleFor(x => x.Rating).NotEmpty()
                .Must(x => x >= 1 && x <= 5)
                .WithMessage("Provide number between 1 and 5.");

            RuleFor(x => x.UserId)
                .Must((pr, userId) => !context.PostRatings.Any(x => x.PostId == pr.PostId && x.UserId == pr.UserId))
                .WithMessage("You already rated this post.");

            //RuleFor(x => x.UserId).NotEmpty()
            //    .Must(x => context.Users.Any(u => u.Id == x))
            //    .WithMessage("Provided user doesn't exist.")
            //    .DependentRules(() =>
            //    {
            //        RuleFor(x => x.UserId).Must((pr, userId) => !context.PostRatings.Any(x => x.PostId == pr.PostId && x.UserId == pr.UserId))
            //        .WithMessage("You already rated this post");
            //    });

            RuleFor(x => x.PostId).NotEmpty()
                .Must(x => context.Posts.Any(p => p.Id == x))
                .WithMessage("Provided post doesn't exist.");

        }
    }
}
