using OfficeOpenXml;
using OfficeOpenXml.Style;
using OfficeOpenXml.Table;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class DanhSachSoBoThue : System.Web.UI.Page
    {
        private List<getDSSoBoThueResult> list;
        private DataClasses1DataContext db;
        public DanhSachSoBoThue()
        {
            db = new DataClasses1DataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void loadDataSearch()
        {
            string nghekinhdoanh = txtNgheKinhDoanh.Text;
            string MST = txtMST.Text;
            string thang = txtThang.Text;
            string diachi = txtDiaChi.Text;
            string hoten = txtHoTen.Text;
            string thanglapbo = txtThangLapBo.Text;
            string namlapbo = txtNamLapBo.Text;


            List<getDSSoBoThueResult> data = db.getDSSoBoThue(MST, nghekinhdoanh, thang,  diachi, hoten, thanglapbo,namlapbo).ToList();
            grid.DataSource = data;
            list = data;
            grid.Rebind();
        }
        private void BindingFormatForExcel(ExcelWorksheet worksheet, List<getDSSoBoThueResult> listItems)
        {
            // Set default width cho tất cả column
            worksheet.DefaultColWidth = 10;
            // Tự động xuống hàng khi text quá dài
            worksheet.Cells.Style.WrapText = true;
            // Tạo header
            worksheet.Cells[1, 1].Value = "Mã số thuế";
            worksheet.Cells[1, 2].Value = "Họ tên";
            worksheet.Cells[1, 3].Value = "Địa chỉ kinh doanh";
            worksheet.Cells[1, 4].Value = "Tháng";
            worksheet.Cells[1, 5].Value = "Doanh thu tính thuế GTGT";
            worksheet.Cells[1, 6].Value = "Tỷ lệ tính thuế GTGT";
            worksheet.Cells[1, 7].Value = "Thuế GTGT phải nộp 1 tháng";
            worksheet.Cells[1, 8].Value = "Thuế GTGT phải nộp 1 năm";
            worksheet.Cells[1, 9].Value = "Doanh thu tính thuế TNCN";
            worksheet.Cells[1, 10].Value = "Tỷ lệ tính thuế TNCN";
            worksheet.Cells[1, 11].Value = "Thuế TNCN phải nộp 1 tháng";
            worksheet.Cells[1, 12].Value = "Thuế TNCN phải nộp 1 năm";
            worksheet.Cells[1, 13].Value = "Trạng thái";
            worksheet.Cells[1, 14].Value = "Ngày lập bộ";





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
                worksheet.Cells[i + 2, 2].Value = item.hoten;
                worksheet.Cells[i + 2, 3].Value = item.diachiKD;
                worksheet.Cells[i + 2, 4].Value = item.Thang;
                worksheet.Cells[i + 2, 5].Value = item.DoanhThuTinhThueGTGT;
                worksheet.Cells[i + 2, 6].Value = item.TyLeTinhThueGTGT + "%";
                worksheet.Cells[i + 2, 7].Value = item.DoanhThuTinhThueGTGT * item.TyLeTinhThueGTGT;
                worksheet.Cells[i + 2, 8].Value = item.DoanhThuTinhThueGTGT * item.TyLeTinhThueGTGT *12;
                worksheet.Cells[i + 2, 9].Value = item.DoanhThuTinhThueTNCN;
                worksheet.Cells[i + 2, 10].Value = item.TyLeTinhThueTNCN + "%";
                worksheet.Cells[i + 2, 11].Value = item.DoanhThuTinhThueTNCN * item.TyLeTinhThueTNCN;
                worksheet.Cells[i + 2, 12].Value = item.DoanhThuTinhThueTNCN * item.TyLeTinhThueTNCN *12;
                worksheet.Cells[i + 2, 13].Value = item.TinhTrangNopThue;
                worksheet.Cells[i + 2, 14].Value = item.NgayLapBo;


                // Format lại color nếu như thỏa điều kiện
                //if (item.TinhTrangNopThue == "0")
                //{
                //    // Ở đây chúng ta sẽ format lại theo dạng fromRow,fromCol,toRow,toCol
                //    using (var range = worksheet.Cells[i + 2, 1, i + 2, 16])
                //    {
                //        // Format text đỏ và đậm
                //        range.Style.Font.Color.SetColor(Color.Red);
                //        range.Style.Font.Bold = true;
                //    }
                //}

            }
            worksheet.Cells[2,16,2,16].Style.Numberformat.Format = "dd/MM/yyyy";
            // Format lại định dạng xuất ra ở cột Money
            //worksheet.Cells[2, 4, listItems.Count + 4, 4].Style.Numberformat.Format = "$#,##.00";
            // fix lại width của column với minimum width là 15
            //worksheet.Cells[1, 1, listItems.Count + 5, 4].AutoFitColumns(15);

            //// Thực hiện tính theo formula trong excel
            // Hàm Sum 
            //worksheet.Cells[listItems.Count + 3, 3].Value = "Total is :";
            //worksheet.Cells[listItems.Count + 3, 4].Formula = "SUM(D2:D" + (listItems.Count + 1) + ")";
            //// Hàm SumIf
            //worksheet.Cells[listItems.Count + 4, 3].Value = "Greater than 20050 :";
            //worksheet.Cells[listItems.Count + 4, 4].Formula = "SUMIF(D2:D" + (listItems.Count + 1) + ",\">20050\")";
            //// Tinh theo %
            //worksheet.Cells[listItems.Count + 5, 3].Value = "Percentatge: ";
            //worksheet.Cells[listItems.Count + 5, 4].Style.Numberformat.Format = "0.00%";
            //// Dòng này có nghĩa là ở column hiện tại lấy với địa chỉ (Row hiện tại - 1)/ (Row hiện tại - 2) Cùng một colum
            //worksheet.Cells[listItems.Count + 5, 4].FormulaR1C1 = "(R[-1]C/R[-2]C)";
        }
        private Stream CreateExcelFile(Stream stream = null)
        {
            string nghekinhdoanh = txtNgheKinhDoanh.Text;
            string MST = txtMST.Text;            
            string thang = txtThang.Text;
            string diachi = txtDiaChi.Text;
            string hoten = txtHoTen.Text;
            string thanglapbo = txtThangLapBo.Text;
            string namlapbo = txtNamLapBo.Text;
            List<getDSSoBoThueResult> list = db.getDSSoBoThue(MST, nghekinhdoanh, thang,  diachi, hoten, thanglapbo, namlapbo).ToList();
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
            Response.AddHeader("Content-Disposition", "attachment; filename=DanhSachSoBoThue.xlsx");
            // Lưu file excel của chúng ta như 1 mảng byte để trả về response
            Response.BinaryWrite(buffer.ToArray());
            // Send tất cả ouput bytes về phía clients
            Response.Flush();
            Response.End();
        }




        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadDataSearch();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            Export();
            Response.Redirect("DanhSachSoBoThue.aspx");

        }
    }
}