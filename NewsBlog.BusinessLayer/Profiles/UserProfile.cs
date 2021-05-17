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
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<RegisterUserDto, User>();
            CreateMap<User, RegisterUserDto>();

            CreateMap<User, UserDto>();
            CreateMap<UserDto, User>();
        }

    }
}
