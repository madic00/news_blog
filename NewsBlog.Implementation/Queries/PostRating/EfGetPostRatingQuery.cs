using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.PostRating;
using NewsBlog.Application.Searches;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Queries.PostRating
{
    public class EfGetPostRatingsQuery : EfGenericGet<PostRatingSearch, Domain.PostRating, PostRatingDto>, IGetPostRatingsQuery
    {
        public EfGetPostRatingsQuery(NewsBlogContext context, IMapper mapper, IApplicationActor actor) : base(context, mapper, actor)
        {
        }

        public override int Id => (int)UseCasesEnum.EfGetPostRatingsQuery;

        public override string Name => "Get post ratings";

    }
}
