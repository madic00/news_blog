﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Domain
{
    public class UseCaseLog : Entity
    {
        public string UseCaseName { get; set; }

        public string Data { get; set; }

        public string Actor { get; set; }

    }
}
