USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Insert_KhaiThue]    Script Date: 5/17/2018 10:33:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Insert_KhaiThue]
@idKhaiThue	NVARCHAR(14) = NULL,
@masothue		VARCHAR(14) = NULL,
@nam			VARCHAR(4) = NULL,
@DienTichKD		FLOAT = NULL,
@SoLuongLD		INT = NULL,
@TuGio			INT = NULL,
@DenGio			INT = NULL,
@TrangThaiHoatDong	BIT = NULL,
@Lan INT =NULL,
@ngaykhaithue NVARCHAR(10)=NULL,
@ReturnCode nvarchar(255) = null out,
@ReturnMess			nvarchar(500) = null OUT
AS
BEGIN
		IF(ISNULL(@idKhaiThue,'') ='')
		BEGIN
			DECLARE @curdate DATETIME,@id INT,@date datetime
			SET @curdate = GETDATE()
			SET @date = CONVERT(datetime,@ngaykhaithue,103)
		
		INSERT INTO dbo.KhaiThue
		        ( masothue ,
		          TongDoanhThu ,
		          nam ,
		          manganh ,
		          DienTichKD ,
		          SoLuongLD ,
		          ngaykhaithue ,
		          TrangThaiHoatDong ,
		          Lan ,
		          TuGio ,
		          DenGio ,
		          CreateTime ,
		          KyThue
		        )
		VALUES  (  @masothue , -- masothue - varchar(14)
			          0 , -- TongDoanhThu - int
			          @nam , -- nam - varchar(4)
			          null, -- manganh - varchar(10)
			          @DienTichKD , -- DienTichKD - float
			          @SoLuongLD , -- SoLuongLD - int
					  @date,
			          @TrangThaiHoatDong , -- TrangThaiHoatDong - bit
			          @Lan, -- Lan - int,
					  @TuGio,
					  @DenGio,
					  GETDATE(),
					  FORMAT(@curdate,'MM/yyyy')
		        )
			SELECT @id =idKhaiThue FROM dbo.KhaiThue WHERE CreateTime = @curdate
			SET @ReturnCode = @id
			return
        END
		ELSE
		BEGIN
			UPDATE dbo.KhaiThue
			SET masothue =@masothue,
				nam= @nam,
                DienTichKD =@DienTichKD,
                SoLuongLD = @SoLuongLD,
				ngaykhaithue = @ngaykhaithue,
                Lan = @Lan,
				TuGio=@TuGio,
				DenGio = @DenGio

		END  
END	

GO

