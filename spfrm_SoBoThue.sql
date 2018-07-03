USE [up6]
GO

/****** Object:  StoredProcedure [dbo].[spfrm_SoBoThue]    Script Date: 7/3/2018 9:55:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER  PROC [dbo].[spfrm_SoBoThue]
@MST VARCHAR(50) = NULL,
@CMND VARCHAR(9) = NULL,
@TenCuaHang  NVARCHAR(150) = NULL,
@ngaycapCMND  NVARCHAR(10) = NULL,
@sogp    VARCHAR(50) = NULL,
@diachi  NVARCHAR(100) = NULL,
@hoten   NVARCHAR(100)=NULL,
@ngaytinhthue  NVARCHAR(10)=NULL,
@manganh VARCHAR(10) = NULL,
@sdt	NVARCHAR(12)=NULL,
@idKhaiThue INT =NULL,

-----------------------------
@Activity  NVARCHAR(10)= NULL,
@ReturnMess		NVARCHAR(50)=NULL


AS
BEGIN

	DECLARE
					  @thangkinhdoanh INT ,
					  @doanhthutinhthueGTGT INT,
					  @doanhthutinhthueTNCN INT ,
					  @TyLeTinhThueGTGT FLOAT,
                      @TyLeTinhThueTNCN FLOAT ,
					  @SoTienGTGT1Thang INT,
					  @SoTienTNCN1Thang INT,
					  @count INT,
					  @ThueMonBai INT,
					  @SoNo INT, @TongCong INT

					
					SELECT @thangkinhdoanh = DATEPART(MONTH,b.ngaybatdaukd), @hoten = b.hoten
						  ,@diachi = b.diachiKD,@doanhthutinhthueGTGT =a.TongDoanhThu,@doanhthutinhthueTNCN = a.TongDoanhThu
						  ,@SoTienGTGT1Thang = c.SoTienGTGT1Thang, @SoTienTNCN1Thang = c.SoTienTNCN1Thang,@SoNo = d.SoTien
						  , @ThueMonBai = CASE WHEN e.trangthai = 0 THEN f.MucThue ELSE 0 END
					FROM dbo.KhaiThue a LEFT JOIN dbo.DanhBa b ON b.masothue = a.masothue
					LEFT JOIN dbo.SoBoThue (NOLOCK) c ON c.idKhaiThue = a.idKhaiThue
					LEFT JOIN dbo.sono (NOLOCK) d ON d.masothue = b.masothue
					LEFT JOIN dbo.thuemonbai (NOLOCK) e ON e.idKhaiThue = a.idKhaiThue
					LEFT JOIN dbo.mucluc_MonBai (NOLOCK) f ON f.Bac = e.Bac
				

					SELECT @count = COUNT(d.idChiTiet)
					FROM dbo.KhaiThue a 
					LEFT JOIN dbo.ChiTietKhaiThue d ON d.idKhaiThue = a.idKhaiThue
					WHERE a.idKhaiThue = @idKhaiThue
					IF(@count =1)
					BEGIN
							SELECT	   
							 @TyLeTinhThueGTGT = c.TyLeTinhThueGTGT,@TyLeTinhThueTNCN = c.TyLeTinhThueTNCN
							FROM dbo. KhaiThue a 
							LEFT JOIN dbo.DanhBa b ON b.masothue = a.masothue
							LEFT JOIN dbo.ChiTietKhaiThue d ON d.idKhaiThue = a.idKhaiThue
							LEFT JOIN dbo.manganh c ON c.manganh = d.manganh
							LEFT JOIN dbo.thue e ON e.idChiTiet = d.idChiTiet
							WHERE a.idKhaiThue = @idKhaiThue
                    END
					ELSE
					begin
						SELECT	   
							 @TyLeTinhThueGTGT = c.TyLeTinhThueGTGT,@TyLeTinhThueTNCN = c.TyLeTinhThueTNCN
							FROM dbo.KhaiThue a 
							LEFT JOIN dbo.DanhBa b ON b.masothue = a.masothue
							LEFT JOIN dbo.ChiTietKhaiThue d ON d.idKhaiThue = a.idKhaiThue
							LEFT JOIN dbo.manganh c ON c.manganh = d.manganh
							LEFT JOIN dbo.thue e ON e.idChiTiet = d.idChiTiet
							WHERE a.idKhaiThue = @idKhaiThue
							AND c.manganh = @manganh
					end

					SET @TongCong = @SoTienGTGT1Thang + @SoTienTNCN1Thang + @ThueMonBai + @SoNo
					SET @SoTienGTGT1Thang = @doanhthutinhthueGTGT * (@TyLeTinhThueGTGT/100)
					SET @SoTienTNCN1Thang = @doanhthutinhthueTNCN * (@TyLeTinhThueTNCN/100)
                   
	IF(@Activity = 'Search')
		BEGIN 
					PRINT 'search'

				SELECT a.idKhaiThue,b.masothue,a.nam,b.sodt,b.email,b.ghichu,c.tennganh,a.SoLuongLD,a.DienTichKD,b.diachiKD, 
					   CASE WHEN a.TrangThaiHoatDong = 1 THEN N'Đang hoạt động' ELSE N'Ngừng hoạt động' END AS TrangThaiHoatDong,
					   a.TongDoanhThu,a.TongDoanhThu AS DoanhThuTinhThueGTGT,a.TongDoanhThu AS DoanhThuTinhThueTNCN,c.TyLeTinhThueGTGT,c.TyLeTinhThueTNCN,b.hoten,
					   a.TuGio,a.DenGio,tennganh.nghekinhdoanh,CASE WHEN ISNULL(m_monbai.MucThue,'')='' THEN 0 ELSE m_monbai.MucThue END AS MucThue
				FROM dbo.KhaiThue a 
				LEFT JOIN dbo.ChiTietKhaiThue e ON e.idKhaiThue = a.idKhaiThue
				INNER JOIN dbo.DanhBa b ON b.masothue = a.masothue
				INNER JOIN dbo.manganh c ON c.manganh = a.manganh
				LEFT JOIN dbo.SoBoThue d ON d.idKhaiThue = a.idKhaiThue
				LEFT JOIN (SELECT CASE WHEN COUNT(e.idChiTiet)>1 THEN 'Hoạt động kinh doanh nhiều ngành nghề' ELSE e.nghekinhdoanh END AS nghekinhdoanh,e.idChiTiet
				FROM dbo.ChiTietKhaiThue e
				LEFT JOIN manganh f ON f.manganh = e.manganh
				GROUP BY e.idChiTiet,e.nghekinhdoanh) tennganh ON tennganh.idChiTiet = e.idChiTiet
				LEFT JOIN dbo.thuemonbai monbai ON monbai.idKhaiThue = a.idKhaiThue
				LEFT JOIN dbo.mucluc_MonBai m_monbai ON m_monbai.Bac = monbai.Bac
				WHERE 1=1 
				AND (@MST ='' OR @MST is NULL OR b.masothue =@MST)
				AND (@CMND ='' OR @CMND is NULL OR b.cmnd =@CMND)
				AND a.idKhaiThue not IN (SELECT a.idKhaiThue FROM dbo.SoBoThue a LEFT JOIN dbo.KhaiThue b ON b.idKhaiThue = a.idKhaiThue WHERE a.Thang = DATEPART(MM,GETDATE()) AND b.nam = DATEPART(YEAR,GETDATE()))
				AND a.nam = DATEPART(year,GETDATE())
				AND DATEPART(MONTH,a.ngaykhaithue) = DATEPART(MONTH,GETDATE())
				
		END
	ELSE 
		IF (@Activity = 'Create')
			BEGIN
			DECLARE @tennganh NVARCHAR(50)
			SELECT @tennganh = tennganh FROM dbo.manganh WHERE manganh = @manganh
			PRINT 'Create'
				INSERT INTO dbo.SoBoThue
				        ( idKhaiThue ,
				         Thang,
				          TinhTrangNopThue ,
				          NgayLapBo ,
				          DoanhThuTinhThueGTGT ,
				          DoanhThuTinhThueTNCN ,
				          TyLeTinhThueGTGT ,
				          TyLeTinhThueTNCN ,
				          SoTienGTGT1Thang ,
				          SoTienTNCN1Thang
				        )
				VALUES  ( @idKhaiThue , -- idKhaiThue - int				         
				          DATEPART(MONTH,GETDATE()), -- KDTuThang - int				          
				          0 , -- TinhTrangNopThue - bit
				          GETDATE() , -- NgayLapBo - date
				          @doanhthutinhthueGTGT , -- DoanhThuTinhThueGTGT - int
				          @doanhthutinhthueTNCN, -- DoanhThuTinhThueTNCN - int
				          @TyLeTinhThueGTGT , -- TyLeTinhThueGTGT - float
				          @TyLeTinhThueTNCN , -- TyLeTinhThueTNCN - float
				          @SoTienGTGT1Thang, -- SoTienGTGT1Thang - int
				          @SoTienTNCN1Thang  -- SoTienTNCN1Thang - int
				        )
				INSERT INTO dbo.ThongBaoNopThue
				        ( KyThue ,
				          idKhaiThue ,
				          ThueGTGN ,
				          ThueTNCN ,
				          ThueMonBai ,
				          SoNo ,
				          TongCong
				        )
				VALUES  (  DATEPART(MONTH,GETDATE()), -- KyThue - int
				          @idKhaiThue , -- idKhaiThue - int
				           @SoTienGTGT1Thang , -- ThueGTGN - int
				          @SoTienTNCN1Thang , -- ThueTNCN - int
				          @ThueMonBai , -- ThueMonBai - int
				          @SoNo , -- SoNo - int
				          @TongCong  -- TongCong - int
				        )
			END 
			
		
END

GO

