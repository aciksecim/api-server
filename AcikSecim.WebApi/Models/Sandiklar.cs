using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Sandiklar
    {
        public Sandiklar()
        {
            SandikDurumu = new HashSet<SandikDurumu>();
            Sonuclar = new HashSet<Sonuclar>();
            Tutanaklar = new HashSet<Tutanaklar>();
        }

        public long Id { get; set; }
        public int SandikNo { get; set; }
        public int? MahalleId { get; set; }

        public virtual Mahalleler Mahalle { get; set; }
        public virtual ICollection<SandikDurumu> SandikDurumu { get; set; }
        public virtual ICollection<Sonuclar> Sonuclar { get; set; }
        public virtual ICollection<Tutanaklar> Tutanaklar { get; set; }
    }
}
