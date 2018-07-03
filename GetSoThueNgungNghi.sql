USE [up6]
GO

/****** Object:  StoredProcedure [dbo].[GetSoThueNgungNghi]    Script Date: 7/3/2018 4:18:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[GetSoThueNgungNghi]
@thang	NVARCHAR(7) = NULL
AS
BEGIN
DECLARE @dThang int,@dNam	VARCHAR(4)
SET @dThang = LEFT(@thang,2)
SET @dNam = RIGHT(@thang,4)
	SELECT j.masothue,j.nam,@dThang AS thang,j.TongDoanhThu,h.GTGT,h.TNCN
FROM dbo.thongtinngungnghi a
LEFT JOIN (SELECT c.idKhaiThue,SUM(e.SoTienGTGT1Thang) AS GTGT,SUM(e.SoTienTNCN1Thang) AS TNCN FROM dbo.KhaiThue c 
							LEFT JOIN dbo.DanhBa d ON d.masothue = c.masothue
							LEFT JOIN dbo.ChiTietKhaiThue e ON e.idKhaiThue = c.idKhaiThue
							LEFT JOIN dbo.manganh f ON f.manganh = e.manganh
							LEFT JOIN dbo.thue g ON g.idChiTiet = e.idChiTiet
							GROUP BY c.idKhaiThue
							) h ON h.idKhaiThue = a.idKhaiThue
LEFT JOIN dbo.KhaiThue j ON j.idKhaiThue = a.idKhaiThue		
LEFT JOIN (SELECT DATEPART(MONTH,tungay)AS tungay,DATEPART(MONTH,denngay)AS denngay,idKhaiThue FROM dbo.thongtinngungnghi) k ON  k.idKhaiThue = j.idKhaiThue			
WHERE 1=1
AND j.nam = @dNam 
AND @dThang BETWEEN k.tungay AND k.denngay
END

GO

