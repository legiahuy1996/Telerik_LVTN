USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Insert_ChitietKhaiThue]    Script Date: 5/16/2018 8:36:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Insert_ChitietKhaiThue]
@strXML NVARCHAR(MAX)=NULL

AS
BEGIN
	DECLARE @handle int
		 DECLARE @Temp1 TABLE   
		(   
				idKhaiThue NVARCHAR(14),
				idchitiet NVARCHAR(14),
				DoanhThu NVARCHAR(14),
				NgheKinhDoanh NVARCHAR(100),
				manganh NVARCHAR(14)
		)  
				


		exec sp_xml_preparedocument @handle output, @strXML
		INSERT INTO @Temp1 
		SELECT A.idKhaiThue AS idKhaiThue,A.idchitiet AS idchitiet ,A.DoanhThu AS DoanhThu ,A.NgheKinhDoanh AS NgheKinhDoanh,A.manganh AS manganh
		from openxml(@handle,'/Root/Record', 2)
		with
			(
				idKhaiThue NVARCHAR(14),
				idchitiet NVARCHAR(14),
				DoanhThu NVARCHAR(14),
				NgheKinhDoanh NVARCHAR(100),
				manganh NVARCHAR(14)
			)A		
		--SELECT * FROM @Temp1
			INSERT INTO dbo.ChiTietKhaiThue
			        ( idKhaiThue ,
			          DoanhThu ,
					  nghekinhdoanh,
			          SoTienGTGT1Thang ,
			          SoTienTNCN1Thang ,
			          manganh,
					  TongSoTienNop
			        )
			SELECT a.idKhaiThue,a.DoanhThu,a.NgheKinhDoanh,(a.DoanhThu*b.TyLeTinhThueGTGT),(a.DoanhThu*b.TyLeTinhThueTNCN),a.manganh,((a.DoanhThu*b.TyLeTinhThueGTGT)+(a.DoanhThu*b.TyLeTinhThueTNCN)) FROM @Temp1 a LEFT JOIN dbo.manganh b ON b.manganh = a.manganh WHERE idchitiet IS null OR idchitiet =''
		
END	

GO

