using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Queries.UserUseCases
{
    public interface IGetUserUseCasesQuery : IQuery<PageResponse<UserUseCaseDto>, UserUseCaseSearch>
    {

    }
}
