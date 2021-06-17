﻿using NewsBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Queries.Users
{
    public interface IGetOneUserQuery : IQuery<UserDto, int>
    {
    }
}
