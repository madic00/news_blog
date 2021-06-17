using AutoMapper;
using Microsoft.EntityFrameworkCore;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries;
using NewsBlog.Application.Queries.Categories;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Categories
{
    public class EfGetCategoriesQuery : EfGenericGet<CategorySearch, Domain.Category, CategoryDto>, IGetCategoriesQuery
    {
        public EfGetCategoriesQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetCategoriesQuery;

        public override string Name => "Get categories";

        //public PageResponse<CategoryDto> Execute(CategorySearch search)
        //{
        //    var query = _context.Categories.Include(x => x.Posts)
        //                .OnlyActive(search);

        //    if(!string.IsNullOrEmpty(search.Name))
        //    {
        //        query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
        //    }

        //    return query.Paged<CategoryDto, Domain.Category>(search, _mapper);
        //}
    }
}
