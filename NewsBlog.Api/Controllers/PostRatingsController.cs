using Microsoft.AspNetCore.Mvc;
using NewsBlog.Application;
using NewsBlog.Application.Commands.PostRating;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Queries.PostRating;
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
    public class PostRatingsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public PostRatingsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<PostRatingsController>
        [HttpGet]
        public IActionResult Get([FromQuery] PostRatingSearch search, [FromServices] IGetPostRatingsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<PostRatingsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetOnePostRatingQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST api/<PostRatingsController>
        [HttpPost]
        public IActionResult Post([FromBody] PostRatingDto dto, [FromServices] ICreatePostRatingCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        // PUT api/<PostRatingsController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] PostRatingDto dto, [FromServices] IUpdatePostRatingCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<PostRatingsController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePostRatingCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
