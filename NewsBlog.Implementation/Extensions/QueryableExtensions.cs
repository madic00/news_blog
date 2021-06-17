using AutoMapper;
using AutoMapper.QueryableExtensions;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries;
using NewsBlog.Application.Searches;
using NewsBlog.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Extensions
{
    public static class QueryableExtensions
    {
        public static PageResponse<TDto> Paged<TDto, TEntity>(
            this IQueryable<TEntity> query, PageSearch search, IMapper mapper)
            where TEntity : Entity
            where TDto : BaseDto
        {
            var skipCount = search.PerPage * (search.Page - 1);

            var skipped = query.Skip(skipCount).Take(search.PerPage);

            var response = new PageResponse<TDto>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = query.Count(),
                Items = skipped.ProjectTo<TDto>(mapper.ConfigurationProvider).ToList()
            };

            return response;
        }

        public static IQueryable<T> OnlyActive<T>(this IQueryable<T> query) where T : Entity
        {
            query = query.Where(x => x.IsActive == true);

            return query;
        }
    }
}
