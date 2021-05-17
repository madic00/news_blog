using NewsBlog.BusinessLayer;
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

        public IEnumerable<int> AllowedUseCases => new List<int> { 6 };
    }
}
