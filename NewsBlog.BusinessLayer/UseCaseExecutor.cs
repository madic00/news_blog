using NewsBlog.Application.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application
{
    public class UseCaseExecutor
    {
        private readonly IApplicationActor _actor;
        private readonly IUseCaseLogger _logger;

        public UseCaseExecutor(IApplicationActor actor, IUseCaseLogger logger)
        {
            _actor = actor;
            _logger = logger;
        }

        public virtual void ExecuteCommand<TRequest>(ICommand<TRequest> command, TRequest request)
        {
           
            _logger.Log(command, _actor, request);

            if (_actor.AllowedUseCases.Contains(command.Id) || _actor.IsAdmin)
            {
                command.Execute(request);
            } else
            {
                throw new UnauthorizedUseCaseException(command, _actor);
            }

        }

        public TResult ExecuteQuery<TResult, TSearch>(IQuery<TResult, TSearch> query, TSearch search)
        {
            _logger.Log(query, _actor, search);

            if (_actor.AllowedUseCases.Contains(query.Id) || _actor.IsAdmin)
            {
                return query.Execute(search);
            }
            
            throw new UnauthorizedUseCaseException(query, _actor);

        }
    }
}
