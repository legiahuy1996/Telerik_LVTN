ALTER PROC DanhSachHoCaThe_Import
@MST	VARCHAR(14) = NULL,
@hoten	NVARCHAR(50) = NULL,
@CMND	VARCHAR(20) = NULL,
@ngaysinh	NVARCHAR(10) = NULL,
@tencuahang	NVARCHAR(300) = NULL,
@diachiKD	NVARCHAR(300) = NULL,
@nghekinhdoanh	NVARCHAR(200) = NULL,
@ngaybatdaukd	NVARCHAR(10) = NULL,
@sogp VARCHAR(50) = NULL,
@madp	VARCHAR(50) = NULL
AS
DECLARE @dngaysinh DATE, @dngaybatdaukd DATE
	SET @dngaysinh = CONVERT(DATE,@ngaysinh,103)
	SET @dngaybatdaukd = CONVERT(DATE,@ngaybatdaukd,103)
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.maduongpho WHERE madp = @madp)
	BEGIN
		PRINT 'Không tồn tại mã đường phố này'
		return
	END
	IF EXISTS (SELECT TOP 1 1 FROM dbo.DanhBa WHERE masothue = @MST)
	BEGIN
		UPDATE dbo.DanhBa
		SET hoten = @hoten,
			cmnd = @CMND,
			ngaysinh = @dngaysinh,
			tencuahang = @tencuahang,
			diachiKD = @diachiKD,
			nghekinhdoanh = @nghekinhdoanh,
			ngaybatdaukd = @dngaybatdaukd,
			sogp = @sogp,
			madp = @madp
		WHERE masothue = @MST

		PRINT 'update danh bạ'
	END
	ELSE
    BEGIN
		INSERT INTO dbo.DanhBa
		        (masothue ,
		          hoten ,
		          tencuahang ,
		          ngaysinh ,
		          cmnd ,
		          diachiKD ,
		          nghekinhdoanh ,
		          ngaybatdaukd ,
		          sogp ,
				  madp
		        )
		VALUES  ( @MST , -- masothue - varchar(14)
		          @hoten , -- hoten - nvarchar(100)
		          @tencuahang , -- tencuahang - nvarchar(100)
		          @dngaysinh , -- ngaysinh - date
		          @CMND , -- cmnd - varchar(20)
		          @diachiKD , -- diachiKD - nvarchar(300)
		          @nghekinhdoanh , -- nghekinhdoanh - nvarchar(200)
		          @dngaybatdaukd , -- vonkd - bigint
		          @sogp  -- ngaybatdaukd - date
				  ,@madp
		        )
		PRINT 'insert danh bạ'
	END
END