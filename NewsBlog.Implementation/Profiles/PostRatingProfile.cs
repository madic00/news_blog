using AutoMapper;
using NewsBlog.Application;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Profiles
{
    public class PostRatingProfile : Profile
    {
        private readonly IApplicationActor _actor;

        public PostRatingProfile(IApplicationActor actor)
        {
            _actor = actor;

            CreateMap<PostRatingDto, PostRating>()
                .ForMember(x => x.UserId, y => y.MapFrom(u => _actor.Id));

            CreateMap<PostRating, PostRatingDto>();
        }
    }
}
