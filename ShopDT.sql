USE [master]
GO
/****** Object:  Database [ShopDT]    Script Date: 12/25/2021 3:09:02 PM ******/
CREATE DATABASE [ShopDT]
GO
USE [ShopDT]
GO
/****** Object:  Table [dbo].[DienThoai]    Script Date: 12/25/2021 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DienThoai](
	[MaDT] [nvarchar](10) NOT NULL,
	[TenDT] [nvarchar](100) NOT NULL,
	[ThuongHieu] [nvarchar](100) NULL,
	[Anh] [nvarchar](100) NOT NULL,
	[Gia] [money] NOT NULL,
	[SoLuong] [int] NULL,
	[Mota] [ntext] NOT NULL,
	[MaHang] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hang]    Script Date: 12/25/2021 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [nvarchar](10) NOT NULL,
	[TenHang] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/25/2021 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[TenDN] [varchar](30) NOT NULL,
	[MatKhau] [varchar](30) NOT NULL,
	[Quyen] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma01', N'iPhone 13 Pro 256GB', N'Apple', N'IP_13_1.jpeg', 31990000.0000, 15, N'iPhone 13 Pro 256GB đem đến trải nghiệm thần tốc trên mọi khía cạnh. Người dùng sẽ được tận hưởng màn hình ProMotion 120Hz đỉnh cao, hiệu năng siêu mạnh mẽ A15 Bionic bỏ xa đối thủ, camera chụp ảnh tuyệt đẹp và pin lâu hơn.', N'Mh01')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma02', N'iPhone 11 128GB', N'Apple', N'IP_11_1.jpeg', 15790000.0000, 15, N'Được đánh giá là phiên bản pin ''''trâu'''' và có mức giá rẻ nhất trong bộ ba iPhone mới, iPhone 11 128GB đang là một trong những lựa chọn dành cho khách hàng thích trải nghiệm iPhone mới nhưng không muốn đầu tư quá nhiều về tài chính. Cùng Viettel Store tìm hiểu về tính năng, thông số cơ bản của iPhone 11 128GB trong bài viết dưới đây nhé.', N'Mh01')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma03', N'iPhone 12 Mini 128GB ', N'Apple', N'IP_12_1.jpeg', 16990000.0000, 15, N'iPhone 12 Mini được gia công bằng chất liệu kim loại sang trọng, với mặt lưng được làm bằng kính bóng bẩy toát lên sự thanh lịch của một chiếc điện thoại cao cấp. Apple đã mang đến một chiếc smartphone có kích thước nhỏ nhất, khối lượng nhẹ nhất và viền mỏng nhất dòng iPhone 12 Series', N'Mh01')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma04', N'iPhone 13 mini 128GB', N'Apple', N'IP_13_hong_1.jpeg', 20490000.0000, 10, N'iPhone 13 mini bé nhỏ nhưng sở hữu sức mạnh vượt trội, màn hình siêu nét, camera chụp ảnh chuyên nghiệp, thiết kế trường tồn,… Đây chính là điện thoại dành cho những người yêu thích sự nhỏ bé, dễ thương và nằm gọn trong túi quần.', N'Mh01')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma05', N'Samsung Galaxy A52s 5G ', N'Samsung', N'Samsung_A52_1.jpeg', 10990000.0000, 15, N'Samsung Galaxy A52s 5G là bản nâng cấp của Galaxy A52 5G với nhiều thay đổi từ bên trong. Dù thiết kế vẫn vậy nhưng sự thay đổi về phần cứng sẽ đem đến những trải nghiệm tốt nhất cho người dùng và khiến nhiều đối thủ phải dè chừng.', N'Mh02')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma06', N'Samsung Galaxy A22 ', N'Samsung', N'SS_A22_3.jpeg', 5290000.0000, 10, N'Samsung Galaxy A22 phiên bản 4G được trang bị 4 camera sau hỗ trợ chống rung quang học đem đến chất lượng ảnh xuất sắc. Pin 5.000 mAh xóa tan nỗi lo hết pin và còn rất nhiều điều thú vị khi trải nghiệm Galaxy A22.', N'Mh02')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma07', N'Samsung Galaxy S21+ 5G 8/256GB', N'Samsung', N'SS_s21_1.jpeg', 23990000.0000, 15, N'Galaxy S21+ 5G là smartphone cao cấp đáng sử dụng nhất hiện nay. Thiết kế đẳng cấp, cấu hình siêu mạnh, camera chụp ảnh tuyệt đẹp, màn hình thời thượng,... là nhưng gì phiên bản “Plus” thuộc dòng Galaxy S21 sẽ đem đến cho người dùng.', N'Mh02')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma08', N'Samsung Galaxy S20 FE 256GB', N'Samsung', N'SS_s20_1.jpeg', 12990000.0000, 15, N'Samsung Galaxy S20 FE ra mắt hội tụ đầy đủ các tính năng, sức mạnh của một flagship trong mức giá vô cùng hấp dẫn. Qua đó, Samfan dễ dàng trải nghiệm khả năng nhiếp ảnh chuyên nghiệp, chơi game hạng nặng với hiệu năng và camera cực kỳ chất lượng của dòng Galaxy S.

', N'Mh02')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma09', N'Sony1', N'Sony', N'sony.jpeg', 10000000.0000, 8, N'Vivo Y72 5G nổi bật trong phân khúc smartphone 5G tầm trung với ngoại hình trẻ trung, tinh tế và năng động. Y72 5G sở hữu màn hình lớn, độ phân giải cao, pin trâu 5.000 mAh, camera chụp ảnh sắc nét và hiệu năng mạnh mẽ đáp ứng mọi nhu cầu sử dụng.', N'Mh03')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma10', N'Sony2', N'Sony', N'sony.jpeg', 10000000.0000, 5, N'Vivo Y72 5G nổi bật trong phân khúc smartphone 5G tầm trung với ngoại hình trẻ trung, tinh tế và năng động. Y72 5G sở hữu màn hình lớn, độ phân giải cao, pin trâu 5.000 mAh, camera chụp ảnh sắc nét và hiệu năng mạnh mẽ đáp ứng mọi nhu cầu sử dụng.', N'Mh03')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma11', N'Sony3', N'Sony', N'sony.jpeg', 10000000.0000, 5, N'Vivo Y72 5G nổi bật trong phân khúc smartphone 5G tầm trung với ngoại hình trẻ trung, tinh tế và năng động. Y72 5G sở hữu màn hình lớn, độ phân giải cao, pin trâu 5.000 mAh, camera chụp ảnh sắc nét và hiệu năng mạnh mẽ đáp ứng mọi nhu cầu sử dụng.', N'Mh03')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma12', N'Sony4', N'Sony', N'sony.jpeg', 10000000.0000, 5, N'Vivo Y72 5G nổi bật trong phân khúc smartphone 5G tầm trung với ngoại hình trẻ trung, tinh tế và năng động. Y72 5G sở hữu màn hình lớn, độ phân giải cao, pin trâu 5.000 mAh, camera chụp ảnh sắc nét và hiệu năng mạnh mẽ đáp ứng mọi nhu cầu sử dụng.', N'Mh03')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma13', N'Xiaomi Redmi 10 4/128GB', N'Xiaomi', N'xiaomi.jpeg', 5000000.0000, 8, N'Xiaomi Redmi 10 vừa được trình làng với nhiều cải tiến và nâng cấp vượt bậc so với thế hệ trước. Máy được trang bị cấu hình mạnh mẽ, hệ thống 4 camera AI, pin trâu và thiết kế thời trang. Redmi 10 là lựa chọn tuyệt vời cho người dùng trong phân khúc giá rẻ.', N'Mh04')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma14', N'Xiaomi Redmi 10 4/128GB', N'Xiaomi', N'xiaomi.jpeg', 5000000.0000, 5, N'Xiaomi Redmi 10 4/128GB', N'Mh04')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma15', N'Xiaomi Redmi 10 4/128GB', N'Xiaomi', N'xiaomi.jpeg', 5000000.0000, 9, N'Xiaomi Redmi 10 vừa được trình làng với nhiều cải tiến và nâng cấp vượt bậc so với thế hệ trước. Máy được trang bị cấu hình mạnh mẽ, hệ thống 4 camera AI, pin trâu và thiết kế thời trang. Redmi 10 là lựa chọn tuyệt vời cho người dùng trong phân khúc giá rẻ.', N'Mh04')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma16', N'Xiaomi Redmi 10 4/128GB ', N'Xiaomi', N'xiaomi.jpeg', 5000000.0000, 5, N'Xiaomi Redmi 10 vừa được trình làng với nhiều cải tiến và nâng cấp vượt bậc so với thế hệ trước. Máy được trang bị cấu hình mạnh mẽ, hệ thống 4 camera AI, pin trâu và thiết kế thời trang. Redmi 10 là lựa chọn tuyệt vời cho người dùng trong phân khúc giá rẻ.', N'Mh04')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma17', N'Nokia C20', N'Nokia', N'nokia.jpeg', 3000000.0000, 5, N'Nokia C20 là lựa chọn lý tưởng trong phân khúc giá rẻ. Máy chạy trên hệ điều hành mới nhất Android 11 Go, pin dùng thoải mái cả ngày, kết nối 4G, thiết kế đẹp và đặc biệt độ bền đến từ thương hiệu nổi tiếng Nokia.', N'Mh05')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma18', N'Nokia C201', N'Nokia', N'nokia.jpeg', 3000000.0000, 5, N'Nokia C20 là lựa chọn lý tưởng trong phân khúc giá rẻ. Máy chạy trên hệ điều hành mới nhất Android 11 Go, pin dùng thoải mái cả ngày, kết nối 4G, thiết kế đẹp và đặc biệt độ bền đến từ thương hiệu nổi tiếng Nokia.', N'Mh05')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma19', N'Nokia C202', N'Nokia', N'nokia.jpeg', 3000000.0000, 5, N'Nokia C20 là lựa chọn lý tưởng trong phân khúc giá rẻ. Máy chạy trên hệ điều hành mới nhất Android 11 Go, pin dùng thoải mái cả ngày, kết nối 4G, thiết kế đẹp và đặc biệt độ bền đến từ thương hiệu nổi tiếng Nokia.', N'Mh05')
INSERT [dbo].[DienThoai] ([MaDT], [TenDT], [ThuongHieu], [Anh], [Gia], [SoLuong], [Mota], [MaHang]) VALUES (N'Ma20', N'Nokia C203', N'Nokia', N'nokia.jpeg', 3000000.0000, 8, N'Nokia C20 là lựa chọn lý tưởng trong phân khúc giá rẻ. Máy chạy trên hệ điều hành mới nhất Android 11 Go, pin dùng thoải mái cả ngày, kết nối 4G, thiết kế đẹp và đặc biệt độ bền đến từ thương hiệu nổi tiếng Nokia.', N'Mh05')
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'Mh01', N'Apple')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'Mh02', N'Samsung')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'Mh03', N'Sony')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'Mh04', N'Xiaomi')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'Mh05', N'Nokia')
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen]) VALUES (1, N'Khổng Quang Hà', N'ha@gmail.com', N'123456', 0)
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen]) VALUES (2, N'Admin', N'admin@gmail.com', N'123456', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [TenDN], [MatKhau], [Quyen]) VALUES (3, N'Admin1', N'admin1@gmail.com', N'123456', 0)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
ALTER TABLE [dbo].[DienThoai]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
USE [master]
GO
ALTER DATABASE [ShopDT] SET  READ_WRITE 
GO
