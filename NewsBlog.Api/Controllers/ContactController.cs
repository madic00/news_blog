using Microsoft.AspNetCore.Mvc;
using NewsBlog.Application;
using NewsBlog.Application.Commands;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Email;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace NewsBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public ContactController(UseCaseExecutor executor)
        {
            _executor = executor;
        }


        // POST api/<ContactController>
        [HttpPost]
        public IActionResult Post([FromBody] SendEmailDto dto, [FromServices] IContactCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return Ok();
        }

        // PUT api/<ContactController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ContactController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
