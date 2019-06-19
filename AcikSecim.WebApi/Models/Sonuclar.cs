using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Sonuclar
    {
        public int Id { get; set; }
        public long? KullaniciId { get; set; }
        public long? SandikId { get; set; }
        public int? AdayId { get; set; }
        public int? OySayisi { get; set; }

        public virtual Adaylar Aday { get; set; }
        public virtual Kullanicilar Kullanici { get; set; }
        public virtual Sandiklar Sandik { get; set; }
    }
}
