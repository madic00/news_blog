using AutoMapper;
using NewsBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Profiles
{
    public class PostTagProfile : Profile
    {
        public PostTagProfile()
        {
            CreateMap<Domain.PostTag, PostTagDto>();
            CreateMap<PostTagDto, Domain.PostTag>();
        }
    }
}
