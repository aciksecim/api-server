using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class SandikDurumu
    {
        public int Id { get; set; }
        public long? SandikId { get; set; }
        public long? KullaniciId { get; set; }
        public int? GecerliOySayisi { get; set; }
        public int? GecersizOySayisi { get; set; }
        public int? ToplamSecmenSayisi { get; set; }

        public virtual Kullanicilar Kullanici { get; set; }
        public virtual Sandiklar Sandik { get; set; }
    }
}
