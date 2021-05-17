using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsBlog.BusinessLayer;
using NewsBlog.EfDataAccess;
using NewsBlog.Domain;
using NewsBlog.BusinessLayer.DataTransfer;

namespace NewsBlog.Implementation.Commands
{
    public abstract class EfGenericInsert<T, TEntity> : ICommand<T> 
        where TEntity : Entity
        where T : BaseDto
    {
        public abstract int Id { get; }

        public abstract string Name { get; }

        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly AbstractValidator<T> _validator;

        protected EfGenericInsert(NewsBlogContext context, IMapper mapper, AbstractValidator<T> validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        protected EfGenericInsert(NewsBlogContext context)
        {
            _context = context;
        }

        public void Execute(T request)
        {
            _validator.ValidateAndThrow(request);

            _context.Set<TEntity>().Add(_mapper.Map<TEntity>(request));

            _context.SaveChanges();

        }
    }
}
