USE [up6]
GO

/****** Object:  StoredProcedure [dbo].[GetSoThueMonBai]    Script Date: 7/3/2018 11:46:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROC [dbo].[GetSoThueMonBai]
@thang	NVARCHAR(7) = NULL
AS

DECLARE @dThang int,@dNam	VARCHAR(4)
SET @dThang = LEFT(@thang,2)
SET @dNam = RIGHT(@thang,4)
SELECT d.masothue,d.hoten,d.vonkd,b.Bac,
CASE WHEN DATEPART(MONTH,c.ngaykhaithue) > 6 THEN (b.MucThue/2) ELSE b.MucThue END AS MucThue,CONVERT(NVARCHAR(10),c.ngaykhaithue,103) AS ngaykhaithue FROM dbo.thuemonbai a
LEFT JOIN dbo.mucluc_MonBai b ON b.Bac = a.Bac
LEFT JOIN dbo.KhaiThue c ON c.idKhaiThue = a.idKhaiThue
LEFT JOIN dbo.DanhBa d ON d.masothue = c.masothue
LEFT JOIN dbo.SoBoThue e ON e.idKhaiThue = c.idKhaiThue
WHERE 1 =1
AND e.Thang = @dThang 
AND c.nam = @dNam


GO

