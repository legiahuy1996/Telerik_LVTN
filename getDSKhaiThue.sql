USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[getDSThue]    Script Date: 5/11/2018 8:30:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[getDSThue]
    @masothue VARCHAR(14) = NULL ,
    --@diachicuahang VARCHAR(255) = NULL ,
    @sogiayphep VARCHAR(50) = NULL ,
    @manganh VARCHAR(10) = NULL,
	@nam		VARCHAR(4) = null
AS
    BEGIN 
        SELECT  a.masothue ,
                a.TongDoanhThu ,
                a.nam ,
                d.bac ,
               e.NgheKinhDoanh AS nghekinhdoanh ,
                a.diachiKD ,
                CASE WHEN a.TrangThaiHoatDong =1 THEN N'Đang hoạt động' ELSE N'Ngừng hoạt động' END AS TrangThaiHoatDong ,
                a.TongDoanhThu * c.TyLeTinhThueGTGT AS ThueGTGT,
                a.TongDoanhThu * c.TyLeTinhThueTNCN AS ThueTNCN,
                b.sogp ,
                c.tennganh
        FROM    dbo.KhaiThue a
                LEFT JOIN dbo.DanhBa b ON b.masothue = a.masothue
                LEFT JOIN dbo.manganh c ON c.manganh = b.manganh
                LEFT JOIN dbo.thuemonbai d ON d.idKhaiThue = a.idKhaiThue
				LEFT JOIN dbo.ChiTietKhaiThue e ON e.idKhaiThue = a.idKhaiThue
        WHERE a.TrangThaiHoatDong = '1' AND 
		( @nam IS NULL
                  OR @nam = ''
                  OR a.nam = @nam
                ) AND 
		( @masothue IS NULL
                  OR @masothue = ''
                  OR a.masothue = @masothue
                )
                AND ( @manganh IS NULL
                      OR @manganh = ''
                      OR c.manganh = @manganh
                    )
                --AND ( @diachicuahang IS NULL
                --      OR @diachicuahang = ''
                --      OR a.diachiKD LIKE N'%' + @diachicuahang + '%'
                --    )
                AND ( @sogiayphep IS NULL
                      OR @sogiayphep = ''
                      OR b.sogp LIKE N'%' + @sogiayphep + '%'
                    )

    END
GO

