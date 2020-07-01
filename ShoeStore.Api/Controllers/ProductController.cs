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
    public class ProductController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public ProductController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }
        // GET: api/<ProductController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchProduct search, [FromServices] IProductsGet query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        // GET api/<ProductController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id, [FromServices] IProductGetOne query)
        {
            return Ok(executor.ExecuteQuery(query, id));
        }

        // POST api/<ProductController>
        [HttpPost]
        [Authorize]
        public IActionResult Post([FromBody] ProductChangeDto dto, [FromServices] IProductAddCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<ProductController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] ProductChangeDto dto, [FromServices] IProductUpdateCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<ProductController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IProductDeleteCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
