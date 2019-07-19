using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AcikSecim.WebApi.Models;
using AcikSecim.WebApi.Models.Errors;

namespace AcikSecim.WebApi.Services.User
{
    public class UserService : IUser
    {
        private AcikSecimDBContext _apiDbContext;

        public UserService(AcikSecimDBContext apiDbContext)
        {
            _apiDbContext = apiDbContext;
        }

        public async Task<bool> AddNewUser(Kullanicilar user)
        {
            try
            {
                _apiDbContext.Kullanicilar.Add(user);
                var result = _apiDbContext.SaveChanges();

                if (result == 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw new UserFriendlyExceptions("400", $"{ex.Message}", ex.StackTrace);
            }
        }
    }
}
