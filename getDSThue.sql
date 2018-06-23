USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[getDSThue]    Script Date: 6/23/2018 1:07:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[getDSThue]
    @masothue VARCHAR(14) = NULL ,
    --@diachicuahang VARCHAR(255) = NULL ,
    @sogiayphep VARCHAR(50) = NULL ,
    @manganh VARCHAR(10) = NULL ,
    @nam VARCHAR(4) = NULL ,
    @TrangThai NVARCHAR(1) = NULL
AS
    BEGIN 
        SELECT DISTINCT
                a.idKhaiThue ,
                a.masothue ,
                a.TongDoanhThu ,
                a.nam ,a.Lan AS lankhaithue,
                CASE WHEN d.Bac IS NULL THEN '-'
                     ELSE d.Bac
                END AS Bac ,
                b.diachiKD ,
                CASE WHEN a.TrangThaiHoatDong = 1 THEN N'Đang hoạt động'
                     ELSE N'Ngừng hoạt động'
                END AS TrangThaiHoatDong ,
                a.TongDoanhThu * c.TyLeTinhThueGTGT AS ThueGTGT ,
                a.TongDoanhThu * c.TyLeTinhThueTNCN AS ThueTNCN ,
                b.sogp ,
                CASE WHEN a.manganh = '07' THEN N'Hoạt động nhiều ngành nghề'
                     ELSE c.tennganh
                END AS tennganh,
				f.lydo AS LyDo
				,f.mattngungnghi 
        FROM    dbo.KhaiThue a
                LEFT JOIN dbo.DanhBa b ON b.masothue = a.masothue
                LEFT JOIN dbo.manganh c ON c.manganh = a.manganh
                LEFT JOIN dbo.thuemonbai d ON d.idKhaiThue = a.idKhaiThue
                LEFT JOIN dbo.ChiTietKhaiThue e ON e.idKhaiThue = a.idKhaiThue
				LEFT JOIN dbo.thongtinngungnghi f ON f.idKhaiThue = a.idKhaiThue
        WHERE   1 = 1
                AND ( @TrangThai IS NULL
                      OR @TrangThai = '2'
                      OR a.TrangThaiHoatDong = @TrangThai
                    )
                AND ( @nam IS NULL
                      OR @nam = ''
                      OR a.nam = @nam
                    )
                AND ( @masothue IS NULL
                      OR @masothue = ''
                      OR a.masothue = @masothue
                    )
                AND ( @manganh IS NULL
                      OR @manganh = ''
                      OR c.manganh = @manganh
                    )
                AND ( @sogiayphep IS NULL
                      OR @sogiayphep = ''
                      OR b.sogp LIKE N'%' + @sogiayphep + '%'
                    )
        ORDER BY a.masothue,a.Lan
		
    END
GO

