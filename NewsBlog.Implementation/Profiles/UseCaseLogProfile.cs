using AutoMapper;
using NewsBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Profiles
{
    public class UseCaseLogProfile : Profile
    {
        public UseCaseLogProfile()
        {
            CreateMap<Domain.UseCaseLog, UseCaseLogDto>();
            CreateMap<UseCaseLogDto, Domain.UseCaseLog>();
        }
    }
}
