USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[GetDanhSachTongTienPhaiThu]    Script Date: 6/10/2018 4:35:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[GetDanhSachTongTienPhaiThu]
@thang	NVARCHAR(7) = NULL
AS
DECLARE @dThang int,@dNam	VARCHAR(4)
SET @dThang = LEFT(@thang,2)
SET @dNam = RIGHT(@thang,4)
PRINT @dThang
PRINT @dNam
SELECT  a.SoTienGTGT1Thang,a.SoTienTNCN1Thang,b.masothue,b.nam,a.Thang,(a.SoTienGTGT1Thang+a.SoTienTNCN1Thang)AS TongSoTien FROM dbo.SoBoThue (NOLOCK) a
LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
LEFT JOIN dbo.DanhBa (NOLOCK) c ON c.masothue = b.masothue
WHERE a.Thang = @dThang AND b.nam = @dNam

GO

