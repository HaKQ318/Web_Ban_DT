namespace BTL_ShopDienThoai.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Key]
        public int MaTK { get; set; }

        [Required(ErrorMessage = "Mã tài khoản không được bỏ trống!")]
        [StringLength(50)]
        public string HoTen { get; set; }

        [Required(ErrorMessage = "Họ tên không được bỏ trống!")]
        [StringLength(30)]

        [DisplayName("Tên đăng nhập")]
        public string TenDN { get; set; }
       
        [Required(ErrorMessage = "Tên đăng nhập không được bỏ trống!")]
        [StringLength(30)]

        [DisplayName("Mật khẩu")]
        public string MatKhau { get; set; }
        
        [Required(ErrorMessage = "Mật khẩu không được bỏ trống!")]
        
        public bool Quyen { get; set; }
    }
}
