using Microsoft.AspNetCore.Mvc;
using NewsBlog.Application;
using NewsBlog.Application.Commands.UserUseCases;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.UserUseCases;
using NewsBlog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace NewsBlog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserUseCasesController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UserUseCasesController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<UserUseCasesController>
        [HttpGet]
        public IActionResult Get([FromQuery] UserUseCaseSearch search, [FromServices] IGetUserUseCasesQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<UserUseCasesController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneUserUseCaseQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<UserUseCasesController>
        [HttpPost]
        public IActionResult Post([FromBody] UserUseCaseDto dto, [FromServices] ICreateUserUseCaseCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<UserUseCasesController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserUseCaseDto dto, [FromServices] IUpdateUserUseCaseCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<UserUseCasesController>/5
        [HttpDelete]
        public IActionResult Delete(int id, [FromServices] IDeleteUserUseCaseCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
