USE [thue]
GO
/****** Object:  StoredProcedure [dbo].[sp_frmKTDangNhap]    Script Date: 6/7/2018 8:39:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[sp_frmKTDangNhap]
@TenDangNhap NVARCHAR(50) = NULL,
@MatKhau	NVARCHAR(50) = NULL
AS
BEGIN
DECLARE @KiemTraTenDangNhap INT,@KiemTraMatKhau INT,@TrangThai INT,@OutPut INT
SELECT @KiemTraTenDangNhap = ISNULL(email,0) FROM dbo.nguoisudung WHERE email = @TenDangNhap
SELECT @TrangThai = ISNULL(trangthai,0) FROM dbo.nguoisudung WHERE email = @TenDangNhap
IF (@KiemTraTenDangNhap = 0)
 SET @OutPut = 1 --sai tên đăng nhập
ELSE
BEGIN
	SELECT @KiemTraMatKhau = ISNULL(COUNT(*),0) FROM dbo.nguoisudung WHERE email = @TenDangNhap AND matkhau = @MatKhau
	IF(@KiemTraMatKhau = 0)
	SET @OutPut = 2 --Sai mật khẩu
	ELSE
	BEGIN
		IF (@TrangThai = 0)
		SET @OutPut = 3 --tài khoản bị khóa
		ELSE
        SET @OutPut = 0
	END
END
SELECT @OutPut AS KetQua
END	