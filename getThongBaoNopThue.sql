USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[getThongBaoNopThue]    Script Date: 6/22/2018 5:09:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[getThongBaoNopThue]
@thang	NVARCHAR(7) = NULL
AS
DECLARE @dThang int,@dNam	VARCHAR(4)
SET @dThang = LEFT(@thang,2)
SET @dNam = RIGHT(@thang,4)

SELECT c.hoten,c.masothue,c.diachiKD,(CONVERT(NVARCHAR(7),a.KyThue)+'/'+CONVERT(NVARCHAR(4),b.nam))AS KyThue,(CONVERT(NVARCHAR(7),a.KyThue)+'/'+CONVERT(NVARCHAR(4),b.nam))AS KyThue2,a.idKhaiThue,FORMAT(a.ThueGTGN,'N0') AS ThueGTGN,FORMAT(a.ThueTNCN,'N0') ThueTNCN,FORMAT(a.ThueMonBai,'N0') ThueMonBai,FORMAT(ISNULL(a.SoNo,0)*-1,'N0') SoNo,FORMAT(ISNULL(a.ThueGTGN,0)+ISNULL(a.ThueTNCN,0)+ISNULL(a.ThueMonBai,0)+(-ISNULL(a.SoNo,0)),'N0') as TongCong 
FROM dbo.ThongBaoNopThue (NOLOCK) a
LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
LEFT JOIN dbo.DanhBa (NOLOCK) c ON c.masothue = b.masothue
WHERE a.KyThue = @dThang AND b.nam = @dNam

GO

