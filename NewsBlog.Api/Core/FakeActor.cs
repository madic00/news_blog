using NewsBlog.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NewsBlog.UserInterface.Core
{
    public class FakeActor : IApplicationActor
    {
        public int Id => 1;

        public string Identity => "Test web user";

        public IEnumerable<int> AllowedUseCases => new List<int> { 1 };

        public bool IsAdmin => false;
    }

    public class AdminFakeActor : IApplicationActor
    {
        public int Id => 2;

        public string Identity => "Test admin web user";

        public IEnumerable<int> AllowedUseCases => Enumerable.Range(1, 10000);

        public bool IsAdmin => false;
    }
}
