using AutoMapper;
using NewsBlog.Application.Commands.PostRating;
using NewsBlog.Application.DataTransfer;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators.PostRating;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.PostRating
{
    public class EfUpdatePostRatingCommand : EfGenericUpdate<PostRatingDto, Domain.PostRating>, IUpdatePostRatingCommand
    {
        public EfUpdatePostRatingCommand(NewsBlogContext context, IMapper mapper, UpdatePostRatingValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfUpdatePostRatingCommand;

        public override string Name => "Update post rating";
    }
}
