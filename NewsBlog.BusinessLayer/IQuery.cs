using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application
{
    public interface IQuery<TResult, TSearch> : IUseCase
    {
        TResult Execute(TSearch search);
    }
}
