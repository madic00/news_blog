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
    public class PostProfile : Profile
    {
        private readonly IApplicationActor _actor;

        public PostProfile(IApplicationActor actor)
        {
            _actor = actor;

            CreateMap<Post, PostDto>();
            CreateMap<PostDto, Post>();

            CreateMap<CreatePostDto, Post>()
                .ForMember(x => x.UserId, x => x.MapFrom(y => _actor.Id))
                .ForMember(x => x.PostTags, x => x.MapFrom(y => y.PostTags.Select(x => new PostTag
                {
                    TagId = x
                })));

            CreateMap<Post, CreatePostDto>();
        }

    }
}