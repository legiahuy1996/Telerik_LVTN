USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[DanhSachThongTinHoCaThe]    Script Date: 6/2/2018 8:52:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[DanhSachThongTinHoCaThe]
@idSoBoThue INT = NULL
AS
BEGIN
	SELECT DISTINCT a.masothue,a.hoten, a.nam,e.Thang
	,CASE WHEN f.trangthai = 0 THEN (i.TongSoTienNop + h.MucThue) ELSE i.TongSoTienNop END SoTienPhaiDong
	,j.SoTienNop SoTienDaNop,
	CASE WHEN f.trangthai = 0 THEN (i.TongSoTienNop + h.MucThue) - j.SoTienNop ELSE (i.TongSoTienNop - j.SoTienNop) END SoTienConNo
	,CASE WHEN b.SoTien > 0 THEN N'Còn Nợ' ELSE N'Đã nộp thuế' END TinhTrang
	FROM dbo.DanhBa (NOLOCK) a
	LEFT JOIN dbo.sono (NOLOCK) b ON b.masothue = a.masothue
	LEFT JOIN dbo.sodu (NOLOCK) c ON c.masothue = a.masothue
	LEFT JOIN dbo.KhaiThue (NOLOCK) d ON d.masothue = a.masothue
	LEFT JOIN dbo.ChiTietKhaiThue (NOLOCK) i ON i.idKhaiThue = d.idKhaiThue
	LEFT JOIN dbo.SoBoThue (NOLOCK) e ON e.idKhaiThue = d.idKhaiThue
	LEFT JOIN dbo.thuemonbai (NOLOCK) f ON f.idKhaiThue = d.idKhaiThue
	LEFT JOIN dbo.mucluc_MonBai (NOLOCK) h ON h.Bac = f.Bac
	LEFT JOIN dbo.SoLieuTuNganHang (NOLOCK) j ON j.masothue = a.masothue
	WHERE e.idSoBoThue = @idSoBoThue
END
GO

