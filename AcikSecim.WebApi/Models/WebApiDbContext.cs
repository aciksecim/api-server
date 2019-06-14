using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace AcikSecim.WebApi.Models
{
    public class WebApiDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseNpgsql(
                "User ID=postgres; Password=123456; Server=172.17.0.2; Port=5432; Database=AcikSecimDB; Integrated Security=true;");
        }
    }
}
