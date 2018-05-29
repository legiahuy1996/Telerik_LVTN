USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Load_ChiTietKhaiThue]    Script Date: 5/29/2018 9:36:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Load_ChiTietKhaiThue]
@idKhaiThue NVARCHAR(14)=null

AS
BEGIN
	SELECT a.idChiTiet,row_number() OVER(ORDER BY a.idChiTiet) AS Seq,b.manganh,b.tennganh,a.DoanhThu,b.TyLeTinhThueGTGT,b.TyLeTinhThueTNCN,a.NgheKinhDoanh FROM dbo.ChiTietKhaiThue  a
	LEFT JOIN dbo.manganh b ON b.manganh = a.manganh
	WHERE a.idKhaiThue = @idKhaiThue
		
END	

GO

