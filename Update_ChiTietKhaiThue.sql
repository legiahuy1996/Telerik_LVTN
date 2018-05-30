USE [thue]
GO

/****** Object:  StoredProcedure [dbo].[Update_ChiTietKhaiThue]    Script Date: 5/29/2018 9:37:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[Update_ChiTietKhaiThue]
@idchitiet NVARCHAR(14)=NULL,
@DoanhThu		INT = NULL,
@nghekinhdoanh NVARCHAR(50)=NULL,
@manganh NVARCHAR(14)=NULL,
@ReturnCode nvarchar(255) = null out,
@ReturnMess			nvarchar(500) = null OUT
AS
BEGIN
		UPDATE dbo.ChiTietKhaiThue
		SET manganh = @manganh,
			NgheKinhDoanh = @nghekinhdoanh,
            DoanhThu = @DoanhThu
			WHERE idChiTiet = @idchitiet
END	

GO

