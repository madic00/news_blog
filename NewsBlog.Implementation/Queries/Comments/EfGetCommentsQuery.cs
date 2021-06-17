using AutoMapper;
using Microsoft.EntityFrameworkCore;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries;
using NewsBlog.Application.Queries.Comments;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Comments
{
    public class EfGetCommentsQuery : EfGenericGet<CommentSearch, Domain.Comment, CommentDto>, IGetCommentsQuery
    {
        public EfGetCommentsQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetCommentsQuery;

        public override string Name => "Get Comments";
    }
}
