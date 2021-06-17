using FluentValidation;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Validators.Comments
{
    public class UpdateCommentValidator : AbstractValidator<CommentDto>
    {
        public UpdateCommentValidator(NewsBlogContext context)
        {
            RuleFor(x => x.Text).NotEmpty().WithMessage("Text is required").DependentRules(() =>
            {
                RuleFor(x => x.Text).Must((comment, text) => !context.Comments.Any(c => c.Text == text && c.Id != comment.Id && c.PostId == comment.PostId && c.UserId == comment.UserId))
                .WithMessage("This comment already exist.");
            });

            //RuleFor(x => x.UserId).NotEmpty().WithMessage("User is required.")
            //    .Must(x => context.Users.Any(u => u.Id == x))
            //    .WithMessage("Provided user doesn't exist.");

            RuleFor(x => x.PostId).NotEmpty().WithMessage("Post is required.")
                .Must(x => context.Posts.Any(p => p.Id == x))
                .WithMessage("Provided post doesn't exist.").DependentRules(() =>
                {
                    RuleFor(x => x.PostId).Must((comment, postId) =>
                    {
                        if (comment.ParentId != null)
                        {
                            return context.Comments.Find(comment.ParentId).PostId == postId;
                        }

                        return true;
                    }).WithMessage("Provided combination of parent comment and post doesn't exist");
                });

            RuleFor(x => x.ParentId)
                .Must(x =>
                {
                    if (x != null)
                    {
                        return context.Comments.Any(c => c.Id == x);
                    }
                    return true;
                })
                .WithMessage("Provided comment doesn't exist.");
        }
    }
}
