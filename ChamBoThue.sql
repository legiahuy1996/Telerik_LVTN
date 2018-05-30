USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[ChamBoThue]    Script Date: 5/27/2018 2:24:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[ChamBoThue] 
@idSoBoThue NVARCHAR(14)=NULL,
@ReturnMess NVARCHAR(500) = NULL OUT
AS
BEGIN
	DECLARE @idKhaiThue NVARCHAR(14),@SoTienGTGT BIGINT , @SoTienTNCN BIGINT,@Thang int ,@nam NVARCHAR(4),@masothue NVARCHAR(14)
	--Lấy số tiền ở nguồn dữ liệu
	SELECT @idKhaiThue = idKhaiThue,@Thang=Thang,@SoTienGTGT = SoTienGTGT1Thang,@SoTienTNCN = SoTienTNCN1Thang FROM dbo.SoBoThue 
	WHERE idSoBoThue = @idSoBoThue
	--
	SELECT @masothue = masothue,@nam = nam FROM dbo.KhaiThue 
	WHERE idKhaiThue = @idKhaiThue
	DECLARE @KyThue NVARCHAR(10)
	SET @KyThue =CONVERT(NVARCHAR(2),@Thang)  +'/'+@nam
	IF(LEN(@KyThue) = 6)
	BEGIN
		SET @KyThue = '0'+@KyThue
    END 
	PRINT @KyThue
	IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.SoLieuTuNganHang 
					WHERE masothue = @masothue AND KyThue = @KyThue)
	BEGIN
		SET @ReturnMess = N'Chưa có dữ liệu của '+@KyThue
		PRINT @ReturnMess
		RETURN 
    END 

	--Lấy số thu
	DECLARE @SoThuGTGT BIGINT, @SoThuTNCN BIGINT
	SELECT @SoThuGTGT = SoTienNop  FROM dbo.SoLieuTuNganHang 
	WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc ='1003'

	SELECT @SoThuTNCN = SoTienNop  FROM dbo.SoLieuTuNganHang 
	WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc ='1701'
	
		PRINT @SoThuGTGT
		PRINT @SoThuTNCN
		PRINT @SoTienGTGT
		PRINT @SoTienTNCN
	--Tính Hiệu
	DECLARE @HieuSoGTGT bigint,@HieuSoTNCN BIGINT,@SoDuGTGT BIGINT, @SoDuTNCN BIGINT,@SoNoGTGT BIGINT,@SoNoTNCN BIGINT, @KyThueTruoc NVARCHAR(7)
	DECLARE @thangtruoc INT
	SET @thangtruoc = @Thang - 1
	SET @KyThueTruoc = CONVERT(NVARCHAR(2),@thangtruoc)  +'/'+@nam
	IF(LEN(@KyThueTruoc) = 6)
	BEGIN
		SET @KyThueTruoc = '0'+@KyThueTruoc
    END 

	SELECT @SoDuGTGT = SoTien FROM dbo.sodu WHERE tieumuc ='1003' AND KyThue = @KyThueTruoc
	SELECT @SoDuTNCN = SoTien FROM dbo.sodu WHERE tieumuc ='1701' AND KyThue = @KyThueTruoc

	SELECT @SoNoGTGT = SoTien FROM dbo.sono WHERE tieumuc ='1003' AND KyThue = @KyThueTruoc
	SELECT @SoNoTNCN = SoTien FROM dbo.sono WHERE tieumuc ='1701' AND KyThue = @KyThueTruoc

	SET @HieuSoGTGT = (@SoThuGTGT +ISNULL(@SoDuGTGT,0)) - (@SoTienGTGT -ISNULL(@SoNoGTGT,0))
	SET @HieuSoTNCN = (@SoThuTNCN+ISNULL(@SoDuTNCN,0)) - (@SoTienTNCN-ISNULL(@SoNoTNCN,0))
	
	PRINT @HieuSoGTGT
	PRINT @HieuSoTNCN
	IF(@HieuSoGTGT >0)
	BEGIN
		INSERT INTO dbo.sodu
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoGTGT, -- SoTien - int
		          '1003', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	IF(@HieuSoGTGT <0)
	BEGIN
		INSERT INTO dbo.sono
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoGTGT, -- SoTien - int
		          '1003', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	IF(@HieuSoTNCN >0)
	BEGIN
		INSERT INTO dbo.sodu
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoTNCN, -- SoTien - int
		          '1701', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	IF(@HieuSoTNCN <0)
	BEGIN
		INSERT INTO dbo.sono
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoTNCN, -- SoTien - int
		          '1701', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	
	IF( @HieuSoGTGT >0 AND @HieuSoTNCN >0)
	BEGIN
		UPDATE dbo.SoBoThue
		SET TinhTrangNopThue =1
		WHERE idSoBoThue = @idSoBoThue
    END
	ELSE
    BEGIN
		UPDATE dbo.SoBoThue
		SET TinhTrangNopThue =0
		WHERE idSoBoThue = @idSoBoThue
    END 

	--PRINT @HieuSoTNCN


END 

GO

