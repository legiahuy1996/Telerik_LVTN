USE [up6]
GO

/****** Object:  StoredProcedure [dbo].[getDSSoBoThue]    Script Date: 6/30/2018 9:35:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

	ALTER PROC [dbo].[getDSSoBoThue]
	 @MST NVARCHAR(14) = NULL,
	 @NgheKinhDoanh NVARCHAR(250) = NULL,
	 @Thang	NVARCHAR(2) = NULL,
	 @DiaChi		NVARCHAR(250) = NULL,
	 @HoTen		NVARCHAR(250) = NULL,
	 @ThangLapBo	NVARCHAR(2) = NULL,
	 @Nam		VARCHAR(4) = NULL
	 AS
	 DECLARE @iThang INT
	 SET @iThang = CONVERT(INT,@Thang)
 		SELECT b.nam,b.masothue,c.hoten,CONVERT(NVARCHAR(10),a.NgayLapBo,103) NgayLapBo,c.nghekinhdoanh
 		,c.diachiKD,a.Thang,CASE WHEN a.TinhTrangNopThue = '1' THEN N'Đã nộp' ELSE N'Chưa nộp' END TinhTrangNopThue,a.DoanhThuTinhThueGTGT,e.TyLeTinhThueGTGT
 		,a.SoTienGTGT1Thang ThueGTGT,a.DoanhThuTinhThueTNCN,e.TyLeTinhThueTNCN,a.SoTienTNCN1Thang ThueTNCN,a.idSoBoThue,f.MucThue AS MucThue
 		FROM dbo.SoBoThue (NOLOCK) a 
 		LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
		LEFT JOIN dbo.DanhBa (NOLOCK) c ON c.masothue = b.masothue
		LEFT JOIN dbo.manganh (NOLOCK) e ON e.manganh = b.manganh
		LEFT JOIN dbo.thuemonbai(NOLOCK) d ON d.idKhaiThue = a.idKhaiThue
		LEFT JOIN dbo.mucluc_MonBai (NOLOCK) f ON f.Bac = d.Bac
 		WHERE 1=1 
 			AND (@MST = '' OR @MST IS NULL OR b.masothue = @MST)
 			AND (@NgheKinhDoanh = '' OR @NgheKinhDoanh IS NULL OR c.nghekinhdoanh = @NgheKinhDoanh)
 			AND (@iThang = '' OR @iThang IS NULL OR a.Thang = @iThang)
 			AND (@DiaChi = '' OR @DiaChi IS NULL OR c.diachiKD = @DiaChi)
 			AND (@HoTen = '' OR @HoTen IS NULL OR c.hoten = @HoTen)
 			AND (@Nam = '' OR @Nam IS NULL OR b.nam = @Nam)
 			AND (@ThangLapBo = '' OR @ThangLapBo IS NULL OR DATEPART(mm,CONVERT(DATE,a.NgayLapBo,103)) = @ThangLapBo) 

			ORDER BY a.Thang

GO

