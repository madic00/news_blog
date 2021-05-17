using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NewsBlog.BusinessLayer;
using NewsBlog.BusinessLayer.Commands;
using NewsBlog.BusinessLayer.DataTransfer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NewsBlog.Api.Controllers.User
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : Controller
    {
        private readonly UseCaseExecutor _executor;

        public RegisterController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        //POST: api/Register
        [HttpPost]
        public void Post(
            [FromBody] RegisterUserDto dto,
            [FromServices] IRegisterUserCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }

    }
}
