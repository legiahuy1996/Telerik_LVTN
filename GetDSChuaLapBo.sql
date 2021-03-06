USE [thue]
GO
/****** Object:  StoredProcedure [dbo].[GetDSChuaLapBo]    Script Date: 5/30/2018 10:13:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[GetDSChuaLapBo]
@idKhaiThue	NVARCHAR(15) = NULL,
@thang INT = NULL
AS
SELECT * FROM dbo.SoBoThue 
WHERE @idKhaiThue NOT IN (SELECT a.idKhaiThue FROM dbo.SoBoThue a LEFT JOIN dbo.KhaiThue b ON b.idKhaiThue = a.idKhaiThue WHERE a.Thang = @thang)
	AND idKhaiThue = @idKhaiThue