alter PROC getThongBaoNopThue
@thang	NVARCHAR(7) = NULL
AS
DECLARE @dThang int,@dNam	VARCHAR(4)
SET @dThang = LEFT(@thang,2)
SET @dNam = RIGHT(@thang,4)

SELECT a.KyThue,a.idKhaiThue,a.ThueGTGN,a.ThueTNCN,a.ThueMonBai,a.SoNo,a.TongCong 
FROM dbo.ThongBaoNopThue (NOLOCK) a
LEFT JOIN dbo.KhaiThue (NOLOCK) b ON b.idKhaiThue = a.idKhaiThue
WHERE a.KyThue = @dThang AND b.nam = @dNam
