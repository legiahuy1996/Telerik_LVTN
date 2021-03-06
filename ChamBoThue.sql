USE [up6]
GO
/****** Object:  StoredProcedure [dbo].[ChamBoThue]    Script Date: 7/12/2018 8:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[ChamBoThue] 
@idSoBoThue NVARCHAR(14)=NULL,
@ReturnMess NVARCHAR(500) = NULL OUT
AS
BEGIN
	DECLARE @idKhaiThue NVARCHAR(14),@Thang int ,@nam NVARCHAR(4),@masothue NVARCHAR(14)
	DECLARE @HieuSoGTGT bigint,@HieuSoTNCN BIGINT,@SoDuGTGT BIGINT, @SoDuTNCN BIGINT,@SoNoGTGT BIGINT,@SoNoTNCN BIGINT
	DECLARE @SoDuTMB BIGINT,@SoNoTMB BIGINT, @HieuSoTMB BIGINT
	--Lấy số tiền TNCN,GTGT phải đóng
	DECLARE @SoTienGTGT BIGINT , @SoTienTNCN BIGINT,@SoTienTMB BIGINT
	SELECT @idKhaiThue = idKhaiThue,
		   @Thang=Thang,
		   @SoTienGTGT = SoTienGTGT1Thang,
		   @SoTienTNCN = SoTienTNCN1Thang 
	FROM dbo.SoBoThue 
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
	DECLARE @KyThueTruoc NVARCHAR(7)
		DECLARE @thangtruoc INT
		SET @thangtruoc = @Thang - 1
		SET @KyThueTruoc = CONVERT(NVARCHAR(2),@thangtruoc)  +'/'+@nam
		IF(LEN(@KyThueTruoc) = 6)
		BEGIN
			SET @KyThueTruoc = '0'+@KyThueTruoc
		END 
	DECLARE @trangthai BIT,@thuemonbai FLOAT, @thueGTGT FLOAT, @thueTNCN FLOAT
    SELECT @trangthai = trangthai FROM dbo.thuemonbai WHERE idKhaiThue = @idKhaiThue 
	IF(@trangthai =  0)
	BEGIN
		-- số tiền môn bài phải đóng
		SELECT @SoTienTMB = CASE WHEN DATEPART(MONTH,a.ngaykhaithue)>6 THEN (c.MucThue/2) ELSE c.MucThue END FROM dbo.KhaiThue a
		LEFT JOIN dbo.thuemonbai b ON b.idKhaiThue = a.idKhaiThue
		LEFT JOIN dbo.mucluc_MonBai c ON c.Bac = b.Bac
		WHERE a.masothue = @masothue
		--số tiền môn bài đã đóng
		SELECT @thuemonbai = SUM(sotiennop) FROM dbo.SoLieuTuKhoBac
		WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc = '0000' AND muc = '1800'
		PRINT @thuemonbai
		--số nợ ,số dư môn bài
		
		SELECT @SoNoTMB = SoTien FROM dbo.sono WHERE tieumuc ='0000' AND KyThue = @KyThueTruoc
		SELECT @SoDuTMB = SoTien FROM dbo.sodu WHERE tieumuc ='0000' AND KyThue = @KyThueTruoc
		-- Tính hiệu số
		SET @HieuSoTMB =  (ISNULL(@SoNoTMB,@SoTienTMB)) - (ISNULL(@thuemonbai,0)+ISNULL(@SoDuTMB,0))
		PRINT @HieuSoTMB
		IF(@HieuSoTMB < 0)
		BEGIN
			IF NOT EXISTS ( SELECT TOP 1 1 FROM sodu WHERE masothue = @masothue AND KyThue = KyThue AND tieumuc ='0000')
			BEGIN
				PRINT'du TMB'
				INSERT INTO dbo.sodu
						( KyThue, SoTien, tieumuc, masothue )
				VALUES  ( @KyThue, -- KyThue - nvarchar(50)
						  @HieuSoTMB, -- SoTien - int
						  '0000', -- tieumuc - int
						  @masothue  -- masothue - varchar(14)
						  )
				UPDATE dbo.thuemonbai 
				SET trangthai = 1
				WHERE idKhaiThue = @idKhaiThue
			END
            ELSE
            BEGIN
				UPDATE dbo.sodu
				SET	SoTien = @HieuSoTMB
				WHERE masothue = @masothue
				AND KyThue = @KyThue
				AND tieumuc = '0000'
            END 
		END 
		IF(@HieuSoTMB > 0)
		BEGIN
			IF NOT EXISTS ( SELECT TOP 1 1 FROM sono WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc ='0000')
			BEGIN
				PRINT N'nợ thuếTMB'
				INSERT INTO dbo.sono
						( KyThue, SoTien, tieumuc, masothue )
				VALUES  ( @KyThue, -- KyThue - nvarchar(50)
						  @HieuSoTMB, -- SoTien - int
						  '0000', -- tieumuc - int
						  @masothue  -- masothue - varchar(14)
						)
			END 
			ELSE
            BEGIN
				UPDATE dbo.sono
				SET SoTien = @HieuSoTMB
				WHERE masothue = @masothue
				AND KyThue = @KyThue
				AND tieumuc = '0000'
            end
		END
		ELSE IF @HieuSoTMB =0
		BEGIN
			UPDATE dbo.thuemonbai 
			SET trangthai = 1
			WHERE idKhaiThue = @idKhaiThue
		END  
    END
    --Số tiền GTGTN,TNCN đã đóng
	SELECT @thueGTGT = SUM(SoTienNop)  FROM dbo.SoLieuTuKhoBac 
	WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc ='1701'

	SELECT @thueTNCN =SUM(SoTienNop)  FROM dbo.SoLieuTuKhoBac 
	WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc ='1003'
	--Số nợ, số dư GTGTN,TNCN
	SELECT @SoDuGTGT = SoTien FROM dbo.sodu WHERE tieumuc ='1701' AND KyThue = @KyThueTruoc
	SELECT @SoDuTNCN = SoTien FROM dbo.sodu WHERE tieumuc ='1003' AND KyThue = @KyThueTruoc

	SELECT @SoNoGTGT = SoTien FROM dbo.sono WHERE tieumuc ='1701' AND KyThue = @KyThueTruoc	
	SELECT @SoNoTNCN = SoTien FROM dbo.sono WHERE tieumuc ='1003' AND KyThue = @KyThueTruoc
	
	SET @HieuSoGTGT =  (@SoTienGTGT +ISNULL(@SoNoGTGT,0)) - (ISNULL(@thueGTGT,0) +ISNULL(@SoDuGTGT,0))
	SET @HieuSoTNCN =  (@SoTienTNCN +ISNULL(@SoNoTNCN,0)) - (ISNULL(@thueTNCN,0)+ISNULL(@SoDuTNCN,0))
	IF(@HieuSoGTGT < 0)
	BEGIN
		IF NOT EXISTS ( SELECT TOP 1 1 FROM sodu WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc='1701')
		begin
		INSERT INTO dbo.sodu
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoGTGT, -- SoTien - int
		          '1701', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		         )
		END
		ELSE
		BEGIN
				UPDATE dbo.sodu
				SET SoTien = @HieuSoGTGT
				WHERE masothue = @masothue
				AND KyThue = @KyThue
				AND tieumuc = '1701'
		end 
    END 
	IF(@HieuSoGTGT > 0)
	BEGIN
		IF NOT EXISTS(SELECT TOP 1 1 FROM sono WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc='1701')
		BEGIN
			INSERT INTO dbo.sono
					( KyThue, SoTien, tieumuc, masothue )
			VALUES  ( @KyThue, -- KyThue - nvarchar(50)
					  @HieuSoGTGT, -- SoTien - int
					  '1701', -- tieumuc - int
					  @masothue  -- masothue - varchar(14)
					  )
		END
        ELSE
        BEGIN
			UPDATE dbo.sono
				SET SoTien = @HieuSoGTGT
				WHERE masothue = @masothue
				AND KyThue = @KyThue
				AND tieumuc = '1701'
        end
    END 
	IF(@HieuSoTNCN < 0)
	BEGIN
		IF NOT EXISTS(SELECT TOP 1 1 FROM dbo.sodu WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc='1003')
		BEGIN
		INSERT INTO dbo.sodu
		        ( KyThue, SoTien, tieumuc, masothue )
		VALUES  ( @KyThue, -- KyThue - nvarchar(50)
		          @HieuSoTNCN, -- SoTien - int
		          '1003', -- tieumuc - int
		          @masothue  -- masothue - varchar(14)
		          )
		END
		ELSE
        BEGIN
			UPDATE dbo.sodu
				SET SoTien = @HieuSoTNCN
				WHERE masothue = @masothue
				AND KyThue = @KyThue
				AND tieumuc = '1003'
        END 
    END 
	IF(@HieuSoTNCN > 0)
	BEGIN
		IF NOT EXISTS(SELECT TOP 1 1 FROM dbo.sono WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc='1003')
		BEGIN
			INSERT INTO dbo.sono
					( KyThue, SoTien, tieumuc, masothue )
			VALUES  ( @KyThue, -- KyThue - nvarchar(50)
					  @HieuSoTNCN, -- SoTien - int
					  '1003', -- tieumuc - int
					  @masothue  -- masothue - varchar(14)
					  )
		END
        ELSE
        BEGIN
			UPDATE dbo.sono
			SET SoTien = @HieuSoTNCN
			WHERE masothue = @masothue
			AND KyThue = @KyThue
			AND tieumuc = '1003' 
        end
    END 

END 
