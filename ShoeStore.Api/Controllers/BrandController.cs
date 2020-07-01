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
    public class BrandController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public BrandController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }
        // GET: api/<BrandController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchPropertyName search, [FromServices] IBrandsGet query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<BrandController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IBrandGetOne query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<BrandController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] BrandDto dto, [FromServices] IBrandAddCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<BrandController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] BrandDto dto, [FromServices] IBrandUpdateCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<BrandController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IBrandDeleteCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
