using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AcikSecim.WebApi.Models;
using AcikSecim.WebApi.Models.DTOs;
using AcikSecim.WebApi.Models.Errors;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace AcikSecim.WebApi.Services.Authentication
{
    public class AuthService : IAuth
    {
        private AcikSecimDBContext _apiDbContext;
        private IConfiguration _configuration;

        public AuthService(IConfiguration configuration)
        {
            _configuration = configuration;
            _apiDbContext = new AcikSecimDBContext();
        }

        public async Task<string> Login(GirisDto loginModel)
        {
            try
            {
                var user = _apiDbContext.Kullanicilar.FirstOrDefault(k => k.Ad == loginModel.Adi || k.Soyad == loginModel.Soyadi);
                if (user == null)
                {
                    return string.Empty;
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

                return tokenString;
            }
            catch (Exception ex)
            {
                throw new UserFriendlyExceptions("400", $"{ex.Message}", ex.StackTrace);
            }
        }
    }
}
