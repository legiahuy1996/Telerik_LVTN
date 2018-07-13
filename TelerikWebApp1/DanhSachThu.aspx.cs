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
    public partial class DanhSachThu : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
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
        protected void loadData()
        {
            string mst = txtMST.Text;
            string thang = txtThangNam.Text;
            string loaithue = rblLoaiThue.SelectedValue;
            grid.DataSource = db.GetSoThu(mst, thang, loaithue, Session["UserID"].ToString());
            grid.Rebind();
        }
        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            try
            {
                loadData();

            }
            catch
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }
        private void BindingFormatForExcel(ExcelWorksheet worksheet, List<GetSoThuGTGTResult> listGTGT, List<GetSoThuTNCNResult> listTNCN, List<GetSoThuMBResult> listMB)
        {
            // Set default width cho tất cả column
            worksheet.DefaultColWidth = 10;
            // Tự động xuống hàng khi text quá dài
            worksheet.Cells.Style.WrapText = true;
            // Tạo header
            worksheet.Cells[1, 1].Value = "Mã số thuế";
            worksheet.Cells[1, 2].Value = "Họ tên";
            worksheet.Cells[1, 3].Value = "Số tiền nộp";
            worksheet.Cells[1, 4].Value = "Kỳ thuế";
            worksheet.Cells[1, 5].Value = "Ngày nộp";
            worksheet.Cells[1, 6].Value = "Loại thuế";
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
            for (int i = 0; i < listGTGT.Count; i++)
            {
                var item = listGTGT[i];
                worksheet.Cells[i + 2, 1].Value = item.masothue;
                worksheet.Cells[i + 2, 2].Value = item.hoten;
                worksheet.Cells[i + 2, 3].Value = item.SoTienNop;
                worksheet.Cells[i + 2, 4].Value = item.KyThue;
                worksheet.Cells[i + 2, 5].Value = item.NgayNop;
                worksheet.Cells[i + 2, 6].Value = item.tieumuc;
            }
            //worksheet.Cells[2, 16, 2, 16].Style.Numberformat.Format = "dd/MM/yyyy";
            // Format lại định dạng xuất ra ở cột Money
            worksheet.Cells[2, 3, listGTGT.Count + 4, 3].Style.Numberformat.Format = "#,##";
            // fix lại width của column với minimum width là 15
            worksheet.Cells[1, 1, listGTGT.Count + 5, 6].AutoFitColumns(15);
            //// Thực hiện tính theo foxrmula trong excel
            //Hàm Sum
            worksheet.Cells[listGTGT.Count + 3, 1].Value = "Tổng tiền thuế GTGT:";
            worksheet.Cells[listGTGT.Count + 3, 1].Style.Font.Bold = true;
            worksheet.Cells[listGTGT.Count + 3, 3].Formula = "SUM(C2:C" + (listGTGT.Count + 1) + ")";
            worksheet.Cells[listGTGT.Count + 3, 3].Style.Font.Bold = true;
            var range1 = worksheet.Cells["A" + ((listGTGT.Count + 3) - 1) + ":F" + ((listGTGT.Count + 3) - 1)];
            range1.Style.Border.Bottom.Style = ExcelBorderStyle.Thick;
            range1.Style.Border.Bottom.Color.SetColor(Color.Red);
            for (int i = 0; i < listTNCN.Count; i++)
            {
                var item = listTNCN[i];
                worksheet.Cells[listGTGT.Count + 4 + i, 1].Value = item.masothue;
                worksheet.Cells[listGTGT.Count + 4 + i, 2].Value = item.hoten;
                worksheet.Cells[listGTGT.Count + 4 + i, 3].Value = item.SoTienNop;
                worksheet.Cells[listGTGT.Count + 4 + i, 4].Value = item.KyThue;
                worksheet.Cells[listGTGT.Count + 4 + i, 5].Value = item.NgayNop;
                worksheet.Cells[listGTGT.Count + 4 + i, 6].Value = item.tieumuc;
            }
            //worksheet.Cells[2, 16, 2, 16].Style.Numberformat.Format = "dd/MM/yyyy";
            // Format lại định dạng xuất ra ở cột Money
            worksheet.Cells[2, 3, listGTGT.Count + 4 + listTNCN.Count + 1, 3].Style.Numberformat.Format = "#,##";
            // fix lại width của column với minimum width là 15
            worksheet.Cells[1, 1, listGTGT.Count + 5, 6].AutoFitColumns(15);
            //// Thực hiện tính theo foxrmula trong excel
            //Hàm Sum
            worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 1, 1].Value = "Tổng tiền thuế TNCN:";
            worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 1, 1].Style.Font.Bold = true;
            worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 1, 3].Formula = "SUM(C" + (listGTGT.Count + 4) + ":C" + (listGTGT.Count + 4 + listTNCN.Count) + ")";
            worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 1, 3].Style.Font.Bold = true;
            var range2 = worksheet.Cells["A" + ((listGTGT.Count + 4 + listTNCN.Count + 1) - 1) + ":F" + ((listGTGT.Count + 4 + listTNCN.Count + 1) - 1)];
            range2.Style.Border.Bottom.Style = ExcelBorderStyle.Thick;
            range2.Style.Border.Bottom.Color.SetColor(Color.Red);
            for (int i = 0; i < listMB.Count; i++)
            {
                var item = listMB[i];
                worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + i, 1].Value = item.masothue;
                worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + i, 2].Value = item.hoten;
                worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + i, 3].Value = item.SoTienNop;
                worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + i, 4].Value = item.KyThue;
                worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + i, 5].Value = item.NgayNop;
                worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + i, 6].Value = item.tieumuc;
            }
            //worksheet.Cells[2, 16, 2, 16].Style.Numberformat.Format = "dd/MM/yyyy";
            // Format lại định dạng xuất ra ở cột Money
            worksheet.Cells[2, 3, listGTGT.Count + 4 + listTNCN.Count + 2 + listMB.Count + 1, 3].Style.Numberformat.Format = "#,##";
            // fix lại width của column với minimum width là 15
            worksheet.Cells[1, 1, listGTGT.Count + 5, 6].AutoFitColumns(15);
            //// Thực hiện tính theo foxrmula trong excel
            //Hàm Sum
            worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + listMB.Count + 1, 1].Value = "Tổng tiền thuế môn bài:";
            worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + listMB.Count + 1, 1].Style.Font.Bold = true;
            worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + listMB.Count + 1, 3].Formula = "SUM(C" + (listGTGT.Count + 4 + listTNCN.Count + 2) + ":C" + (listGTGT.Count + 4 + listTNCN.Count + 2 + listMB.Count) + ")";
            worksheet.Cells[listGTGT.Count + 4 + listTNCN.Count + 2 + listMB.Count + 1, 3].Style.Font.Bold = true;
            var range3 = worksheet.Cells["A" + ((listGTGT.Count + 4 + listTNCN.Count + 2 + listMB.Count + 1) - 1) + ":F" + ((listGTGT.Count + 4 + listTNCN.Count + 2 + listMB.Count + 1) - 1)];
            range3.Style.Border.Bottom.Style = ExcelBorderStyle.Thick;
            range3.Style.Border.Bottom.Color.SetColor(Color.Red);

        }
        private Stream CreateExcelFile(Stream stream = null)
        {
            string Thang = txtThangNam.Text;
            string mst = txtMST.Text;
            List<GetSoThuGTGTResult> listGTGT = db.GetSoThuGTGT(mst, Thang).ToList();
            List<GetSoThuTNCNResult> listTNCN = db.GetSoThuTNCN(mst, Thang).ToList();
            List<GetSoThuMBResult> listMB = db.GetSoThuMB(mst, Thang).ToList();
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

                BindingFormatForExcel(workSheet, listGTGT, listTNCN, listMB);
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
            Response.AddHeader("Content-Disposition", "attachment; filename=SoThu.xlsx");
            // Lưu file excel của chúng ta như 1 mảng byte để trả về response
            Response.BinaryWrite(buffer.ToArray());
            // Send tất cả ouput bytes về phía clients
            Response.Flush();
            Response.End();
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            Export();
            Response.Redirect("DanhSachThu.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            st.Clear();
            string strErr = "";
            int dem = 0;
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                TextBox txtSoTienNop = (TextBox)item["ClientSelectColumn"].FindControl("txtSoTienNop");
                if (checkBox.Checked == true)
                {
                    try
                    {
                        dem++;
                        string id = item["id"].Text.Trim().Replace("&nbsp;", "");
                        SoLieuTuKhoBac sl = db.SoLieuTuKhoBacs.SingleOrDefault(x => x.id == int.Parse(id));
                        if (sl != null)
                        {
                            sl.SoTienNop = int.Parse(txtSoTienNop.Text.Replace(",", ""));
                            sl.Editer = Session["taikhoan"].ToString();
                            sl.EditTime = DateTime.Now;
                            db.SubmitChanges();
                            st.Append("$.notify('Thao tác thành công',{className: 'success',globalPosition: 'bottom right'});");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);

                        }
                    }
                    catch (Exception mess)
                    {
                        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }
                }
            }
            if (dem == 0)
            {
                st.Append("$.notify('Vui lòng chọn 1 mẫu tin',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
            loadData();
        }
    }
}