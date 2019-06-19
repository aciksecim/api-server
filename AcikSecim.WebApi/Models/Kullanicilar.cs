using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Kullanicilar
    {
        public Kullanicilar()
        {
            Oturumlar = new HashSet<Oturumlar>();
            SandikDurumu = new HashSet<SandikDurumu>();
            Sonuclar = new HashSet<Sonuclar>();
            TutanaklarKullanici = new HashSet<Tutanaklar>();
            TutanaklarOnaylayan = new HashSet<Tutanaklar>();
        }

        public long Id { get; set; }
        public string Ad { get; set; }
        public string Ad2 { get; set; }
        public string Soyad { get; set; }
        public string TcNo { get; set; }
        public string Email { get; set; }
        public string TelNo { get; set; }
        public int? Durum { get; set; }
        public DateTime? KayitTarihi { get; set; }
        public int? KullaniciPuani { get; set; }
        public int? MahalleId { get; set; }
        public int? RolId { get; set; }

        public virtual Mahalleler Mahalle { get; set; }
        public virtual Roller Rol { get; set; }
        public virtual ICollection<Oturumlar> Oturumlar { get; set; }
        public virtual ICollection<SandikDurumu> SandikDurumu { get; set; }
        public virtual ICollection<Sonuclar> Sonuclar { get; set; }
        public virtual ICollection<Tutanaklar> TutanaklarKullanici { get; set; }
        public virtual ICollection<Tutanaklar> TutanaklarOnaylayan { get; set; }
    }
}
