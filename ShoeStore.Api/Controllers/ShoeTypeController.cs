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
    [Route("api/[controller]")]
    [ApiController]
    public class ShoeTypeController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public ShoeTypeController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }
        // GET: api/<ShoeTypeController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchPropertyName search, [FromServices] IShoeTypesGet query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<ShoeTypeController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IShoeTypeGetOne query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<ShoeTypeController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] ShoeTypeDto dto, [FromServices] IShoeTypeAddCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<ShoeTypeController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] ShoeTypeDto dto, [FromServices] IShoeTypeUpdateCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<ShoeTypeController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IShoeTypeDeleteCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
