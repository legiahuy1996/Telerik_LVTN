USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[getThongBaoNopThue]    Script Date: 6/15/2018 10:13:18 PM ******/
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

SELECT a.KyThue,a.idKhaiThue,a.ThueGTGN,a.ThueTNCN,a.ThueMonBai,a.SoNo,(ISNULL(a.ThueGTGN,0)+ISNULL(a.ThueTNCN,0)+ISNULL(a.ThueMonBai,0)+(-ISNULL(a.SoNo,0))) as TongCong 
FROM dbo.ThongBaoNopThue (NOLOCK) a
LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
WHERE a.KyThue = @dThang AND b.nam = @dNam

GO

