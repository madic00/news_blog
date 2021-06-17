using NewsBlog.Application.Commands.Posts;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Posts
{
    public class EfDeletePostCommand : EfGenericDelete<Domain.Post>, IDeletePostCommand
    {
        public EfDeletePostCommand(NewsBlogContext context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeletePostCommand;

        public override string Name => "Delete post using EF";
    }
}
