using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Sehirler
    {
        public Sehirler()
        {
            Ilceler = new HashSet<Ilceler>();
        }

        public int Id { get; set; }
        public string SehirAdi { get; set; }

        public virtual ICollection<Ilceler> Ilceler { get; set; }
    }
}
