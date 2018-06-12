<<<<<<< HEAD
ALTER PROC GetDanhSachTongTienPhaiThu
=======
USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[GetDanhSachTongTienPhaiThu]    Script Date: 6/10/2018 4:35:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[GetDanhSachTongTienPhaiThu]
>>>>>>> 19879d9bc74d02f76cd3358d6ec95260cfa5ef23
@thang	NVARCHAR(7) = NULL
AS
DECLARE @dThang int,@dNam	VARCHAR(4)
SET @dThang = LEFT(@thang,2)
SET @dNam = RIGHT(@thang,4)
<<<<<<< HEAD
SELECT a.TongSoTienNop,a.SoTienGTGT1Thang,a.SoTienTNCN1Thang,b.masothue,b.nam,e.Thang,d.SoTien FROM dbo.ChiTietKhaiThue (NOLOCK) a
LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
LEFT JOIN dbo.SoBoThue (NOLOCK) e ON e.idKhaiThue = b.idKhaiThue
LEFT JOIN dbo.DanhBa (NOLOCK) c ON c.masothue = b.masothue
LEFT JOIN dbo.sono (NOLOCK) d ON d.masothue = c.masothue
WHERE e.Thang = @dThang AND b.nam = @dNam
=======
PRINT @dThang
PRINT @dNam
SELECT  a.SoTienGTGT1Thang,a.SoTienTNCN1Thang,b.masothue,b.nam,a.Thang,(a.SoTienGTGT1Thang+a.SoTienTNCN1Thang)AS TongSoTien FROM dbo.SoBoThue (NOLOCK) a
LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
LEFT JOIN dbo.DanhBa (NOLOCK) c ON c.masothue = b.masothue
WHERE a.Thang = @dThang AND b.nam = @dNam

GO

>>>>>>> 19879d9bc74d02f76cd3358d6ec95260cfa5ef23
