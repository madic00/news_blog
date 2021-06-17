using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.PostRating;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.PostRating
{
    public class EfGetOnePostRatingQuery : EfGenericGetSingle<Domain.PostRating, PostRatingDto>, IGetOnePostRatingQuery
    {
        public EfGetOnePostRatingQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetOnePostRatingQuery;

        public override string Name => "Get one post rating";
    }
}
