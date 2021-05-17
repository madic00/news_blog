using AutoMapper;
using NewsBlog.BusinessLayer.DataTransfer;
using NewsBlog.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.BusinessLayer.Profiles
{
    public class PostProfile : Profile
    {
        public PostProfile()
        {
            CreateMap<Post, PostDto>();
            CreateMap<PostDto, Post>();
        }

    }
}
