USE [up6]
GO

/****** Object:  StoredProcedure [dbo].[GetSoThu]    Script Date: 7/10/2018 5:08:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[GetSoThu]
@MST NVARCHAR(12)=NULL,
@thang NVARCHAR(7)=NULL,
@loaithue NVARCHAR(4)=NULL
AS
BEGIN
DECLARE @dThang int,@dNam	VARCHAR(4)
PRINT @thang
SET @dThang = LEFT(@thang,2)
SET @dNam = RIGHT(@thang,4)
SELECT a.masothue,a.SoTienNop,a.KyThue,CONVERT(NVARCHAR(10),a.NgayNop,103) AS NgayNop,b.hoten,a.id,
CASE WHEN a.tieumuc = '1003' THEN N'Thuế thu nhập từ hoạt động sản xuất, kinh doanh của cá nhân'
		 WHEN a.tieumuc = '1701' THEN N'Thuế giá trị gia tăng hàng sản xuất, kinh doanh trong nước'
		 WHEN a.tieumuc = '0000' THEN N'Thuế môn bài' ELSE N'Thuế khác' END tieumuc
FROM dbo.SoLieuTuKhoBac a
LEFT JOIN dbo.DanhBa b ON b.masothue = a.masothue
WHERE 1 =1 
AND (@MST ='' OR a.masothue = @MST)
AND (@thang='' OR a.KyThue like @thang)
AND (@loaithue = '' OR a.tieumuc = @loaithue)

END
GO

