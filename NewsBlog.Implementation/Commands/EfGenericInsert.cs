using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsBlog.Application;
using NewsBlog.EfDataAccess;
using NewsBlog.Domain;
using NewsBlog.Application.DataTransfer;

namespace NewsBlog.Implementation.Commands
{
    public abstract class EfGenericInsert<TDto, TEntity> : ICommand<TDto> 
        where TEntity : Entity
        where TDto : BaseDto
    {
        public abstract int Id { get; }

        public abstract string Name { get; }

        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly AbstractValidator<TDto> _validator;

        protected EfGenericInsert(NewsBlogContext context, IMapper mapper, AbstractValidator<TDto> validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public void Execute(TDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Set<TEntity>().Add(_mapper.Map<TEntity>(request));

            _context.SaveChanges();

        }
    }
}
