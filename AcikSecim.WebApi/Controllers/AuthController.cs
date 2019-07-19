using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AcikSecim.WebApi.Models.DTOs;
using AcikSecim.WebApi.Services.Authentication;
using Microsoft.AspNetCore.Mvc;

namespace AcikSecim.WebApi.Controllers
{
    [Route("api/[controller]")]
    public class AuthController : Controller
    {
        private IAuth _auth;

        public AuthController(IAuth auth)
        {
            _auth = auth;
        }

        [HttpPost("login")]
        public async Task<ActionResult> Giris([FromBody] GirisDto kullanici)
        {
            if (ModelState.IsValid)
            {
                var result = await _auth.Login(kullanici);

                if (!string.IsNullOrEmpty(result))
                {
                    return Ok(result);
                }
                else
                {
                    return Unauthorized();
                }
            }
            else
            {
                return Unauthorized();
            }
        }
    }
}