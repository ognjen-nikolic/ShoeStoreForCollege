using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ShoeStore.Api.Core;
using ShoeStore.Application.DataTransfer;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ShoeStore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly JwtManager manager;

        public LoginController(JwtManager manager)
        {
            this.manager = manager;
        }
        // POST api/<LoginController>
        [HttpPost]
        public IActionResult Post([FromBody] LoginRequest dto)
        {
            var token = manager.MakeToken(dto.Username, dto.Password);

            if (token == null)
            {
                return Unauthorized();
            }

            return Ok(new { token });
        }

    }
}
