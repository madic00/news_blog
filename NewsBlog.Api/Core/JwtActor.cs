using NewsBlog.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NewsBlog.Api.Core
{
    public class JwtActor : IApplicationActor
    {
        public int Id { get; set; }

        public string Identity { get; set; }

        public bool IsAdmin { get; set; }

        public IEnumerable<int> AllowedUseCases { get; set; }
    }
}
