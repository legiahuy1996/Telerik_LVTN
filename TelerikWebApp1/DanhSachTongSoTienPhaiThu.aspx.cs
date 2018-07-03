using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class DanhSachTongSoTienPhaiThu : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        public DanhSachTongSoTienPhaiThu()
        {
            db = new DataClasses1DataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                if (DateTime.Now.Month < 10)
                {
                    txtThangNam.Text = "0" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();
                }
                else
                {
                    txtThangNam.Text = DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString();
                }
            }
        }
        private void BindingFormatForExcel(ExcelWorksheet worksheet, List<GetDanhSachTongTienPhaiThuResult> listItems, List<GetSoThueNgungNghiResult> listNN)
        {
            // Set default width cho tất cả column
            worksheet.DefaultColWidth = 10;
            // Tự động xuống hàng khi text quá dài
            worksheet.Cells.Style.WrapText = true;
            // Tạo header
            worksheet.Cells[1, 1].Value = "Mã số thuế";
            worksheet.Cells[1, 2].Value = "Năm";
            worksheet.Cells[1, 3].Value = "Tháng";
            worksheet.Cells[1, 4].Value = "Doanh thu tính thuế";
            worksheet.Cells[1, 5].Value = "Tiền GTGT 1 tháng";
            worksheet.Cells[1, 6].Value = "Tiền GTGT 1 năm";
            worksheet.Cells[1, 7].Value = "Tiền TNCN 1 tháng";
            worksheet.Cells[1, 8].Value = "Tiền TNCN 1 năm";
            worksheet.Cells[1, 9].Value = "Tổng thuế GTGT, TNCN phải nộp trong năm";
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
                worksheet.Cells[i + 2, 2].Value = item.nam;
                worksheet.Cells[i + 2, 3].Value = item.Thang;
                worksheet.Cells[i + 2, 4].Value = item.TongDoanhThu;
                worksheet.Cells[i + 2, 5].Value = item.SoTienGTGT1Thang;
                worksheet.Cells[i + 2, 6].Value = item.SoTienGTGT1Thang * 12;
                worksheet.Cells[i + 2, 7].Value = item.SoTienTNCN1Thang;
                worksheet.Cells[i + 2, 8].Value = item.SoTienTNCN1Thang * 12;
                worksheet.Cells[i + 2, 9].Value = (item.SoTienTNCN1Thang * 12) + (item.SoTienGTGT1Thang * 12);


            }
            //worksheet.Cells[2, 16, 2, 16].Style.Numberformat.Format = "dd/MM/yyyy";
            // Format lại định dạng xuất ra ở cột Money
            worksheet.Cells[2, 4, listItems.Count + 4, 9].Style.Numberformat.Format = "#,##";
            // fix lại width của column với minimum width là 15
            worksheet.Cells[1, 1, listItems.Count + 5, 6].AutoFitColumns(15);
            //// Thực hiện tính theo foxrmula trong excel
            //Hàm Sum
            worksheet.Cells[listItems.Count + 3, 1].Value = "Tổng:";
            worksheet.Cells[listItems.Count + 3, 1].Style.Font.Bold = true;
            worksheet.Cells[listItems.Count + 3, 5].Formula = "SUM(E2:E" + (listItems.Count + 1) + ")";
            worksheet.Cells[listItems.Count + 3, 5].Style.Font.Bold = true;
            worksheet.Cells[listItems.Count + 3, 7].Formula = "SUM(G2:G" + (listItems.Count + 1) + ")";
            worksheet.Cells[listItems.Count + 3, 7].Style.Font.Bold = true;
            worksheet.Cells[listItems.Count + 4, 1].Value = "CNKD ngừng, nghỉ trong tháng";
            worksheet.Cells[listItems.Count + 4, 1].Style.Font.Bold = true;
            worksheet.Cells["A" + (listItems.Count + 4) + ":I" + (listItems.Count + 4)].Merge = true;
            for (int i = 0; i < listNN.Count; i++)
            {
                var item = listNN[i];
                worksheet.Cells[listItems.Count + 5 + i, 1].Value = item.masothue;
                worksheet.Cells[listItems.Count + 5 + i, 2].Value = item.nam;
                worksheet.Cells[listItems.Count + 5 + i, 3].Value = item.thang;
                worksheet.Cells[listItems.Count + 5 + i, 4].Value = item.TongDoanhThu;
                worksheet.Cells[listItems.Count + 5 + i, 5].Value = item.GTGT;
                worksheet.Cells[listItems.Count + 5 + i, 6].Value = item.GTGT * 12;
                worksheet.Cells[listItems.Count + 5 + i, 7].Value = item.TNCN;
                worksheet.Cells[listItems.Count + 5 + i, 8].Value = item.TNCN * 12;
                worksheet.Cells[listItems.Count + 5 + i, 9].Value = (item.TNCN * 12) + (item.GTGT * 12);
            }
            worksheet.Cells[listItems.Count + 5 + listNN.Count + 1, 1].Value = "Tổng:";
            worksheet.Cells[listItems.Count + 5 + listNN.Count + 1, 1].Style.Font.Bold = true;
            worksheet.Cells[listItems.Count + 5 + listNN.Count + 1, 5].Formula = "SUM(E" + (listItems.Count + 5) + ":E" + (listItems.Count + 5 + listNN.Count) + ")";
            worksheet.Cells[listItems.Count + 5 + listNN.Count + 1, 5].Style.Font.Bold = true;
            worksheet.Cells[listItems.Count + 5 + listNN.Count + 1, 7].Formula = "SUM(G" + (listItems.Count + 5) + ":G" + (listItems.Count + 5 + listNN.Count) + ")";
            worksheet.Cells[listItems.Count + 5 + listNN.Count + 1, 7].Style.Font.Bold = true;
            worksheet.Cells[2, 4, listItems.Count + 5 + listNN.Count + 1, 9].Style.Numberformat.Format = "#,##";
        }
        private Stream CreateExcelFile(Stream stream = null)
        {
            string Thang = txtThangNam.Text;
            List<GetDanhSachTongTienPhaiThuResult> list = db.GetDanhSachTongTienPhaiThu(Thang).ToList();
            List<GetSoThueNgungNghiResult> listNN = db.GetSoThueNgungNghi(Thang).ToList();
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

                BindingFormatForExcel(workSheet, list, listNN);
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
            Response.AddHeader("Content-Disposition", "attachment; filename=DanhSachTongSoTienPhaiThu.xlsx");
            // Lưu file excel của chúng ta như 1 mảng byte để trả về response
            Response.BinaryWrite(buffer.ToArray());
            // Send tất cả ouput bytes về phía clients
            Response.Flush();
            Response.End();
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            Export();
            Response.Redirect("DanhSachTongSoTienPhaiThu.aspx");
        }
        public void getDataSearch()
        {
            string thang = txtThangNam.Text.Trim();

            List<GetDanhSachTongTienPhaiThuResult> lst = db.GetDanhSachTongTienPhaiThu(thang).ToList();
            grid.DataSource = lst;
            grid.Rebind();
        }
        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            try
            {
                getDataSearch();
            }
            catch
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getDataSearch();
        }
    }
}