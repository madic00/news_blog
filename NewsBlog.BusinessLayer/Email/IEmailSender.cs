using NewsBlog.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Application.Email
{
    public interface IEmailSender
    {
        void Send(SendEmailDto dto);
    }
}
