USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[DanhSachKhaiThue_Import]    Script Date: 5/26/2018 11:40:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[DanhSachKhaiThue_Import]
@masothue NVARCHAR(140)=NULL,
@nam NVARCHAR(4)=NULL,
@ngaykhaithue NVARCHAR(10)=NULL,
@manganh NVARCHAR(14)=NULL,
@TuGio INT =NULL,
@DenGio INT =NULL,
@trangthai BIT =NULL,
@soluongLD INT =NULL,
@doanhthu FLOAT =NULL,
@dientichKD FLOAT =NULL,
@nghekinhdoanh NVARCHAR(100)=NULL
AS
BEGIN
	IF EXISTS (SELECT TOP 1 1 FROM dbo.KhaiThue WHERE masothue = @masothue AND nam = @nam)
		BEGIN
			PRINT 'update khai thuế'
			DECLARE @idkhaithue NVARCHAR(14)
			SELECT @idkhaithue = idKhaiThue FROM dbo.KhaiThue WHERE masothue = @masothue AND nam = @nam
			UPDATE dbo.KhaiThue 
			SET ngaykhaithue = @ngaykhaithue,
				lan = lan +1  ,
				TuGio = @TuGio,
				DenGio = @DenGio,
				TrangThaiHoatDong = @trangthai,
				SoLuongLD = @soluongLD,
				DienTichKD = @dientichKD
			WHERE idKhaiThue = @idkhaithue

			PRINT 'update chi tiết'
		END 
	ELSE
		BEGIN
			DECLARE @curdate DATETIME
			SET @curdate = GETDATE()
			PRINT 'insert khai thuế'
			INSERT INTO dbo.KhaiThue
			        ( masothue ,TongDoanhThu ,nam ,manganh ,DienTichKD ,SoLuongLD ,ngaykhaithue ,TrangThaiHoatDong ,
			          Lan ,TuGio ,DenGio ,CreateTime
			        )
			VALUES  ( @masothue , -- masothue - varchar(14)
			          0 , -- TongDoanhThu - int
			          @nam, -- nam - varchar(4)
			          @manganh , -- manganh - varchar(10)
					  @dientichKD , -- DienTichKD - float
			          @soluongLD , -- SoLuongLD - int
			          GETDATE() , -- ngaykhaithue - datetime
			          @trangthai , -- TrangThaiHoatDong - bit
			          1 , -- Lan - int
			          @TuGio , -- TuGio - int
			          @DenGio , -- DenGio - int
			          @curdate  -- CreateTime - datetime
			        )
			PRINT 'insert chi tiết khai thuế'
			DECLARE @id NVARCHAR(14)
			SELECT @id = idKhaiThue FROM dbo.KhaiThue WHERE CreateTime = @curdate
			INSERT INTO dbo.ChiTietKhaiThue
			        ( idKhaiThue ,
			          DoanhThu ,
			          SoTienGTGT1Thang ,
			          SoTienTNCN1Thang ,
			          TongSoTienNop ,
			          manganh ,
			          nghekinhdoanh
			        )
			VALUES  ( @id , -- idKhaiThue - int
			          @doanhthu, -- DoanhThu - int
			          0 , -- SoTienGTGT1Thang - int
			          0 , -- SoTienTNCN1Thang - int
			          0 , -- TongSoTienNop - int
			          @manganh , -- manganh - nvarchar(10)
			          @nghekinhdoanh  -- nghekinhdoanh - nvarchar(50)
			        )

		END 
END 
GO

