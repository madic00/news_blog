using AutoMapper;
using Doublel.QueryableBuilder;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries;
using NewsBlog.Application.Searches;
using NewsBlog.Domain;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries
{
    public abstract class EfGenericGet<TSearch, T, TDto> : IQuery<PageResponse<TDto>, TSearch>
        where T : Entity
        where TDto : BaseDto
        where TSearch : PageSearch
    {
        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;

        public abstract int Id { get; }
        public abstract string Name { get; }

        //protected EfGenericGet(NewsBlogContext context, IMapper mapper)
        //{
        //    _context = context;
        //    _mapper = mapper;
        //}

        protected EfGenericGet(NewsBlogContext context, IMapper mapper, IApplicationActor actor)
        {
            _context = context;
            _mapper = mapper;
            _actor = actor;
        }

        public PageResponse<TDto> Execute(TSearch search)
        {
            var query = _context.Set<T>().AsQueryable();
            query = query.BuildQuery(search);

            if(!_actor.IsAdmin)
            {
                query.OnlyActive();
            }

            return query.Paged<TDto, T>(search, _mapper);
        }
    }
}
