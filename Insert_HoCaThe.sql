USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Insert_HoCaThe]    Script Date: 6/15/2018 12:17:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Insert_HoCaThe]
@masothue		NVARCHAR(12)=NULL,
@ngaycapmst		NVARCHAR(10)=NULL,
@hoten			NVARCHAR(50)=NULL,
@tencuahang		NVARCHAR(255)=NULL,
@ngaysinh		NVARCHAR(10)=NULL,
@CMND			NVARCHAR(12)=NULL,
@diachi			NVARCHAR(100)=NULL,
@ngaycapcmnd	NVARCHAR(10)=NULL,
@madp			NVARCHAR(12)=NULL,
@nam			NVARCHAR(4)=NULL,
@manganh		NVARCHAR(12)=NULL,
@nghekinhdoanh	NVARCHAR(250)=NULL,
@vonkinhdoanh	NVARCHAR(50)=NULL,
@ngaybatdaukd	NVARCHAR(10)=NULL,
@ngaytinhthue	NVARCHAR(10)=NULL,
@sogiayphep		NVARCHAR(50)=NULL,
@sodienthoai	NVARCHAR(12)=NULL,
@email			NVARCHAR(50)=NULL,
@ghichu			NVARCHAR(255)=NULL
AS
BEGIN
	DECLARE @dngaycapmst DATETIME,@dngaysinh DATETIME,@dngaycapcmnd DATETIME,@dngaybatdaukd DATETIME,@dngaytinhthue DATETIME,@thutu int
	IF(ISNULL(@ngaycapmst,'')='')
	begin
		SET @dngaycapmst = CONVERT(DATETIME,GETDATE(),103)
	end
	ELSE
	BEGIN
		SET @dngaycapmst = CONVERT(DATETIME,@ngaycapmst,103)
    END
	IF(ISNULL(@ngaysinh,'')='')
	begin
		SET @dngaysinh = CONVERT(DATETIME,GETDATE(),103)
	end
	ELSE
	BEGIN
		SET @dngaysinh = CONVERT(DATETIME,@ngaysinh,103)
    END 
	IF(ISNULL(@ngaycapcmnd,'')='')
	begin
		SET @dngaycapcmnd = CONVERT(DATETIME,GETDATE(),103)
	end
	ELSE
	BEGIN
		SET @dngaycapcmnd = CONVERT(DATETIME,@ngaycapcmnd,103)
    END 
	IF(ISNULL(@ngaybatdaukd,'')='')
	begin
		SET @dngaybatdaukd = CONVERT(DATETIME,GETDATE(),103)
	end
	ELSE
	BEGIN
		SET @dngaybatdaukd = CONVERT(DATETIME,@ngaybatdaukd,103)
    END 
	IF(ISNULL(@ngaytinhthue,'')='')
	begin
		SET @dngaytinhthue = CONVERT(DATETIME,GETDATE(),103)
	end
	ELSE
	BEGIN
		SET @dngaytinhthue = CONVERT(DATETIME,@ngaytinhthue,103)
    END
	SELECT @thutu =MAX(thutu) FROM dbo.DanhBa
	IF @thutu IS NULL
		SET @thutu = 0
	ELSE 
		SET @thutu = @thutu+1 		
	IF NOT EXISTS (SELECT TOP 1 1 FROM dbo.DanhBa(NOLOCK) WHERE masothue = @masothue)
	BEGIN
		INSERT INTO dbo.DanhBa
		        ( ngaycapmst ,masothue ,hoten,tencuahang ,thutu ,ngaysinh ,cmnd ,ngaycapcmnd ,noicapcmnd ,diachicutru ,diachiKD ,chanle ,hem ,sonha ,
madp ,manganh ,nghekinhdoanh ,vonkd ,ngaybatdaukd ,ngaytinhthue ,sogp ,ngaycapgp ,sodtban, sodt ,email ,ghichu ,nam		       )
		VALUES  ( @dngaycapmst , -- ngaycapmst - date
		          @masothue , -- masothue - varchar(14)
		          @hoten , -- hoten - nvarchar(100)
		          @tencuahang , -- tencuahang - nvarchar(100)
		          @thutu , -- thutu - int
		           @dngaysinh, -- ngaysinh - date
				  @CMND , -- cmnd - varchar(20)
		          @ngaycapcmnd , -- ngaycapcmnd - date
		          null , -- noicapcmnd - nvarchar(50)
		          null , -- diachicutru - nvarchar(100)
		          @diachi , -- diachiKD - nvarchar(300)
		          null , -- chanle - nvarchar(50)
		          null , -- hem - int
		          null , -- sonha - int
		          @madp , -- madp - nvarchar(50)
		          @manganh , -- manganh - varchar(10)
		          @nghekinhdoanh , -- nghekinhdoanh - nvarchar(200)
		          @vonkinhdoanh , -- vonkd - bigint
		          @dngaybatdaukd , -- ngaybatdaukd - date
		          @dngaytinhthue, -- ngaytinhthue - date
		          @sogiayphep , -- sogp - varchar(50)
		          null , -- ngaycapgp - date
		          null , -- sodtban - varchar(30)
		          @sodienthoai , -- sodt - varchar(60)
		          @email , -- email - varchar(100)
		          @ghichu , -- ghichu - nvarchar(200)
		          @nam  -- nam - varchar(4)
		        )
    END 
	ELSE
    BEGIN
		UPDATE dbo.DanhBa 
		SET	  ngaycapmst    = @dngaycapmst,
			  hoten		    = @hoten,
              tencuahang    = @tencuahang,
              thutu		    = @thutu,
              ngaysinh	    = @dngaysinh,
              cmnd		    = @CMND,
              ngaycapcmnd   = @dngaycapcmnd,
              diachiKD	    = @diachi,
			  madp		    = @madp,
			  manganh       = @manganh,
              nghekinhdoanh = @nghekinhdoanh,
              vonkd			= @vonkinhdoanh,
              ngaybatdaukd  = @dngaybatdaukd,
			  ngaytinhthue  = @dngaytinhthue,
              sogp          = @sogiayphep,
              sodt          = @sodienthoai,
			  email		    = @email,
              ghichu        = @ghichu,
			  nam			= @nam
		WHERE masothue = @masothue
	END 
END 


GO

