USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Insert_ChitietKhaiThue]    Script Date: 5/17/2018 10:28:39 PM ******/
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
			          manganh ,
			          NgheKinhDoanh ,
			          DoanhThu ,
                      SoTienGTGT1Thang,
					  SoTienTNCN1Thang
			        )
			SELECT a.idKhaiThue,a.manganh,a.NgheKinhDoanh,a.DoanhThu,(a.DoanhThu*b.TyLeTinhThueGTGT),(a.DoanhThu*b.TyLeTinhThueTNCN) FROM @Temp1 a LEFT JOIN dbo.manganh b ON b.manganh = a.manganh WHERE idchitiet IS null OR idchitiet =''
		DECLARE @id NVARCHAR(14),@TongDanhThu float
		SELECT @id = idKhaiThue FROM @Temp1
		SELECT @TongDanhThu = (TongDoanhThu*12) FROM dbo.KhaiThue WHERE idKhaiThue = @id
		IF ( @TongDanhThu  > 100000000 )
			BEGIN
				IF (  @TongDanhThu  <= 300000000 )
					BEGIN
						PRINT 'bac3'
					   INSERT INTO thuemonbai(trangthai,Bac,idKhaiThue) VALUES(0,3,@id)
					END 
				IF (  @TongDanhThu   > 300000000 )
					BEGIN
						PRINT 'bac2'
					  INSERT INTO thuemonbai(trangthai,Bac,idKhaiThue) VALUES(0,2,@id)
					END 
				ELSE
					IF (  @TongDanhThu   > 500000000 )
						BEGIN
							PRINT 'bac1'
						   INSERT INTO thuemonbai(trangthai,Bac,idKhaiThue) VALUES(0,1,@id)
						END 
			END
		DECLARE @Dem int ,@manganh NVARCHAR(12)
		SELECT @Dem = COUNT(idChiTiet) FROM dbo.ChiTietKhaiThue WHERE idKhaiThue = @id
		IF(@Dem =1)
		BEGIN
		PRINT'1 ma nganh'
			SELECT @manganh = manganh FROM dbo.ChiTietKhaiThue WHERE idKhaiThue = @id
			PRINT @manganh
			PRINT @id
			UPDATE dbo.KhaiThue 
			SET manganh = @manganh
			WHERE idKhaiThue = @id
		END
		ELSE
		begin
		PRINT'nhieu ma nganh'
			UPDATE dbo.KhaiThue
			SET manganh ='07'
			WHERE idKhaiThue = @id 
		end


END	



GO

