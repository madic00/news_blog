using AutoMapper;
using Microsoft.EntityFrameworkCore;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Exceptions;
using NewsBlog.Application.Queries.Comments;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Comments
{
    public class EfGetOneCommentQuery : EfGenericGetSingle<Domain.Comment, CommentDto>, IGetOneCommentQuery
    {

        public EfGetOneCommentQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneCommentQuery;

        public override string Name => "Get one comment";

    }
}
