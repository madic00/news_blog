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
    public class EfCreatePostRatingCommand : EfGenericInsert<PostRatingDto, Domain.PostRating>, ICreatePostRatingCommand
    {
        public EfCreatePostRatingCommand(NewsBlogContext context, IMapper mapper, CreatePostRatingValidator validator) : base(context, mapper, validator)
        {
        }

        public override int Id => (int)UseCasesEnum.EfCreatePostRatingCommand;

        public override string Name => "Create post rating";
    }
}
