USE [thue]
GO

/****** Object:  Trigger [dbo].[TinhThue2]    Script Date: 5/19/2018 8:04:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TinhThue2] ON [dbo].[ChiTietKhaiThue]
    FOR DELETE
AS
    DECLARE @TongDanhThu FLOAT ,
        @idKhaiThue INT ,
        @SoTien FLOAT ,
        @idChiTiet INT
    SELECT  @idKhaiThue = Deleted.idKhaiThue
    FROM    Deleted
----------KHAI THUE
--tinh tong doanh thu
    SELECT  @TongDanhThu = SUM(DoanhThu)
    FROM    dbo.ChiTietKhaiThue
    WHERE   idKhaiThue = @idKhaiThue 
    IF ( ISNULL(@TongDanhThu, '') = '' )
        BEGIN
            SET @TongDanhThu = 0
        END
    UPDATE  dbo.ChiTietKhaiThue
    SET     TongSoTienNop = ( SoTienGTGT1Thang + SoTienTNCN1Thang )
    WHERE   idChiTiet = @idChiTiet
    UPDATE  dbo.KhaiThue
    SET     TongDoanhThu = @TongDanhThu
    WHERE   idKhaiThue = @idKhaiThue

GO

