using NewsBlog.Application.Commands;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Email;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands
{
    public class EfContactCommand : IContactCommand
    {
        private readonly IEmailSender _sender;

        public EfContactCommand(IEmailSender sender)
        {
            _sender = sender;
        }

        public int Id => (int)UseCasesEnum.EfContactCommand;

        public string Name => "Contact through form";

        public void Execute(SendEmailDto request)
        {
            _sender.Send(request);
        }
    }
}
