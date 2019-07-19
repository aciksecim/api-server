using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace AcikSecim.WebApi.Models
{
    public partial class AcikSecimDBContext : DbContext
    {

        public virtual DbSet<Adaylar> Adaylar { get; set; }
        public virtual DbSet<Ilceler> Ilceler { get; set; }
        public virtual DbSet<Kullanicilar> Kullanicilar { get; set; }
        public virtual DbSet<Mahalleler> Mahalleler { get; set; }
        public virtual DbSet<Oturumlar> Oturumlar { get; set; }
        public virtual DbSet<Roller> Roller { get; set; }
        public virtual DbSet<SandikDurumu> SandikDurumu { get; set; }
        public virtual DbSet<Sandiklar> Sandiklar { get; set; }
        public virtual DbSet<Sehirler> Sehirler { get; set; }
        public virtual DbSet<Sonuclar> Sonuclar { get; set; }
        public virtual DbSet<Tutanaklar> Tutanaklar { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // localhost

           //optionsBuilder.UseNpgsql("User ID=postgres; Password=1045246; Server=localhost; Port=5432; Database=AcikSecimDB; Integrated Security=true;");

            optionsBuilder.UseNpgsql("User ID=postgres; Password=123456; Server=172.17.0.2; Port=5432; Database=AcikSecimDB; Integrated Security=true;");
        }




        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.4-servicing-10062");

            modelBuilder.Entity<Adaylar>(entity =>
            {
                entity.Property(e => e.Ad).HasMaxLength(50);

                entity.Property(e => e.Ad2).HasMaxLength(50);

                entity.Property(e => e.Ittifaki).HasMaxLength(50);

                entity.Property(e => e.Partisi).HasMaxLength(50);

                entity.Property(e => e.Soyad).HasMaxLength(50);
            });

            modelBuilder.Entity<Ilceler>(entity =>
            {
                entity.HasIndex(e => e.SehirId)
                    .HasName("Ilceler_IX_SehirId");

                entity.Property(e => e.IlceAdi)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("''::character varying");

                entity.HasOne(d => d.Sehir)
                    .WithMany(p => p.Ilceler)
                    .HasForeignKey(d => d.SehirId)
                    .HasConstraintName("FK_public.Ilceler_public.Sehirler_SehirId");
            });

            modelBuilder.Entity<Kullanicilar>(entity =>
            {
                entity.HasIndex(e => e.MahalleId)
                    .HasName("Kullanicilar_IX_MahalleId");

                entity.HasIndex(e => e.RolId)
                    .HasName("Kullanicilar_IX_RolId");

                entity.Property(e => e.Ad).HasMaxLength(50);

                entity.Property(e => e.Ad2).HasMaxLength(50);

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Soyad).HasMaxLength(50);

                entity.Property(e => e.TcNo).HasMaxLength(11);

                entity.Property(e => e.TelNo).HasMaxLength(11);

                entity.HasOne(d => d.Mahalle)
                    .WithMany(p => p.Kullanicilar)
                    .HasForeignKey(d => d.MahalleId)
                    .HasConstraintName("FK_public.Kullanicilar_public.Mahalleler_MahalleId");

                entity.HasOne(d => d.Rol)
                    .WithMany(p => p.Kullanicilar)
                    .HasForeignKey(d => d.RolId)
                    .HasConstraintName("FK_public.Kullanicilar_public.Roller_RolId");
            });

            modelBuilder.Entity<Mahalleler>(entity =>
            {
                entity.HasIndex(e => e.IlceId)
                    .HasName("Mahalleler_IX_IlceId");

                entity.Property(e => e.MahalleAdi)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasDefaultValueSql("''::character varying");

                entity.HasOne(d => d.Ilce)
                    .WithMany(p => p.Mahalleler)
                    .HasForeignKey(d => d.IlceId)
                    .HasConstraintName("FK_public.Mahalleler_public.Ilceler_IlceId");
            });

            modelBuilder.Entity<Oturumlar>(entity =>
            {
                entity.HasIndex(e => e.KullaniciId)
                    .HasName("Oturumlar_IX_KullaniciId");

                entity.Property(e => e.OturumIp).HasMaxLength(50);

                entity.Property(e => e.OturumTarayicisi).HasMaxLength(50);

                entity.HasOne(d => d.Kullanici)
                    .WithMany(p => p.Oturumlar)
                    .HasForeignKey(d => d.KullaniciId)
                    .HasConstraintName("FK_public.Oturumlar_public.Kullanicilar_KullaniciId");
            });

            modelBuilder.Entity<Roller>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.RolAdi)
                    .IsRequired()
                    .HasMaxLength(20)
                    .HasDefaultValueSql("''::character varying");
            });

            modelBuilder.Entity<SandikDurumu>(entity =>
            {
                entity.HasIndex(e => e.KullaniciId)
                    .HasName("SandikDurumu_IX_KullaniciId");

                entity.HasIndex(e => e.SandikId)
                    .HasName("SandikDurumu_IX_SandikId");

                entity.HasOne(d => d.Kullanici)
                    .WithMany(p => p.SandikDurumu)
                    .HasForeignKey(d => d.KullaniciId)
                    .HasConstraintName("FK_public.SandikDurumu_public.Kullanicilar_KullaniciId");

                entity.HasOne(d => d.Sandik)
                    .WithMany(p => p.SandikDurumu)
                    .HasForeignKey(d => d.SandikId)
                    .HasConstraintName("FK_public.SandikDurumu_public.Sandiklar_SandikId");
            });

            modelBuilder.Entity<Sandiklar>(entity =>
            {
                entity.HasIndex(e => e.MahalleId)
                    .HasName("Sandiklar_IX_MahalleId");

                entity.HasOne(d => d.Mahalle)
                    .WithMany(p => p.Sandiklar)
                    .HasForeignKey(d => d.MahalleId)
                    .HasConstraintName("FK_public.Sandiklar_public.Mahalleler_MahalleId");
            });

            modelBuilder.Entity<Sehirler>(entity =>
            {
                entity.Property(e => e.SehirAdi)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasDefaultValueSql("''::character varying");
            });

            modelBuilder.Entity<Sonuclar>(entity =>
            {
                entity.HasIndex(e => e.AdayId)
                    .HasName("Sonuclar_IX_AdayId");

                entity.HasIndex(e => e.KullaniciId)
                    .HasName("Sonuclar_IX_KullaniciId");

                entity.HasIndex(e => e.SandikId)
                    .HasName("Sonuclar_IX_SandikId");

                entity.HasOne(d => d.Aday)
                    .WithMany(p => p.Sonuclar)
                    .HasForeignKey(d => d.AdayId)
                    .HasConstraintName("FK_public.Sonuclar_public.Adaylar_AdayId");

                entity.HasOne(d => d.Kullanici)
                    .WithMany(p => p.Sonuclar)
                    .HasForeignKey(d => d.KullaniciId)
                    .HasConstraintName("FK_public.Sonuclar_public.Kullanicilar_KullaniciId");

                entity.HasOne(d => d.Sandik)
                    .WithMany(p => p.Sonuclar)
                    .HasForeignKey(d => d.SandikId)
                    .HasConstraintName("FK_public.Sonuclar_public.Sandiklar_SandikId");
            });

            modelBuilder.Entity<Tutanaklar>(entity =>
            {
                entity.HasIndex(e => e.KullaniciId)
                    .HasName("Tutanaklar_IX_KullaniciId");

                entity.HasIndex(e => e.OnaylayanId)
                    .HasName("Tutanaklar_IX_OnaylayanId");

                entity.HasIndex(e => e.SandikId)
                    .HasName("Tutanaklar_IX_SandikId");

                entity.Property(e => e.Resim).HasMaxLength(300);

                entity.HasOne(d => d.Kullanici)
                    .WithMany(p => p.TutanaklarKullanici)
                    .HasForeignKey(d => d.KullaniciId)
                    .HasConstraintName("FK_public.Tutanaklar_public.Kullanicilar_KullaniciId");

                entity.HasOne(d => d.Onaylayan)
                    .WithMany(p => p.TutanaklarOnaylayan)
                    .HasForeignKey(d => d.OnaylayanId)
                    .HasConstraintName("FK_public.Tutanaklar_public.Kullanicilar_OnaylayanId");

                entity.HasOne(d => d.Sandik)
                    .WithMany(p => p.Tutanaklar)
                    .HasForeignKey(d => d.SandikId)
                    .HasConstraintName("FK_public.Tutanaklar_public.Sandiklar_SandikId");
            });
        }
    }
}
