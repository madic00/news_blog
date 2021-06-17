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
    public class UserProfile : Profile
    {
        private readonly IApplicationActor _actor;

        public UserProfile(IApplicationActor actor)
        {
            _actor = actor;

            CreateMap<User, UserDto>();
            CreateMap<UserDto, User>();

            CreateMap<User, AdminCreateUserDto>();
            CreateMap<AdminCreateUserDto, User>()
                .ForMember(x => x.Password, x => x.MapFrom(y => BCrypt.Net.BCrypt.HashPassword(y.Password)));

            CreateMap<CreateUserDto, User>()
                .ForMember(x => x.Password, x => x.MapFrom(y => BCrypt.Net.BCrypt.HashPassword(y.Password)))
                .ForMember(x => x.Id, x => x.MapFrom(u => _actor.Id));

            CreateMap<User, CreateUserDto>();
        }

    }
}
