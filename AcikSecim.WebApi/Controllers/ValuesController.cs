using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AcikSecim.WebApi.Models;
using AcikSecim.WebApi.Models.DTOs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace AcikSecim.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private AcikSecimDBContext _apiDbContext;
        private IConfiguration _configuration;
        public ValuesController(IConfiguration configuration)
        {
            _configuration = configuration;
            _apiDbContext = new AcikSecimDBContext();
        }

        [HttpGet]
        [Route("adaylariGetir")]
        public ActionResult<IEnumerable<Adaylar>> Get()
        {
            List<Adaylar> adaylarListesi = _apiDbContext.Adaylar.ToList();
            return adaylarListesi;
        }
     

        [HttpPost]
        [Route("yeniKullaniciEkle")]
        public ActionResult KullaniciKayit([FromBody] Kullanicilar yeniKullanici)
        {
            _apiDbContext.Kullanicilar.Add(yeniKullanici);
            _apiDbContext.SaveChanges();

            return Ok();
        }

        [HttpPost]
        [Route("login")]
        public ActionResult Giris([FromBody] GirisDto kullanici)
        {
            var user = _apiDbContext.Kullanicilar.FirstOrDefault(k => k.Ad == kullanici.Adi || k.Soyad == kullanici.Soyadi);
            if (user == null)
            {
                return Unauthorized();
            }

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_configuration.GetSection("Appsettings:Token").Value);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.NameIdentifier, user.Id.ToString()),
                    new Claim(ClaimTypes.Name, user.Ad),
                    new Claim(ClaimTypes.Surname, user.Soyad)
                }),
                Expires = DateTime.Now.AddDays(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key),
                    SecurityAlgorithms.HmacSha512Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            var tokenString = tokenHandler.WriteToken(token);

            return Ok(tokenString);
        }


    }
}
