USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Insert_SoLieuNopThue]    Script Date: 5/26/2018 11:38:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Insert_SoLieuNopThue]
@masothue NVARCHAR(14)=NULL,
@macbql NVARCHAR(20)=NULL,
@sotiennop FLOAT =NULL,
@ngaynop NVARCHAR(10)=NULL,
@KyThue NVARCHAR(20)=NULL,
@tieumuc NVARCHAR(10)=NULL,
@muc NVARCHAR(10)=null
as
BEGIN
	SET @KyThue = '0'+RIGHT(@KyThue,6)
	PRINT @ngaynop
	DECLARE @date DATETIME
	SET @date = CONVERT(DATETIME,@ngaynop,103)
	PRINT @KyThue

	IF EXISTS (SELECT TOP 1 1 FROM dbo.SoLieuTuNganHang WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc = @tieumuc)
		BEGIN
			UPDATE dbo.SoLieuTuNganHang
			SET macbql = @macbql,
				SoTienNop = @sotiennop,
				NgayNop = @date,
				KyThue = @KyThue,
				muc = @muc 
			WHERE masothue = @masothue AND KyThue = @KyThue AND tieumuc = @tieumuc
		END 
	ELSE
		BEGIN
			INSERT INTO dbo.SoLieuTuNganHang
			        (
			          masothue ,
			          macbql ,
			          SoTienNop ,
			          NgayNop ,
			          KyThue ,
			          tieumuc ,
			          muc
			        )
			VALUES  ( 
			          @masothue , -- masothue - varchar(14)
			          @macbql , -- macbql - varchar(20)
			          @sotiennop , -- SoTienNop - int
			          @date , -- NgayNop - date
			          @KyThue , -- KyThue - nvarchar(50)
			          @tieumuc, -- tieumuc - nvarchar(255)
			          @muc  -- muc - nvarchar(255)
			        )
		END 
END 


GO

