using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Ilceler
    {
        public Ilceler()
        {
            Mahalleler = new HashSet<Mahalleler>();
        }

        public int Id { get; set; }
        public int? SehirId { get; set; }
        public string IlceAdi { get; set; }

        public virtual Sehirler Sehir { get; set; }
        public virtual ICollection<Mahalleler> Mahalleler { get; set; }
    }
}
