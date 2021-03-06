USE [up6]
GO

/****** Object:  StoredProcedure [dbo].[getDsConNo]    Script Date: 7/3/2018 11:28:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[getDsConNo]
@masothue NVARCHAR(15) = NULL
AS
	SELECT a.masothue,a.hoten,a.nghekinhdoanh,a.nam,b.KyThue,b.SoTien,
	CASE WHEN b.tieumuc = '1003' THEN N'Thuế thu nhập từ hoạt động sản xuất, kinh doanh của cá nhân'
		 WHEN b.tieumuc = '1701' THEN N'Thuế giá trị gia tăng hàng sản xuất, kinh doanh trong nước'
		 ELSE N'Thuế môn bài' END tieumuc
	 FROM dbo.sono b (NOLOCK)
	LEFT JOIN dbo.DanhBa a (NOLOCK) ON b.masothue = a.masothue
	WHERE 1=1 AND 
	(@masothue IS NULL OR @masothue = '' OR b.masothue = @masothue)
	AND b.SoTien IS NOT NULL


GO

