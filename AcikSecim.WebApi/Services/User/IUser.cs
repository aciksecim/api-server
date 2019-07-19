using AcikSecim.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AcikSecim.WebApi.Services.User
{
    public interface IUser
    {
        // <summary>
        /// Add new user
        /// </summary>
        /// <param name="user">"Kullanicilar" model</param>
        /// <returns>Candidate List</returns>
        Task<bool> AddNewUser(Kullanicilar user);
    }
}
