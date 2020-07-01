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
    [Route("api/[controller]")]
    [ApiController]
    public class GenderController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public GenderController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }
        // GET: api/<GenderController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchPropertyName search, [FromServices] IGendersGet query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<GenderController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IGenderGetOne query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<GenderController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] GenderDto dto, [FromServices] IGenderAddCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<GenderController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] GenderDto dto, [FromServices] IGenderUpdateCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<GenderController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IGenderDeleteCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
