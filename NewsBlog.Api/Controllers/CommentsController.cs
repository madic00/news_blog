using Microsoft.AspNetCore.Mvc;
using NewsBlog.Application;
using NewsBlog.Application.Commands.Comments;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.Comments;
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
    public class CommentsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public CommentsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<CommentsController>
        [HttpGet]
        public IActionResult Get([FromQuery] CommentSearch search, [FromServices] IGetCommentsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<CommentsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOneCommentQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<CommentsController>
        [HttpPost]
        public IActionResult Post([FromBody] CommentDto dto, [FromServices] ICreateCommentCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<CommentsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] CommentDto dto, [FromServices] IUpdateCommentCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<CommentsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCommentCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
