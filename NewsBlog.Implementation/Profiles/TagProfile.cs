using AutoMapper;
using NewsBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Profiles
{
    public class TagProfile : Profile
    {
        public TagProfile()
        {
            CreateMap<Domain.Tag, TagDto>();
            CreateMap<TagDto, Domain.Tag>();
        }
    }
}
