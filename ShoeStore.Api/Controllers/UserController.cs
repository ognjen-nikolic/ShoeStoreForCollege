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
    public class UserController : ControllerBase
    {
        private readonly UseCaseExecutor executor;

        public UserController(UseCaseExecutor executor)
        {
            this.executor = executor;
        }

        // GET: api/<UserController>
        [HttpGet]
        public IActionResult Get([FromQuery] SearchUser search , [FromServices] IGetUsers query)
        {
            return Ok(executor.ExecuteQuery(query,search));
        }

        // GET api/<UserController>/5
        [HttpGet("{id}")]
        public IActionResult Get(int id,[FromServices] IUserGetOne query)
        {
           return Ok(executor.ExecuteQuery(query,id));
        }

        // POST api/<UserController>
        [HttpPost]
        public IActionResult Post([FromBody] UserAddDto dto, [FromServices] IUserAddCommand command)
        {
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT api/<UserController>/5
        [HttpPut("{id}")]
        [Authorize]
        public IActionResult Put(int id, [FromBody] EditUserDto dto , [FromServices] IUserEditCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        [HttpPut("adminchangeuser/{id}")]
        [Authorize]
        public IActionResult AdminChangeUser(int id, [FromBody] UserAddDto dto, [FromServices] IUserEditAdminCommand command)
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE api/<UserController>/5
        [HttpDelete("{id}")]
        [Authorize]
        public IActionResult Delete(int id, [FromServices] IUserDeleteCommand command)
        {
            executor.ExecuteCommand(command,id);
            return NoContent();
        }
    }
}
