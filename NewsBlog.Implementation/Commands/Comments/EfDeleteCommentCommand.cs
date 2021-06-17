using NewsBlog.Application.Commands.Comments;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Comments
{
    public class EfDeleteCommentCommand : EfGenericDelete<Domain.Comment>, IDeleteCommentCommand
    {
        public EfDeleteCommentCommand(NewsBlogContext context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeleteCommentCommand;
        public override string Name => "Delete comment";
    }
}
