USE [thue]
GO

/****** Object:  Trigger [dbo].[TinhThue]    Script Date: 6/22/2018 6:01:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create TRIGGER [dbo].[TinhThue] ON [dbo].[ChiTietKhaiThue] FOR INSERT,UPDATE,DELETE
AS
DECLARE @TongDanhThu FLOAT,@idKhaiThue INT,@SoTien FLOAT,
		@idChiTiet int
SELECT @idKhaiThue = Inserted.idKhaiThue,@idChiTiet = Inserted.idChiTiet
FROM Inserted
SELECT @TongDanhThu = SUM(DoanhThu) FROM dbo.ChiTietKhaiThue
----------KHAI THUE
--tinh tong doanh thu
SELECT @TongDanhThu = sum(DoanhThu) FROM dbo.ChiTietKhaiThue 
WHERE idKhaiThue = @idKhaiThue 
UPDATE dbo.ChiTietKhaiThue
SET TongSoTienNop = (SoTienGTGT1Thang + SoTienTNCN1Thang) 
WHERE idChiTiet = @idChiTiet
UPDATE dbo.KhaiThue
set	TongDoanhThu = @TongDanhThu
WHERE idKhaiThue = @idKhaiThue
SELECT  @TongDanhThu = ( TongDoanhThu * 12 )
        FROM    dbo.KhaiThue
        WHERE   idKhaiThue = @idKhaiThue
        IF ( @TongDanhThu > 100000000 )
            BEGIN
                IF ( @TongDanhThu <= 300000000 )
                    BEGIN
                        PRINT 'bac3'
                        INSERT  INTO thuemonbai
                                ( trangthai, Bac, idKhaiThue )
                        VALUES  ( 0, 3, @idKhaiThue )
                    END 
                IF ( @TongDanhThu > 300000000 )
                    BEGIN
                        PRINT 'bac2'
                        INSERT  INTO thuemonbai
                                ( trangthai, Bac, idKhaiThue )
                        VALUES  ( 0, 2, @idKhaiThue )
                    END 
                ELSE
                    IF ( @TongDanhThu > 500000000 )
                        BEGIN
                            PRINT 'bac1'
                            INSERT  INTO thuemonbai
                                    ( trangthai, Bac, idKhaiThue )
                            VALUES  ( 0, 1, @idKhaiThue )
                        END 
            END


GO
