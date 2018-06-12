ALTER PROC GetDanhSachTongTienPhaiThu
@thang	NVARCHAR(7) = NULL
AS
DECLARE @dThang int,@dNam	VARCHAR(4)
SET @dThang = LEFT(@thang,2)
SET @dNam = RIGHT(@thang,4)
SELECT a.TongSoTienNop,a.SoTienGTGT1Thang,a.SoTienTNCN1Thang,b.masothue,b.nam,e.Thang,d.SoTien FROM dbo.ChiTietKhaiThue (NOLOCK) a
LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
LEFT JOIN dbo.SoBoThue (NOLOCK) e ON e.idKhaiThue = b.idKhaiThue
LEFT JOIN dbo.DanhBa (NOLOCK) c ON c.masothue = b.masothue
LEFT JOIN dbo.sono (NOLOCK) d ON d.masothue = c.masothue
WHERE e.Thang = @dThang AND b.nam = @dNam
