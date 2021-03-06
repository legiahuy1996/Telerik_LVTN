USE [up6]
GO

/****** Object:  StoredProcedure [dbo].[Insert_ChitietKhaiThue_NotXML]    Script Date: 7/4/2018 10:46:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Insert_ChitietKhaiThue_NotXML]
    @idKhaiThue NVARCHAR(14) = NULL ,
    @DoanhThu NVARCHAR(14) = NULL ,
    @manganh NVARCHAR(14) = NULL ,
    @nghekinhdoanh NVARCHAR(100) = NULL
AS
    BEGIN
        DECLARE @TongDanhThu BIGINT ,
            @SoTienGTGT1Thang BIGINT ,
            @SoTienTNCN1Thang BIGINT ,
            @TongSoTienNop BIGINT
        SELECT  @SoTienGTGT1Thang = ( (TyLeTinhThueGTGT/100) * @DoanhThu ) ,
                @SoTienTNCN1Thang = ( (TyLeTinhThueTNCN/100) * @DoanhThu )
        FROM    dbo.manganh
        WHERE   manganh = @manganh
        SET @TongSoTienNop = ( @SoTienGTGT1Thang + @SoTienTNCN1Thang )
		PRINT @SoTienGTGT1Thang
		PRINT @SoTienTNCN1Thang
		PRINT @DoanhThu
		PRINT @TongSoTienNop
		IF NOT EXISTS(SELECT TOP 1 1 FROM dbo.ChiTietKhaiThue WHERE manganh = @manganh AND idKhaiThue = @idKhaiThue)
		BEGIN
        PRINT ' insert'
			INSERT  INTO dbo.ChiTietKhaiThue
					( idKhaiThue ,
					  DoanhThu ,
					  SoTienGTGT1Thang ,
					  SoTienTNCN1Thang ,
					  TongSoTienNop ,
					  manganh ,
					  nghekinhdoanh
					)
			VALUES  ( @idKhaiThue , -- idKhaiThue - int
					  @DoanhThu , -- DoanhThu - int
					  @SoTienGTGT1Thang , -- SoTienGTGT1Thang - int
					  @SoTienTNCN1Thang , -- SoTienTNCN1Thang - int
					  @TongSoTienNop , -- TongSoTienNop - int
					  @manganh , -- manganh - nvarchar(10)
					  @nghekinhdoanh -- nghekinhdoanh - nvarchar(50)
					)PRINT 'a'
		END 
		ELSE
			BEGIN
			PRINT 'update'
				UPDATE dbo.ChiTietKhaiThue
				SET DoanhThu = @DoanhThu,
					SoTienGTGT1Thang = @SoTienGTGT1Thang,
					SoTienTNCN1Thang = @SoTienTNCN1Thang,
					TongSoTienNop =@TongSoTienNop,
					nghekinhdoanh =CASE WHEN nghekinhdoanh <> @nghekinhdoanh then ( nghekinhdoanh +', '+ @nghekinhdoanh) ELSE @nghekinhdoanh END 
				WHERE manganh = @manganh
            END 
        SELECT  @TongDanhThu = TongDoanhThu 
        FROM    dbo.KhaiThue
        WHERE   idKhaiThue = @idKhaiThue
		
        UPDATE  dbo.KhaiThue
        SET     TongDoanhThu = @TongDanhThu
        WHERE   idKhaiThue = @idKhaiThue
        --IF ( @TongDanhThu > 100000000 )
        --    BEGIN
        --        IF ( @TongDanhThu <= 300000000 )
        --            BEGIN
        --                PRINT 'bac3'
        --                INSERT  INTO thuemonbai
        --                        ( trangthai, Bac, idKhaiThue )
        --                VALUES  ( 0, 3, @idKhaiThue )
        --            END 
        --        IF ( @TongDanhThu > 300000000 )
        --            BEGIN
        --                PRINT 'bac2'
        --                INSERT  INTO thuemonbai
        --                        ( trangthai, Bac, idKhaiThue )
        --                VALUES  ( 0, 2, @idKhaiThue )
        --            END 
        --        ELSE
        --            IF ( @TongDanhThu > 500000000 )
        --                BEGIN
        --                    PRINT 'bac1'
        --                    INSERT  INTO thuemonbai
        --                            ( trangthai, Bac, idKhaiThue )
        --                    VALUES  ( 0, 1, @idKhaiThue )
        --                END 
        --    END
        DECLARE @Dem INT 
            
        SELECT  @Dem = COUNT(idChiTiet)
        FROM    dbo.ChiTietKhaiThue
        WHERE   idKhaiThue = @idKhaiThue
        IF ( @Dem = 1 )
            BEGIN
                PRINT '1 ma nganh'
                SELECT  @manganh = manganh
                FROM    dbo.ChiTietKhaiThue
                WHERE   idKhaiThue = @idKhaiThue
                PRINT @manganh
                PRINT @idKhaiThue
                UPDATE  dbo.KhaiThue
                SET     manganh = @manganh
                WHERE   idKhaiThue = @idKhaiThue
            END
        ELSE
            BEGIN
                PRINT 'nhieu ma nganh'
                UPDATE  dbo.KhaiThue
                SET     manganh = '07'
                WHERE   idKhaiThue = @idKhaiThue 
            END


    END	



GO

