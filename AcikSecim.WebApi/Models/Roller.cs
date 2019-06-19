using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Roller
    {
        public Roller()
        {
            Kullanicilar = new HashSet<Kullanicilar>();
        }

        public int Id { get; set; }
        public string RolAdi { get; set; }
        public int Haklari { get; set; }

        public virtual ICollection<Kullanicilar> Kullanicilar { get; set; }
    }
}
