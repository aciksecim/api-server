using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Tutanaklar
    {
        public long Id { get; set; }
        public long? SandikId { get; set; }
        public long? KullaniciId { get; set; }
        public string Resim { get; set; }
        public DateTime? GonderilmeTarihi { get; set; }
        public bool? OnayliMi { get; set; }
        public DateTime? OnayTarihi { get; set; }
        public long? OnaylayanId { get; set; }

        public virtual Kullanicilar Kullanici { get; set; }
        public virtual Kullanicilar Onaylayan { get; set; }
        public virtual Sandiklar Sandik { get; set; }
    }
}
