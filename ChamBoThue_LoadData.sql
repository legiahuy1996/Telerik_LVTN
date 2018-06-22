USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[ChamBoThue_LoadData]    Script Date: 6/22/2018 5:54:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

	ALTER PROC [dbo].[ChamBoThue_LoadData]
	 @MST NVARCHAR(14) = NULL,
	 @NgheKinhDoanh NVARCHAR(250) = NULL,
	 @DiaChi		NVARCHAR(250) = NULL,
	 @HoTen		NVARCHAR(250) = NULL
	 AS
 		SELECT a.idSoBoThue,b.nam,b.masothue,c.hoten,f.nghekinhdoanh
 		,c.diachiKD,a.Thang,a.DoanhThuTinhThueTNCN
 		FROM dbo.SoBoThue (NOLOCK) a 
 		LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
		LEFT JOIN dbo.ChiTietKhaiThue f ON f.idKhaiThue = b.idKhaiThue
		LEFT JOIN dbo.DanhBa (NOLOCK) c ON c.masothue = b.masothue
		LEFT JOIN dbo.manganh (NOLOCK) e ON e.manganh = b.manganh
 		WHERE 1=1 
 			AND (@MST = '' OR @MST IS NULL OR b.masothue = @MST)
 			AND (@NgheKinhDoanh = '' OR @NgheKinhDoanh IS NULL OR c.nghekinhdoanh = @NgheKinhDoanh)
 			AND (a.Thang = DATEPART(MONTH,GETDATE()))
 			AND (@DiaChi = '' OR @DiaChi IS NULL OR c.diachiKD = @DiaChi)
 			AND (@HoTen = '' OR @HoTen IS NULL OR c.hoten = @HoTen)
 			AND (b.nam = DATEPART(YEAR,GETDATE()))

GO

