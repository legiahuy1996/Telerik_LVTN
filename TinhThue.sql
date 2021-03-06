USE [up6]
GO

/****** Object:  Trigger [dbo].[TinhThue]    Script Date: 7/4/2018 10:45:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[TinhThue] ON [dbo].[ChiTietKhaiThue] FOR INSERT,UPDATE,DELETE
AS
DECLARE @TongDanhThu float,@idKhaiThue INT,@SoTien BIGINT,
		@idChiTiet int
SELECT @idKhaiThue = Inserted.idKhaiThue,@idChiTiet = Inserted.idChiTiet
FROM Inserted
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
SELECT  @TongDanhThu = TongDoanhThu 
        FROM    dbo.KhaiThue
        WHERE   idKhaiThue = @idKhaiThue
		PRINT @TongDanhThu
              IF ( (@TongDanhThu*12) <= 300000000 AND (@TongDanhThu*12) > 100000000 )
                    BEGIN
                        PRINT 'bac3'
						IF NOT EXISTS ( SELECT TOP 1 1 FROM dbo.thuemonbai WHERE idKhaiThue = @idKhaiThue)
						begin
							INSERT  INTO thuemonbai
									( trangthai, Bac, idKhaiThue )
							VALUES  ( 0, 3, @idKhaiThue )
						END
                        ELSE
                        BEGIN
							UPDATE dbo.thuemonbai
							SET Bac = 3
							WHERE idKhaiThue = @idKhaiThue
                        END
                        
                    END 
                ELSE IF ( (@TongDanhThu*12) > 300000000  AND (@TongDanhThu*12) <500000000)
                    BEGIN
                        PRINT 'bac2'
						IF NOT EXISTS ( SELECT TOP 1 1 FROM dbo.thuemonbai WHERE idKhaiThue = @idKhaiThue)
						begin
							INSERT  INTO thuemonbai
									( trangthai, Bac, idKhaiThue )
							VALUES  ( 0, 2, @idKhaiThue )
						END
                        ELSE
                        BEGIN
								UPDATE dbo.thuemonbai
								SET Bac = 2
								WHERE idKhaiThue = @idKhaiThue
                        END
                    END 
                ELSE
                    IF ( (@TongDanhThu*12) >= 500000000 )
                        BEGIN
                            PRINT 'bac1'
							IF NOT EXISTS ( SELECT TOP 1 1 FROM dbo.thuemonbai WHERE idKhaiThue = @idKhaiThue)
							begin
								INSERT  INTO thuemonbai
										( trangthai, Bac, idKhaiThue )
								VALUES  ( 0, 1, @idKhaiThue )
							END 
							ELSE
							BEGIN
									UPDATE dbo.thuemonbai
									SET Bac = 1
									WHERE idKhaiThue = @idKhaiThue
							END
                    END 


GO

