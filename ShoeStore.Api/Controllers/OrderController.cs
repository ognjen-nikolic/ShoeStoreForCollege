using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShoeStore.Application;
using ShoeStore.Application.Commands;
using ShoeStore.Application.DataTransfer;
using ShoeStore.Application.Queries;
using ShoeStore.Application.Searches;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ShoeStore.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public OrderController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }
        // GET: api/<OrderController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchOrder search, [FromServices] IOrdersGet query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<OrderController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IOrderGetOne query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<OrderController>
        [HttpPost]
        public IActionResult Post([FromBody] OrderAddDto dto, [FromServices] IOrderAddCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        [HttpPatch("changestatus")]
        public IActionResult ChangeStatus([FromBody] OrderStatusChangeDto dto, [FromServices] IOrderChangeStatusCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

    }
}
