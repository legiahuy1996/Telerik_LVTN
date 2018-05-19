USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Insert_ChitietKhaiThue]    Script Date: 5/19/2018 8:05:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Insert_ChitietKhaiThue]
    @strXML NVARCHAR(MAX) = NULL
AS
    BEGIN
        DECLARE @handle INT
        DECLARE @Temp1 TABLE
            (
              idKhaiThue NVARCHAR(14) ,
              idchitiet NVARCHAR(14) ,
              DoanhThu NVARCHAR(14) ,
              NgheKinhDoanh NVARCHAR(100) ,
              manganh NVARCHAR(14)
            )  
				


        EXEC sp_xml_preparedocument @handle OUTPUT, @strXML
        INSERT  INTO @Temp1
                SELECT  A.idKhaiThue AS idKhaiThue ,
                        A.idchitiet AS idchitiet ,
                        A.DoanhThu AS DoanhThu ,
                        A.NgheKinhDoanh AS NgheKinhDoanh ,
                        A.manganh AS manganh
                FROM    OPENXML(@handle,'/Root/Record', 2)
		WITH
			(
				idKhaiThue NVARCHAR(14),
				idchitiet NVARCHAR(14),
				DoanhThu NVARCHAR(14),
				NgheKinhDoanh NVARCHAR(100),
				manganh NVARCHAR(14)
			) A		
		--SELECT * FROM @Temp1
			
        DECLARE @id NVARCHAR(14) ,
            @TongDanhThu FLOAT ,
            @idchitiet NVARCHAR(14),
			@manganh NVARCHAR(14),
			@doanhthu FLOAT,
			@nghekinhdoanh NVARCHAR(100)
        SELECT  @id = idKhaiThue ,
                @idchitiet = idchitiet,
				@manganh = manganh,
				@nghekinhdoanh = NgheKinhDoanh,
				@doanhthu = DoanhThu

        FROM    @Temp1
        IF ( ISNULL(@idchitiet, '') = '' )
            BEGIN
			PRINT  'insert'
                INSERT  INTO dbo.ChiTietKhaiThue
                        ( idKhaiThue ,
                          manganh ,
                          nghekinhdoanh ,
                          DoanhThu ,
                          SoTienGTGT1Thang ,
                          SoTienTNCN1Thang
			            )
                        SELECT  a.idKhaiThue ,
                                a.manganh ,
                                a.NgheKinhDoanh ,
                                a.DoanhThu ,
                                ( a.DoanhThu * b.TyLeTinhThueGTGT ) ,
                                ( a.DoanhThu * b.TyLeTinhThueTNCN )
                        FROM    @Temp1 a
                                LEFT JOIN dbo.manganh b ON b.manganh = a.manganh
                        WHERE   idchitiet IS NULL
                                OR idchitiet = ''
            END 
        ELSE
            BEGIN
			PRINT 'update'
                UPDATE  dbo.ChiTietKhaiThue 
               SET manganh = @manganh,
				   NgheKinhDoanh = @nghekinhdoanh,
                   DoanhThu = @doanhthu
			WHERE idChiTiet = @idchitiet
				
            END 
        SELECT  @TongDanhThu = ( TongDoanhThu * 12 )
        FROM    dbo.KhaiThue
        WHERE   idKhaiThue = @id
        IF ( @TongDanhThu > 100000000 )
            BEGIN
                IF ( @TongDanhThu <= 300000000 )
                    BEGIN
                        PRINT 'bac3'
                        INSERT  INTO thuemonbai
                                ( trangthai, Bac, idKhaiThue )
                        VALUES  ( 0, 3, @id )
                    END 
                IF ( @TongDanhThu > 300000000 )
                    BEGIN
                        PRINT 'bac2'
                        INSERT  INTO thuemonbai
                                ( trangthai, Bac, idKhaiThue )
                        VALUES  ( 0, 2, @id )
                    END 
                ELSE
                    IF ( @TongDanhThu > 500000000 )
                        BEGIN
                            PRINT 'bac1'
                            INSERT  INTO thuemonbai
                                    ( trangthai, Bac, idKhaiThue )
                            VALUES  ( 0, 1, @id )
                        END 
            END
        DECLARE @Dem INT 
            
        SELECT  @Dem = COUNT(idChiTiet)
        FROM    dbo.ChiTietKhaiThue
        WHERE   idKhaiThue = @id
        IF ( @Dem = 1 )
            BEGIN
                PRINT '1 ma nganh'
                SELECT  @manganh = manganh
                FROM    dbo.ChiTietKhaiThue
                WHERE   idKhaiThue = @id
                PRINT @manganh
                PRINT @id
                UPDATE  dbo.KhaiThue
                SET     manganh = @manganh
                WHERE   idKhaiThue = @id
            END
        ELSE
            BEGIN
                PRINT 'nhieu ma nganh'
                UPDATE  dbo.KhaiThue
                SET     manganh = '07'
                WHERE   idKhaiThue = @id 
            END


    END	



GO

