using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AcikSecim.WebApi.Models;
using AcikSecim.WebApi.Services.User;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AcikSecim.WebApi.Controllers
{
    [Route("api/[controller]")]
    public class UserController : Controller
    {
        private IUser _user;

        public UserController(IUser user)
        {
            _user = user;
        }

        [HttpPost("addNewUser")]
        public async Task<ActionResult> KullaniciKayit([FromBody] Kullanicilar yeniKullanici)
        {
            return Ok(_user.AddNewUser(yeniKullanici));
        }
    }
}