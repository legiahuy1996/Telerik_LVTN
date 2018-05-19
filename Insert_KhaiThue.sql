USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Insert_KhaiThue]    Script Date: 5/19/2018 8:05:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Insert_KhaiThue]
    @idKhaiThue NVARCHAR(14) = NULL ,
    @masothue VARCHAR(14) = NULL ,
    @nam VARCHAR(4) = NULL ,
    @DienTichKD FLOAT = NULL ,
    @SoLuongLD INT = NULL ,
    @TuGio INT = NULL ,
    @DenGio INT = NULL ,
    @TrangThaiHoatDong BIT = NULL ,
    @Lan INT = NULL ,
    @ngaykhaithue NVARCHAR(10) = NULL ,
    @ReturnCode NVARCHAR(255) = NULL OUT ,
    @ReturnMess NVARCHAR(500) = NULL OUT
AS
    BEGIN
        IF NOT EXISTS ( SELECT TOP 1
                                1
                        FROM    dbo.DanhBa
                        WHERE   masothue = @masothue )
            BEGIN
                SET @ReturnCode = '-1'
                RETURN
            END 
        DECLARE @curdate DATETIME ,
            @id INT ,
            @date DATETIME
        SET @curdate = GETDATE()
        SET @date = CONVERT(DATETIME, @ngaykhaithue, 103)
        IF ( ISNULL(@idKhaiThue, '') = '' )
            BEGIN
				PRINT'insert'
		
                INSERT  INTO dbo.KhaiThue
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
                          CreateTime 
		                )
                VALUES  ( @masothue , -- masothue - varchar(14)
                          0 , -- TongDoanhThu - int
                          @nam , -- nam - varchar(4)
                          NULL , -- manganh - varchar(10)
                          @DienTichKD , -- DienTichKD - float
                          @SoLuongLD , -- SoLuongLD - int
                          @date ,
                          @TrangThaiHoatDong , -- TrangThaiHoatDong - bit
                          @Lan , -- Lan - int,
                          @TuGio ,
                          @DenGio ,
                          GETDATE() 
                         
                        )
                SELECT  @id = idKhaiThue
                FROM    dbo.KhaiThue
                WHERE   CreateTime = @curdate
                SET @ReturnCode = @id
                RETURN
            END
        ELSE
            BEGIN
                UPDATE  dbo.KhaiThue
                SET     masothue = @masothue ,
                        nam = @nam ,
                        DienTichKD = @DienTichKD ,
                        SoLuongLD = @SoLuongLD ,
                        ngaykhaithue = @date ,
                        Lan = @Lan ,
                        TuGio = @TuGio ,
                        DenGio = @DenGio
						WHERE idKhaiThue = @idKhaiThue

						 SET @ReturnCode = @idKhaiThue
                RETURN
            END  
    END	

GO

