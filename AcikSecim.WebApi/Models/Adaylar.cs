using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Adaylar
    {
        public Adaylar()
        {
            Sonuclar = new HashSet<Sonuclar>();
        }

        public int Id { get; set; }
        public string Ad { get; set; }
        public string Ad2 { get; set; }
        public string Partisi { get; set; }
        public string Ittifaki { get; set; }
        public string Soyad { get; set; }

        public virtual ICollection<Sonuclar> Sonuclar { get; set; }
    }
}
