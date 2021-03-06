USE [thue]
GO
/****** Object:  StoredProcedure [dbo].[Insert_SoBoThue]    Script Date: 5/30/2018 10:13:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Insert_SoBoThue]
@idKhaiThue NVARCHAR(14) = NULL,
@NgayLapBo	NVARCHAR(10) = NULL,
@Thang		INT = NULL,
@DoanhThuTinhThueGTGT INT = NULL,
@DoanhThuTinhThueTNCN INT = NULL,
@TyLeTinhThueGTGT FLOAT = NULL,
@TyLeTinhThueTNCN float = NULL,
@RessMess		NVARCHAR(1000) NULL
AS
DECLARE @SoTienGTGT1thang INT,@SoTienTNCN1thang INT, @dNgayLapBo DATE
SET @SoTienGTGT1thang = (@DoanhThuTinhThueGTGT * @TyLeTinhThueGTGT ) / 100
SET @SoTienTNCN1thang = (@DoanhThuTinhThueTNCN * @TyLeTinhThueTNCN) / 100
SET @dNgayLapBo = CONVERT(DATE,@NgayLapBo,103)
BEGIN
	IF EXISTS (SELECT TOP 1 1 FROM dbo.SoBoThue WHERE idKhaiThue = @idKhaiThue AND Thang = @Thang)
	BEGIN
		SET @RessMess = 'Đã tồn tại mã khai thuế ở tháng này, vui lòng nhập lại'
		RETURN 
	END

	IF(ISNULL(@idKhaiThue,'') = '')
	BEGIN
		SET @RessMess = 'Vui lòng nhập mã khai thuế'
		RETURN 
	END
	ELSE 
		IF NOT EXISTS (SELECT * FROM dbo.KhaiThue WHERE idKhaiThue = @idKhaiThue)
		BEGIN
			SET @RessMess = 'Không tồn tại mã khai thuế này!'
			RETURN
		END

    INSERT INTO dbo.SoBoThue
            ( idKhaiThue ,
              Thang ,
              TinhTrangNopThue ,
              NgayLapBo ,
              DoanhThuTinhThueGTGT ,
              DoanhThuTinhThueTNCN ,
              TyLeTinhThueGTGT ,
              TyLeTinhThueTNCN ,
              SoTienGTGT1Thang ,
              SoTienTNCN1Thang
            )
    VALUES  ( @idKhaiThue , -- idKhaiThue - int
              @Thang , -- Thang - int
              0 , -- TinhTrangNopThue - bit
              @dNgayLapBo , -- NgayLapBo - date
              @DoanhThuTinhThueGTGT, -- DoanhThuTinhThueGTGT - int
              @DoanhThuTinhThueTNCN , -- DoanhThuTinhThueTNCN - int
              @TyLeTinhThueGTGT , -- TyLeTinhThueGTGT - float
              @TyLeTinhThueTNCN , -- TyLeTinhThueTNCN - float
              @SoTienGTGT1thang , -- SoTienGTGT1Thang - int
              @SoTienTNCN1thang  -- SoTienTNCN1Thang - int
            )
END