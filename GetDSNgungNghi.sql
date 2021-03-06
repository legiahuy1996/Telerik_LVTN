USE [thue]
GO
/****** Object:  StoredProcedure [dbo].[GetDSNgungNghi]    Script Date: 6/7/2018 8:39:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[GetDSNgungNghi]
@MST		NVARCHAR(15) = NULL
AS
BEGIN
	SELECT DATEPART(MM,a.tungay) tuthang,DATEPART(MM,a.denngay) denthang,a.lydo,CONVERT(NVARCHAR(10),a.ngaynopdon,103) ngaynopdon,a.idKhaiThue,c.hoten,c.masothue,b.nam FROM dbo.thongtinngungnghi (NOLOCK) a
	LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
	LEFT JOIN dbo.DanhBa (NOLOCK) c ON c.masothue = b.masothue
END