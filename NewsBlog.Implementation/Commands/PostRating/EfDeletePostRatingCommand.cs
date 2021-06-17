using NewsBlog.Application.Commands.PostRating;
using NewsBlog.EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.PostRating
{
    public class EfDeletePostRatingCommand : EfGenericDelete<Domain.PostRating>, IDeletePostRatingCommand
    {
        public EfDeletePostRatingCommand(NewsBlogContext context) : base(context)
        {
        }

        public override int Id => (int)UseCasesEnum.EfDeletePostRatingCommand;

        public override string Name => "Delete post rating";

    }
}
