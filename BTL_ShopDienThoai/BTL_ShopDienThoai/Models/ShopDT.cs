using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace BTL_ShopDienThoai.Models
{
    public partial class ShopDT : DbContext
    {
        public ShopDT()
            : base("name=ShopDT")
        {
        }

        public virtual DbSet<DienThoai> DienThoais { get; set; }
        public virtual DbSet<Hang> Hangs { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DienThoai>()
                .Property(e => e.Gia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Hang>()
                .HasMany(e => e.DienThoais)
                .WithRequired(e => e.Hang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.TenDN)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);
        }
    }
}
