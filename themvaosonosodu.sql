USE [up6]
GO

/****** Object:  Trigger [dbo].[themvaosonosodu]    Script Date: 7/3/2018 10:25:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[themvaosonosodu] ON [dbo].[SoLieuTuNganHang] FOR INSERT,UPDATE,DELETE
AS
DECLARE @masothue NVARCHAR(14), @thuemonbai FLOAT, @thueGTGT FLOAT, @thueTNCN FLOAT, @KyThue NVARCHAR(10)
SELECT @masothue = inserted.masothue FROM inserted

SELECT @KyThue = b.kythue FROM dbo.SoLieuTuNganHang a INNER JOIN (
	SELECT MAX(KyThue) KyThue,masothue FROM dbo.SoLieuTuNganHang
	WHERE masothue = @masothue
	GROUP BY masothue
) b ON b.masothue = a.masothue

SELECT @thueGTGT = SoTienNop  FROM dbo.SoLieuTuNganHang 
WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc ='1003'

SELECT @thueTNCN = SoTienNop  FROM dbo.SoLieuTuNganHang 
WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc ='1701'

SELECT @thuemonbai = sotiennop FROM dbo.SoLieuTuNganHang
WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc = '0000' AND muc = '1800'

DECLARE @HieuSoGTGT bigint,@HieuSoTNCN BIGINT,@SoDuGTGT BIGINT, @SoDuTNCN BIGINT,@SoNoGTGT BIGINT,@SoNoTNCN BIGINT
DECLARE @SoDuTMB BIGINT,@SoNoTMB BIGINT, @HieuSoTMB BIGINT

	SELECT @SoDuGTGT = b.SoTien FROM dbo.sodu a
	INNER JOIN (
		SELECT MAX(KyThue) KyThue,SoTien, masothue FROM dbo.sodu
		WHERE masothue = @masothue AND tieumuc ='1003' 
		GROUP BY SoTien, masothue
	) b ON b.masothue = a.masothue

	SELECT @SoDuTNCN = b.SoTien FROM dbo.sodu a INNER JOIN (
		SELECT MAX(KyThue) KyThue,SoTien, masothue FROM dbo.sodu
		WHERE masothue = @masothue AND tieumuc ='1701' 
		GROUP BY SoTien, masothue
	) b ON b.masothue = a.masothue

	SELECT @SoDuTMB = b.SoTien FROM dbo.sodu a INNER JOIN (
		SELECT MAX(KyThue) KyThue,SoTien, masothue FROM dbo.sodu
		WHERE masothue = @masothue AND tieumuc ='0000'
		GROUP BY SoTien, masothue
	) b ON b.masothue = a.masothue


	SELECT @SoNoGTGT = b.SoTien FROM dbo.sono a INNER JOIN (
		SELECT MAX(KyThue) KyThue,SoTien, masothue FROM dbo.sono
		WHERE masothue = @masothue AND tieumuc ='1003' 
		GROUP BY SoTien, masothue
	) b ON b.masothue = a.masothue

	SELECT @SoNoTNCN = b.SoTien FROM dbo.sono a INNER JOIN (
		SELECT MAX(KyThue) KyThue,SoTien, masothue FROM dbo.sono
		WHERE masothue = @masothue AND tieumuc ='1701' 
		GROUP BY SoTien, masothue
	) b ON b.masothue = a.masothue

	SELECT @SoNoTMB = b.SoTien FROM dbo.sono a INNER JOIN (
		SELECT MAX(KyThue) KyThue,SoTien, masothue FROM dbo.sono
		WHERE masothue = @masothue AND tieumuc ='0000' 
		GROUP BY SoTien, masothue
	) b ON b.masothue = a.masothue


	DECLARE @SoTienGTGT BIGINT , @SoTienTNCN BIGINT,@SoTienTMB BIGINT

	SELECT @SoTienGTGT = b.SoTienGTGT1Thang,@SoTienTNCN = b.SoTienTNCN1Thang FROM dbo.KhaiThue a
	LEFT JOIN dbo.ChiTietKhaiThue b ON b.idKhaiThue = a.idKhaiThue
	WHERE a.masothue = @masothue AND a.nam = DATEPART(YEAR,GETDATE())

	SELECT @SoTienTMB = c.MucThue FROM dbo.KhaiThue a
	LEFT JOIN dbo.thuemonbai b ON b.idKhaiThue = a.idKhaiThue
	LEFT JOIN dbo.mucluc_MonBai c ON c.Bac = b.Bac
	WHERE a.masothue = @masothue


	SET @HieuSoGTGT =  (@SoTienGTGT -ISNULL(@SoNoGTGT,0)) - (@thueGTGT +ISNULL(@SoDuGTGT,0))
	SET @HieuSoTNCN =  (@SoTienTNCN-ISNULL(@SoNoTNCN,0)) - (@thueTNCN+ISNULL(@SoDuTNCN,0))
	SET @HieuSoTMB =  (@SoTienTMB-ISNULL(@SoNoTNCN,0)) - (@thuemonbai+ISNULL(@SoDuTNCN,0))

	IF(@HieuSoGTGT < 0)
	BEGIN
		INSERT INTO dbo.sodu
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoGTGT, -- SoTien - int
		          '1003', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	IF(@HieuSoGTGT > 0)
	BEGIN
		INSERT INTO dbo.sono
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoGTGT, -- SoTien - int
		          '1003', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	IF(@HieuSoTNCN < 0)
	BEGIN
		INSERT INTO dbo.sodu
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoTNCN, -- SoTien - int
		          '1701', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	IF(@HieuSoTNCN > 0)
	BEGIN
		INSERT INTO dbo.sono
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoTNCN, -- SoTien - int
		          '1701', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 

	IF(@HieuSoTMB < 0)
	BEGIN
		INSERT INTO dbo.sodu
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoTNCN, -- SoTien - int
		          '0000', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	IF(@HieuSoTMB > 0)
	BEGIN
		INSERT INTO dbo.sono
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoTNCN, -- SoTien - int
		          '0000', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
    END 
	



GO

