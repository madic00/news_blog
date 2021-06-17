using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class UseCaseLogDto : BaseDto
    {
        public string UseCaseName { get; set; }

        public string Data { get; set; }

        public int ActorId { get; set; }

    }
}
