USE [thue]
GO
/****** Object:  StoredProcedure [dbo].[getDsConNo]    Script Date: 6/1/2018 10:26:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[getDsConNo]
@masothue NVARCHAR(15) = NULL
AS
	SELECT a.masothue,a.hoten,a.nghekinhdoanh,a.nam,b.KyThue,b.SoTien,b.tieumuc
	 FROM dbo.DanhBa a (NOLOCK)
	LEFT JOIN dbo.sono b (NOLOCK) ON b.masothue = a.masothue
	WHERE b.masothue = @masothue