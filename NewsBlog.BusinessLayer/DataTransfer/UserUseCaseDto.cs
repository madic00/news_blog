using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class UserUseCaseDto : BaseDto
    {
        public int UserId { get; set; }

        public int UseCaseId { get; set; }
    }
}
