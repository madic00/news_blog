using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NewsBlog.Application;
using NewsBlog.Application.Exceptions;
using NewsBlog.EfDataAccess;
using NewsBlog.Domain;

namespace NewsBlog.Implementation.Commands
{
    public abstract class EfGenericDelete<TEntity> : ICommand<int>
        where TEntity : Entity 
    {
        public abstract int Id { get; }

        public abstract string Name { get; }

        private readonly NewsBlogContext _context;

        protected EfGenericDelete(NewsBlogContext context)
        {
            _context = context;
        }

        public void Execute(int request)
        {
            var item = _context.Set<TEntity>().Find(request);

            if(item == null)
            {
                throw new EntityNotFoundException(request, typeof(TEntity));
            }

            //_context.Set<TEntity>().Remove(item);

            item.IsActive = false;

            _context.SaveChanges();

        }
    }
}
