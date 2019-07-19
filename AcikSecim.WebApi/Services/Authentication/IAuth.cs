using AcikSecim.WebApi.Models;
using AcikSecim.WebApi.Models.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AcikSecim.WebApi.Services.Authentication
{
    public interface IAuth
    {
        // <summary>
        /// Get valid user
        /// </summary>
        /// <param name="loginModel">Name and surname</param>
        /// <returns>token</returns>
        Task<string> Login(GirisDto loginModel);
    }
}
