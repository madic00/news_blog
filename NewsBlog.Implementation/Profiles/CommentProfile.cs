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
    public class CommentProfile : Profile
    {
        private readonly IApplicationActor _actor;

        public CommentProfile(IApplicationActor actor)
        {
            _actor = actor;

            CreateMap<Comment, CommentDto>();
            CreateMap<CommentDto, Comment>()
                .ForMember(x => x.UserId, y => y.MapFrom(y => _actor.Id));
        }
    }
}
