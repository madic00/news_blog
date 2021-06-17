using Microsoft.AspNetCore.Mvc;
using NewsBlog.Application;
using NewsBlog.Application.Commands.Tags;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.Tags;
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
    public class TagsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public TagsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<TagsController>
        [HttpGet]
        public IActionResult Get([FromQuery] TagSearch search, [FromServices] IGetTagsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<TagsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneTagQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<TagsController>
        [HttpPost]
        public IActionResult Post([FromBody] TagDto dto, [FromServices] ICreateTagCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<TagsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] TagDto dto, [FromServices] IUpdateTagCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<TagsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteTagCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
