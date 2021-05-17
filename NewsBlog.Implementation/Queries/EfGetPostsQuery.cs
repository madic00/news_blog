using AutoMapper;
using Microsoft.EntityFrameworkCore;
using NewsBlog.BusinessLayer.DataTransfer;
using NewsBlog.BusinessLayer.Queries;
using NewsBlog.BusinessLayer.Searches;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries
{
    public class EfGetPostsQuery : IGetPostsQuery
    {
        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;

        public EfGetPostsQuery(NewsBlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 10;

        public string Name => "Get posts using EF";

        public PageResponse<PostDto> Execute(PostSearch search)
        {
            var query = _context.Posts.Include(x => x.User).Include(x => x.Category).AsQueryable();

            if(!string.IsNullOrEmpty(search.Title) || !string.IsNullOrEmpty(search.Title))
            {
                query = query.Where(x => x.Title.ToLower().Contains(search.Title.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Content) || !string.IsNullOrEmpty(search.Content))
            {
                query = query.Where(x => x.Content.ToLower().Contains(search.Content.ToLower()));
            }

            if(search.CategoryId != 0)
            {
                query = query.Where(x => x.CategoryId == search.CategoryId);
            }

            return query.Paged<PostDto, Domain.Post>(search, _mapper);
        }
    }
}
