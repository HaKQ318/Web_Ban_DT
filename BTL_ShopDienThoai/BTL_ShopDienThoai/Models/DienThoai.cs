namespace BTL_ShopDienThoai.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DienThoai")]
    public partial class DienThoai
    {

        [DatabaseGenerated(DatabaseGeneratedOption.None)]

        [Key]
        [DisplayName("Mã điện thoại")]
        [Required(ErrorMessage = "Mã điện thoại không được bỏ trống")]
        [StringLength(10)]
        public string MaDT { get; set; }

        [Required(ErrorMessage ="Tên điện thoại không được bỏ trống !")]
        [StringLength(100)]
        [DisplayName("Tên điên thoại")]
        public string TenDT { get; set; }

        [Required(ErrorMessage = "Thương hiệu không được bỏ trống !")]
        [StringLength(100)]
        [DisplayName("Thương hiệu")]
        public string ThuongHieu { get; set; }

        /*[Required(ErrorMessage ="Ảnh không được bỏ trống")]*/

        [Column(TypeName = "text")]
        [DisplayName("Hình ảnh")]
        public string Anh { get; set; }

        
        [Required(ErrorMessage = "Giá tiền không được bỏ trống !")]
        [Column(TypeName = "numeric")]
        [DisplayName("Giá tiền")]
        [DisplayFormat(DataFormatString ="{0:#,###}")]
        public decimal Gia { get; set; }

        [DisplayName("Số lượng")]
        public int? SoLuong { get; set; }

        [Column(TypeName = "ntext")]
        [Required(ErrorMessage ="Mô tả không được bỏ trống !")]
        [DisplayName("Mô tả")]
        public string Mota { get; set; }

        [Required]
        [StringLength(10)]
        public string MaHang { get; set; }

        public virtual Hang Hang { get; set; }

    }
}
