using AutoMapper;
using Microsoft.EntityFrameworkCore;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Exceptions;
using NewsBlog.Application.Queries.Categories;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.Categories
{
    public class EfGetOneCategoryQuery : EfGenericGetSingle<Domain.Category, CategoryDto>, IGetOneCategoryQuery
    {
        public EfGetOneCategoryQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOneCategoryQuery;

        public override string Name => "Get one category";

    }
}
