using System;
using System.Collections.Generic;

namespace AcikSecim.WebApi.Models
{
    public partial class Oturumlar
    {
        public long Id { get; set; }
        public long? KullaniciId { get; set; }
        public DateTime? OturumZamani { get; set; }
        public string OturumIp { get; set; }
        public string OturumTarayicisi { get; set; }

        public virtual Kullanicilar Kullanici { get; set; }
    }
}
