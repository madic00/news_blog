using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using NewsBlog.BusinessLayer;
using NewsBlog.BusinessLayer.DataTransfer;
using NewsBlog.BusinessLayer.Exceptions;
using NewsBlog.EfDataAccess;
using NewsBlog.Domain;

namespace NewsBlog.Implementation.Commands
{
    public abstract class EfGenericUpdate<T, TEntity> : ICommand<T>
        where TEntity : Entity
        where T : BaseDto
    {
        public abstract int Id { get; }
        public abstract string Name { get; }

        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly AbstractValidator<T> _validator;

        protected EfGenericUpdate(NewsBlogContext context, IMapper mapper, AbstractValidator<T> validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        protected EfGenericUpdate(NewsBlogContext context)
        {
            _context = context;
        }

        public void Execute(T request)
        {
            _validator.ValidateAndThrow(request);

            var item = _context.Set<TEntity>().Find(request.Id);

            if(item == null)
            {
                throw new EntityNotFoundException(request.Id, request.GetType());
            }
            
            _mapper.Map(request, item);

            _context.SaveChanges();

        }
    }
}
