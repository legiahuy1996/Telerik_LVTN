USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[getDSHoDuocLenSoBo]    Script Date: 6/15/2018 4:17:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[getDSHoDuocLenSoBo]
as
		BEGIN 
				SELECT a.idKhaiThue,b.masothue,a.nam,b.sodt,b.email,b.ghichu,c.tennganh,a.SoLuongLD,a.DienTichKD,b.diachiKD, 
					   CASE WHEN a.TrangThaiHoatDong = 1 THEN N'Đang hoạt động' ELSE N'Ngưng hoạt động' END AS TrangThaiHoatDong,
					   a.TongDoanhThu,a.TongDoanhThu AS DoanhThuTinhThueGTGT,a.TongDoanhThu AS DoanhThuTinhThueTNCN,c.TyLeTinhThueGTGT,c.TyLeTinhThueTNCN,b.hoten,b.nghekinhdoanh
					   ,a.TuGio,a.DenGio,d.Thang
				FROM dbo.KhaiThue a 
				INNER JOIN dbo.DanhBa b ON b.masothue = a.masothue
				INNER JOIN dbo.manganh c ON c.manganh = a.manganh
				LEFT JOIN dbo.SoBoThue d ON d.idKhaiThue = a.idKhaiThue
				WHERE  d.Thang = DATEPART(MM,GETDATE()) AND a.TrangThaiHoatDong = 1	AND a.nam= DATEPART(YEAR,GETDATE())

	    END
GO

