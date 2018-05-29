USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[LoadChiTietKhaiThueXML]    Script Date: 5/29/2018 9:36:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[LoadChiTietKhaiThueXML]
--@idKhaiThue	NVARCHAR(14) = NULL,
--@masothue		VARCHAR(14) = NULL,
--@DoanhThu		INT = NULL,
--@nam			VARCHAR(4) = NULL,
--@idMonBai		VARCHAR(14) = NULL,
--@idChiTiet NVARCHAR(14) = null,
--@sodt			VARCHAR(60) = NULL,
--@email			varchar(100) = NULL,
--@ghichu			VARCHAR(200) = NULL,
--@nghekinhdoanh	VARCHAR(200) = NULL,
--@DienTichKD		FLOAT = NULL,
--@SoLuongLD		INT = NULL,
--@TuGio			INT = NULL,
--@DenGio			INT = NULL,
--@diachiKD		VARCHAR(255) = NULL,
--@TrangThaiHoatDong	BIT = NULL,
--@DoanhtThuTinhThueG	INT = NULL,
--@DoanhThuTinhThueT	INT = NULL,
--@TyLeTinhThueGTGT		FLOAT = NULL,
--@TyLeTinhThueTNCN	FLOAT = NULL,
@strXML			nvarchar(max)= NULL,
@ReturnCode nvarchar(255) = null out,
@ReturnMess			nvarchar(500) = null OUT,
@Activity NVARCHAR(50)=null
AS
BEGIN
declare @handle	INT
	IF(@Activity ='LoadDetailXML')
	BEGIN
        
		 DECLARE @Temp1 TABLE   
		(   idKhaiThue NVARCHAR(14),
				idchitiet NVARCHAR(14),
				DoanhThu NVARCHAR(50),
				NgheKinhDoanh NVARCHAR(100),
				manganh NVARCHAR(14)
		)  
				


		exec sp_xml_preparedocument @handle output, @strXML
		INSERT INTO @Temp1 
		SELECT a.idKhaiThue AS idKhaiThue, A.idchitiet AS idchitiet ,A.DoanhThu AS DoanhThu ,A.NgheKinhDoanh AS NgheKinhDoanh,A.manganh AS manganh
		from openxml(@handle,'/Root/Record', 2)
		with
			(
				idKhaiThue NVARCHAR(14),
				idchitiet NVARCHAR(14),
				DoanhThu NVARCHAR(50),
				NgheKinhDoanh NVARCHAR(100),
				manganh NVARCHAR(14)
			)A
			
			SELECT a.idKhaiThue,a.idchitiet,a.DoanhThu,a.NgheKinhDoanh,b.manganh,b.tennganh,b.TyLeTinhThueTNCN,b.TyLeTinhThueGTGT,row_number() OVER(ORDER BY a.idchitiet) AS Seq
			FROM @Temp1 a
			LEFT JOIN dbo.manganh b ON b.manganh = a.manganh
			WHERE 1=1
    end
END	
SELECT * FROM dbo.ChiTietKhaiThue WHERE idKhaiThue = 1015
GO

