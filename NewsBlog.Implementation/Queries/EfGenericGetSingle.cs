using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Exceptions;
using NewsBlog.Domain;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries
{
    public abstract class EfGenericGetSingle<T, TDto> : IQuery<TDto, int>
        where T : Entity
        where TDto : BaseDto
    {
        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;

        protected EfGenericGetSingle(NewsBlogContext context, IMapper mapper, IApplicationActor actor)
        {
            _context = context;
            _mapper = mapper;
            _actor = actor;
        }

        public abstract int Id { get; }

        public abstract string Name { get; }

        public TDto Execute(int id)
        {
            var row = _context.Set<T>().FirstOrDefault(x => x.Id == id);

            if(row == null)
            {
                throw new EntityNotFoundException(id, typeof(T));
            }

            if(row.IsActive == false && !_actor.IsAdmin)
            {
                throw new EntityNotFoundException(id, typeof(T));
            }

            return _mapper.Map<TDto>(row);
        }
    }
}
