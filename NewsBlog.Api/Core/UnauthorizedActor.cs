using NewsBlog.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NewsBlog.Api.Core
{
    public class UnauthorizedActor : IApplicationActor
    {
        public int Id => 0;

        public string Identity => "Unregistred user";

        public bool IsAdmin => false;

        public IEnumerable<int> AllowedUseCases => new List<int> { 1, 61, 81 };
    }
}
