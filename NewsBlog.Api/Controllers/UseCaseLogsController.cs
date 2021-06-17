using Microsoft.AspNetCore.Mvc;
using NewsBlog.Application;
using NewsBlog.Application.Queries.UseCaseLogs;
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
    public class UseCaseLogsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UseCaseLogsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<UseCaseLogsController>
        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseLogSearch search, [FromServices] IGetUseCaseLogsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET api/<UseCaseLogsController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGetUseCaseLogQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

    }
}
