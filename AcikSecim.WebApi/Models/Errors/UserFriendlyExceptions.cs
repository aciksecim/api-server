using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AcikSecim.WebApi.Models.Errors
{
    public class UserFriendlyExceptions : Exception
    {
        public string Code { get; }

        protected UserFriendlyExceptions()
        {
        }

        public UserFriendlyExceptions(string code)
        {
            Code = code;
        }

        public UserFriendlyExceptions(string message, params object[] args)
            : this(string.Empty, message, args)
        {
        }

        public UserFriendlyExceptions(string code, string message, params object[] args)
            : this(null, code, message, args)
        {
        }

        public UserFriendlyExceptions(Exception innerException, string message, params object[] args)
            : this(innerException, string.Empty, message, args)
        {
        }

        public UserFriendlyExceptions(Exception innerException, string code, string message, params object[] args)
            : base(string.Format(message, args), innerException)
        {
            Code = code;
        }
    }
}
