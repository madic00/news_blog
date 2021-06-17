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
    public class EfUpdateCommentCommand : EfGenericUpdate<CommentDto, Domain.Comment>, IUpdateCommentCommand
    {
        public EfUpdateCommentCommand(NewsBlogContext context, IMapper mapper, UpdateCommentValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfUpdateCommentCommand;

        public override string Name => "Update comment";
    }
}
