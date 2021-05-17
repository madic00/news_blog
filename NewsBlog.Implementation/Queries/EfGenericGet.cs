using AutoMapper;
using NewsBlog.BusinessLayer;
using NewsBlog.BusinessLayer.DataTransfer;
using NewsBlog.BusinessLayer.Searches;
using NewsBlog.Domain;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries
{
    public abstract class EfGenericGet<TSearch, T, TDto> : IQuery<TSearch, IEnumerable<TDto>>
        where T : Entity
        where TDto : BaseDto
        where TSearch : PageSearch
    {
        public abstract int Id { get; }
        public abstract string Name { get; }

        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;

        public IEnumerable<TDto> Execute(TSearch search)
        {
            var items = _context.Set<T>().ToList();

            return _mapper.Map<IEnumerable<TDto>>(items);

        }
    }
}
