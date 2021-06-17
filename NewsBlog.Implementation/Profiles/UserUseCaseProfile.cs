using AutoMapper;
using NewsBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Profiles
{
    public class UserUseCaseProfile : Profile
    {
        public UserUseCaseProfile()
        {
            CreateMap<Domain.UserUseCase, UserUseCaseDto>();
            CreateMap<UserUseCaseDto, Domain.UserUseCase>();
        }
    }
}
