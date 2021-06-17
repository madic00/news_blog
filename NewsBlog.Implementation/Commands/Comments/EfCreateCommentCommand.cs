using AutoMapper;
using NewsBlog.Application.Commands.Comments;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators.Comments;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Comments
{
    public class EfCreateCommentCommand : EfGenericInsert<CommentDto, Domain.Comment>, ICreateCommentCommand
    {
        public EfCreateCommentCommand(NewsBlogContext context, IMapper mapper, CreateCommentValidator validator )
            : base(context, mapper, validator)
        {

        }

        public override int Id => (int)UseCasesEnum.EfCreateCommentCommand;

        public override string Name => "Create new comment ef";
    }
}
