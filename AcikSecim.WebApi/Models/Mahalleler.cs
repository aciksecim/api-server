using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Mahalleler
    {
        public Mahalleler()
        {
            Kullanicilar = new HashSet<Kullanicilar>();
            Sandiklar = new HashSet<Sandiklar>();
        }

        public int Id { get; set; }
        public int? IlceId { get; set; }
        public string MahalleAdi { get; set; }

        public virtual Ilceler Ilce { get; set; }
        public virtual ICollection<Kullanicilar> Kullanicilar { get; set; }
        public virtual ICollection<Sandiklar> Sandiklar { get; set; }
    }
}
