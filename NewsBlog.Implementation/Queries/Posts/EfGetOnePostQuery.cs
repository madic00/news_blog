using AutoMapper;
using Microsoft.EntityFrameworkCore;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Exceptions;
using NewsBlog.Application.Queries.Posts;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Posts
{
    public class EfGetOnePostQuery : EfGenericGetSingle<Domain.Post, PostDto>, IGetOnePostQuery
    {
        public EfGetOnePostQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOnePostQuery;

        public override string Name => "Get one post";

        //public PostDto Execute(int id)
        //{
        //    var post = _context.Posts.Include(x => x.User)
        //                .Include(x => x.Category)
        //                .Include(x => x.Images)
        //                .Include(x => x.ReadingLists)
        //                .Include(x => x.Comments)
        //                .Include(x => x.Ratings)
        //                .FirstOrDefault(x => x.Id == id);

        //    if(post == null)
        //    {
        //        throw new EntityNotFoundException(id, typeof(Domain.Post));
        //    }

        //    return _mapper.Map<PostDto>(post);
        //}
    }
}
