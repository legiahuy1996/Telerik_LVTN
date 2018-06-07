USE [thue]
GO
/****** Object:  StoredProcedure [dbo].[DanhSachHoCaThe]    Script Date: 6/2/2018 8:17:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[DanhSachHoCaThe]
@MST NVARCHAR(14)=NULL,
@CMND NVARCHAR(20)=NULL,
@TenCuaHang NVARCHAR(100)=NULL,
@NgayCap NVARCHAR(10)=NULL,
@SoGP NVARCHAR(50)=NULL,
@DiaChi NVARCHAR(100)=NULL,
@HoTen NVARCHAR(100)=NULL,
@NgayTinhThue NVARCHAR(10)=NULL,
@MaNganh NVARCHAR(14)=NULL,
@SDT NVARCHAR(14)=NULL,
@Activity NVARCHAR(20)
AS
BEGIN
IF @Activity =N'Search'
begin
	SELECT a.masothue,a.hoten,a.cmnd,b.tennganh,a.ngaysinh,a.ngaycapmst,a.ngaytinhthue,a.manganh,a.sodt,a.tencuahang,a.diachiKD,a.nghekinhdoanh,a.ngaybatdaukd,a.sogp,b.tennganh FROM dbo.DanhBa a
	LEFT JOIN dbo.manganh b ON b.manganh = a.manganh
	WHERE 1=1
	AND (@MST = '' OR @MST IS NULL OR a.masothue = @MST)
	AND (@CMND = '' OR @CMND IS NULL OR a.cmnd = @CMND)
	AND (@TenCuaHang = '' OR @TenCuaHang IS NULL OR a.tencuahang LIKE N'%'+@TenCuaHang+'%')
	AND (@NgayCap = '' OR @NgayCap IS NULL OR a.ngaycapmst = @NgayCap)
	AND (@SoGP = '' OR @SoGP IS NULL OR a.sogp = @SoGP)
	AND (@DiaChi = '' OR @DiaChi IS NULL OR a.diachiKD = @DiaChi)
	AND (@HoTen ='' OR @HoTen IS NULL OR a.hoten LIKE N'%'+@HoTen+'%')
	AND (@NgayTinhThue ='' OR @NgayTinhThue IS NULL OR a.ngaytinhthue = @NgayTinhThue)
	AND (@MaNganh ='' OR @MaNganh IS NULL OR b.manganh = @MaNganh)
	AND (@SDT ='' OR @SDT IS NULL OR a.sodt = @SDT)
END 
END 
