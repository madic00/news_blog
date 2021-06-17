using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.DataTransfer
{
    public class SendEmailDto
    {
        public string Subject { get; set; }

        public string Content { get; set; }

        public string SendFrom { get; set; }
    }
}
