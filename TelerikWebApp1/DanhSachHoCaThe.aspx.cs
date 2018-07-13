using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TelerikWebApp1.Model;
namespace TelerikWebApp1
{
    public partial class DanhSachHoCaThe : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            btnImport.Attributes.Add("OnClick", "return ShowExcelSelectPage()");
        }
        private void BindingFormatForExcel(ExcelWorksheet worksheet, List<DanhSachHoCaTheResult> listItems)
        {
            // Set default width cho tất cả column
            worksheet.DefaultColWidth = 10;
            // Tự động xuống hàng khi text quá dài
            worksheet.Cells.Style.WrapText = true;
            // Tạo header
            worksheet.Cells[1, 1].Value = "Mã số thuế";
            worksheet.Cells[1, 2].Value = "CMND";
            worksheet.Cells[1, 3].Value = "Tên cửa hàng";
            worksheet.Cells[1, 4].Value = "Ngày cấp";
            worksheet.Cells[1, 5].Value = "Số giấy phép";
            worksheet.Cells[1, 6].Value = "Địa chỉ";
            worksheet.Cells[1, 7].Value = "Họ tên";
            worksheet.Cells[1, 8].Value = "Ngày tính thuế";
            worksheet.Cells[1, 9].Value = "Mã ngành";
            worksheet.Cells[1, 10].Value = "Số điện thoại";





            // Lấy range vào tạo format cho range đó ở đây là từ A1 tới Q1
            using (var range = worksheet.Cells["A1:P1"])
            {
                // Set PatternType
                range.Style.Fill.PatternType = ExcelFillStyle.DarkGray;
                // Set Màu cho Background
                range.Style.Fill.BackgroundColor.SetColor(Color.White);
                //
                range.Style.Font.Color.SetColor(Color.Black);
                // Canh giữa cho các text
                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                // Set Font cho text  trong Range hiện tại
                range.Style.Font.SetFromFont(new Font("Arial", 10));
                // Set Border
                range.Style.Border.Bottom.Style = ExcelBorderStyle.Thick;
                // Set màu ch Border
                range.Style.Border.Bottom.Color.SetColor(Color.Blue);

            }

            // Đỗ dữ liệu từ list vào 
            for (int i = 0; i < listItems.Count; i++)
            {
                var item = listItems[i];
                worksheet.Cells[i + 2, 1].Value = item.masothue;
                worksheet.Cells[i + 2, 2].Value = item.cmnd;
                worksheet.Cells[i + 2, 3].Value = item.tencuahang;
                worksheet.Cells[i + 2, 4].Value = item.ngaycapmst;
                worksheet.Cells[i + 2, 5].Value = item.sogp;
                worksheet.Cells[i + 2, 6].Value = item.diachiKD;
                worksheet.Cells[i + 2, 7].Value = item.hoten;
                worksheet.Cells[i + 2, 8].Value = item.ngaytinhthue;
                worksheet.Cells[i + 2, 10].Value = item.sodt;


            }
            worksheet.Cells[2, 16, 2, 16].Style.Numberformat.Format = "dd/MM/yyyy";

        }
        protected void LoadDataSearch()
        {
            string mst = txtMST.Text.Trim();
            string cmnd = txtCMND.Text.Trim();
            string tencuahang = txtTenCuaHang.Text;
            string sogp = txtSoGP.Text.Trim();
            string ngaycap = txtNgayCap.Text.Trim();
            string diachi = txtDiaChi.Text;
            string ngaytinhthue = txtNgayTinhThue.Text.Trim();
            string sdt = txtSDT.Text.Trim();
            string hoten = txtHoTen.Text;
            
            grid.DataSource = db.DanhSachHoCaThe(mst, cmnd, tencuahang, ngaycap, sogp, diachi, hoten, ngaytinhthue, sdt, "Search", Session["UserID"].ToString());
            grid.DataBind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadDataSearch();
        }
        private Stream CreateExcelFile(Stream stream = null)
        {
            string Activity = "Search";
            string cmnd = txtCMND.Text;
            string MST = txtMST.Text;
            string tencuahang = txtTenCuaHang.Text;
            string sogp = txtSoGP.Text;
            string diachi = txtDiaChi.Text;
            string hoten = txtHoTen.Text;
   
            string ngaycap = txtNgayCap.Text;
            string ngaytinhthue = txtNgayTinhThue.Text;
            string sdt = txtSDT.Text;
            List<DanhSachHoCaTheResult> list = db.DanhSachHoCaThe(MST, cmnd, tencuahang, ngaycap, sogp, diachi, hoten, ngaytinhthue, sdt, Activity, Session["UserID"].ToString()).ToList();
            using (var excelPackage = new ExcelPackage(stream ?? new MemoryStream()))
            {
                // Tạo author cho file Excel
                excelPackage.Workbook.Properties.Author = "Hanker";
                // Tạo title cho file Excel
                excelPackage.Workbook.Properties.Title = "EPP test background";
                // thêm tí comments vào làm màu 
                excelPackage.Workbook.Properties.Comments = "This is my fucking generated Comments";
                // Add Sheet vào file Excel
                excelPackage.Workbook.Worksheets.Add("First Sheet");
                // Lấy Sheet bạn vừa mới tạo ra để thao tác 
                var workSheet = excelPackage.Workbook.Worksheets[1];
                // Đổ data vào Excel file

                BindingFormatForExcel(workSheet, list);
                excelPackage.Save();
                return excelPackage.Stream;
            }
        }
        public void Export()
        {
            // Gọi lại hàm để tạo file excel
            var stream = CreateExcelFile();
            // Tạo buffer memory strean để hứng file excel
            var buffer = stream as MemoryStream;
            // Đây là content Type dành cho file excel, còn rất nhiều content-type khác nhưng cái này mình thấy okay nhất
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            // Dòng này rất quan trọng, vì chạy trên firefox hay IE thì dòng này sẽ hiện Save As dialog cho người dùng chọn thư mục để lưu
            // File name của Excel này là ExcelDemo
            Response.AddHeader("Content-Disposition", "attachment; filename=DanhSachHoCaThe.xlsx");
            // Lưu file excel của chúng ta như 1 mảng byte để trả về response
            Response.BinaryWrite(buffer.ToArray());
            // Send tất cả ouput bytes về phía clients
            Response.Flush();
            Response.End();
        }
        protected void btnExportGrid_Click(object sender, EventArgs e)
        {
            Export();
            Response.Redirect("DanhSachHoCaThe.aspx");
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachHoCaThe.aspx");
        }

        protected void grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            try
            {
                LoadDataSearch();
            }
            catch
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }
        }

        protected void grid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            string commandName = e.CommandName.ToUpper();
            GridDataItem item_detail;
            if (commandName == "LINKMST")
            {
                try
                {
                    if (e.Item is GridDataItem)
                    {
                        item_detail = (GridDataItem)e.Item;
                        string masothue = item_detail["masothue"].Text.Trim().Replace("&nbsp;", "");
                        if (masothue != "")
                        {
                            string url = "ThongTinHoCaThe.aspx?masothue=" + item_detail["masothue"].Text.Trim().Replace("&nbsp;", "");
                            Response.Redirect(url);
                        }

                    }
                }
                catch (Exception mess)
                {
                    st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }

            }
        }

    }
}