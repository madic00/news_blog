using AutoMapper;
using Microsoft.EntityFrameworkCore;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries;
using NewsBlog.Application.Queries.Posts;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Posts
{
    public class EfGetPostsQuery : EfGenericGet<PostSearch, Domain.Post, PostDto>, IGetPostsQuery
    {
        public EfGetPostsQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetPostsQuery;

        public override string Name => "Get Posts";

        //public PageResponse<PostDto> Execute(PostSearch search)
        //{
        //    var query = _context.Posts.Include(x => x.User)
        //                .Include(x => x.Category)
        //                .Include(x => x.Images)
        //                .Include(x => x.ReadingLists)
        //                .Include(x => x.Comments)
        //                .Include(x => x.Ratings)
        //                .OnlyActive(search);


        //    if (!string.IsNullOrEmpty(search.Keyword))
        //    {
        //        query = query.Where(x => x.Title.ToLower().Contains(search.Keyword.ToLower()) || x.Content.ToLower().Contains(search.Keyword.ToLower()));
        //    }

        //    if (search.CategoryId.HasValue)
        //    {
        //        query = query.Where(x => x.CategoryId == search.CategoryId);
        //    }

        //    if (search.MinRating.HasValue)
        //    {
        //        query = query.Where(x => x.Ratings.Average(x => x.Rating) >= search.MinRating);
        //    }

        //    if (search.MaxRating.HasValue)
        //    {
        //        query = query.Where(x => x.Ratings.Average(x => x.Rating) <= search.MaxRating);
        //    }

        //    return query.Paged<PostDto, Domain.Post>(search, _mapper);
        //}
    }
}
