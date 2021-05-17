﻿using NewsBlog.BusinessLayer.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.BusinessLayer
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

            command.Execute(request);
        }

        public TResult ExecuteQuery<TSearch, TResult>(IQuery<TSearch, TResult> query, TSearch search)
        {
            _logger.Log(query, _actor, search);

            //if (!_actor.AllowedUseCases.Contains(query.Id))
            //{
            //    throw new UnauthorizedUseCaseException(query, _actor);
            //}

            return query.Execute(search);

        }
    }
}