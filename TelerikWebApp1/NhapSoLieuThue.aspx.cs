using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
    public partial class NhapSoLieuThue : System.Web.UI.Page
    {
        private DataClasses1DataContext db = new DataClasses1DataContext();
        private string FilePath = "";
        private int cotNgayNop;
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
        }
        private bool checkEmptyRow(IRow row)
        {
            int length = row.Cells.Count;
            int dem = 0;
            for (int j = row.FirstCellNum; j < length; j++)
            {
                if (row.GetCell(j) != null && row.GetCell(j).ToString() != "")
                    dem++;
            }
            if (dem == 0)
                return true;
            return false;
        }
        private DataTable ReadFromExcelfile(string path)
        {
            if (path != "")
            {
                DataTable dt = new DataTable();

                XSSFWorkbook xssfworkbook;
                using (FileStream file = new FileStream(path, FileMode.Open, FileAccess.Read))
                {
                    xssfworkbook = new XSSFWorkbook(file);
                }
                ISheet sheet = xssfworkbook.GetSheetAt(0);
                System.Collections.IEnumerator rows = sheet.GetRowEnumerator();

                IRow headerRow = sheet.GetRow(0);
                int cellCount = headerRow.LastCellNum;
                int dem = 0;
                for (int j = 0; j < cellCount; j++)
                {
                    ICell cell = headerRow.GetCell(j);
                    if (cell.ToString() == "Tính chất khoản nộp" || cell.ToString() == "T.Tệ" || cell.ToString() == "Trạng thái lô chứng từ" || cell.ToString() == "Tên NNT" || cell.ToString() == "Kỳ tính thuế")
                    {
                        dem++;
                        dt.Columns.Add(cell.ToString() + dem.ToString());
                    }
                    else if (cell.ToString() == "Ngày nộp thuế")
                    {
                        dt.Columns.Add(cell.ToString());
                        cotNgayNop = dt.Columns.IndexOf(cell.ToString());
                    }
                    else
                        dt.Columns.Add(cell.ToString());
                }
                try
                {
                    for (int i = (sheet.FirstRowNum + 1); i <= sheet.LastRowNum; i++)
                    {
                        IRow row = sheet.GetRow(i);
                        if (!checkEmptyRow(row))
                        {
                            DataRow dataRow = dt.NewRow();
                            for (int j = row.FirstCellNum; j < dt.Columns.Count; j++)
                            {
                                if (j == cotNgayNop)
                                {
                                    if (row.GetCell(j) != null && row.GetCell(j).ToString() != "")
                                    {
                                        DateTime a = DateTime.Parse(row.GetCell(j).ToString());
                                        string b = a.ToString("dd/MM/yyyy");
                                        dataRow[j] = b;
                                        continue;
                                    }
                                    else
                                        continue;
                                }
                                if (row.GetCell(j) != null && row.GetCell(j).ToString() != "")
                                    dataRow[j] = row.GetCell(j).ToString();
                                else
                                    continue;
                            }
                            dt.Rows.Add(dataRow);
                        }
                    }
                    return dt;
                }
                catch (Exception ex)
                {

                }
            }
            return null;
        }
        protected void btnTemplate_Click(object sender, EventArgs e)
        {
            Response.ContentType = "Application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=SoLieuNopThue.xlsx");
            Response.TransmitFile(Server.MapPath("~/Template/SoLieuNopThue.xlsx"));
            Response.End();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    if ((Extension == ".xls") || (Extension == ".xlsx"))
                    {
                        FilePath = Server.MapPath("~/file/" + FileName);
                        FileUpload1.SaveAs(FilePath);
                        var data = ReadFromExcelfile(FilePath);
                        Session["File"] = FilePath;
                        grid.DataSource = data;
                        grid.DataBind();
                    }
                    else
                    {
                        st.Append("$.notify('Chỉ cho phép import dữ liệu từ file Excel (*.xls, *.xlsx)',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);

                    }
                }
                else
                {
                    st.Append("$.notify('Bạn chưa lựa chọn file excel!',{className: 'error',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }
            }
            catch (Exception ms)
            {
                st.Append("$.notify('" + ms.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
        }
        private void BindingFormatForExcel(ExcelWorksheet worksheet, List<SoLieuTuKhoBac> listItems)
        {
            // Set default width cho tất cả column
            worksheet.DefaultColWidth = 10;
            // Tự động xuống hàng khi text quá dài
            worksheet.Cells.Style.WrapText = true;
            // Tạo header
            worksheet.Cells[1, 1].Value = "Mã số thuế";
            worksheet.Cells[1, 2].Value = "Kỳ thuế";
            worksheet.Cells[1, 3].Value = "Số tiền nộp";
            worksheet.Cells[1, 4].Value = "Tiểu mục";
            worksheet.Cells[1, 5].Value = "Mục";
            worksheet.Cells[1, 6].Value = "Ngày nộp";
            worksheet.Cells[1, 7].Value = "Mã cán bộ quản lý";
            // Lấy range vào tạo format cho range đó ở đây là từ A1 tới Q1
            using (var range = worksheet.Cells["A1:H1"])
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
                worksheet.Cells[i + 2, 2].Value = item.KyThue;
                worksheet.Cells[i + 2, 3].Value = item.SoTienNop;
                worksheet.Cells[i + 2, 4].Value = item.tieumuc;
                worksheet.Cells[i + 2, 5].Value = item.muc;
                worksheet.Cells[i + 2, 6].Value = item.NgayNop;
                worksheet.Cells[i + 2, 7].Value = item.macbql;
            }
        }
        private Stream CreateExcelFile(List<SoLieuTuKhoBac> list,Stream stream = null)
        {
        
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

        public void Export(List<SoLieuTuKhoBac>lst)
        {
            // Gọi lại hàm để tạo file excel
            var stream = CreateExcelFile(lst,null);
            // Tạo buffer memory strean để hứng file excel
            var buffer = stream as MemoryStream;
            // Đây là content Type dành cho file excel, còn rất nhiều content-type khác nhưng cái này mình thấy okay nhất
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            // Dòng này rất quan trọng, vì chạy trên firefox hay IE thì dòng này sẽ hiện Save As dialog cho người dùng chọn thư mục để lưu
            // File name của Excel này là ExcelDemo
            Response.AddHeader("Content-Disposition", "attachment; filename=DanhSachLoi.xlsx");
            // Lưu file excel của chúng ta như 1 mảng byte để trả về response
            Response.BinaryWrite(buffer.ToArray());
            // Send tất cả ouput bytes về phía clients
            Response.Flush();
            Response.End();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            List<SoLieuTuKhoBac> lstErr = new List<SoLieuTuKhoBac>();
            st.Clear();
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        string masothue = item["Mã số thuế"].Text.Trim();
                        string macbql = item["Mã cán bộ"].Text.Trim();
                        double sotiennop = double.Parse(item["Số tiền theo VND"].Text.Trim());
                        string ngaynop = item["Ngày nộp thuế"].Text.Trim();
                        string kythue = item["Kỳ tính thuế5"].Text.Trim();
                        string tieumuc = item["Tiểu mục"].Text.Trim();
                        string muc = item["Mã mục"].Text.Trim();
                        DanhBa danhba = db.DanhBas.SingleOrDefault(x => x.masothue == masothue);
                        if (danhba == null)
                            continue;
                        else
                        {
                            KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.masothue == masothue);
                            if (kt != null)
                            {
                                var sobo = db.SoBoThues.SingleOrDefault(x => x.idKhaiThue == kt.idKhaiThue);
                                //Kiểm tra nếu nộp thiếu tiền thuế thì trả về danh sách các hộ có số thu chưa đúng 
                                //Do chỉ có 2 trường hợp nộp đủ và không nộp
                                if(tieumuc == "1003" && muc =="1000")
                                {
                                    if(sotiennop < sobo.SoTienTNCN1Thang)
                                    {
                                        lstErr.Add(new SoLieuTuKhoBac
                                        {
                                            masothue = masothue,
                                            macbql = macbql,
                                            SoTienNop = int.Parse(sotiennop.ToString()),
                                            NgayNop = DateTime.Parse(ngaynop),
                                            KyThue = kythue,
                                            tieumuc = tieumuc,
                                            muc= muc
                                        });
                                        continue;
                                    }
                                }
                                else if(tieumuc=="1701" && muc == "1700")
                                {
                                    if (sotiennop < sobo.SoTienGTGT1Thang)
                                    {
                                        lstErr.Add(new SoLieuTuKhoBac
                                        {
                                            masothue = masothue,
                                            macbql = macbql,
                                            SoTienNop = int.Parse(sotiennop.ToString()),
                                            NgayNop = DateTime.Parse(ngaynop),
                                            KyThue = kythue,
                                            tieumuc = tieumuc,
                                            muc = muc
                                        });
                                        continue;
                                    }
                                }
                                else
                                {
                                    thuemonbai monbai = db.thuemonbais.SingleOrDefault(x=>x.idKhaiThue == kt.idKhaiThue);
                                    if(monbai !=null  && monbai.trangthai == false)
                                    {
                                        mucluc_MonBai mucluc_MB = db.mucluc_MonBais.SingleOrDefault(x => x.Bac == monbai.Bac);
                                        if (sotiennop < mucluc_MB.MucThue)
                                        {
                                            lstErr.Add(new SoLieuTuKhoBac
                                            {
                                                masothue = masothue,
                                                macbql = macbql,
                                                SoTienNop = int.Parse(sotiennop.ToString()),
                                                NgayNop = DateTime.Parse(ngaynop),
                                                KyThue = kythue,
                                                tieumuc = tieumuc,
                                                muc = muc
                                            });
                                            continue;
                                        }
                                    }
                                }
                                db.Insert_SoLieuNopThue(masothue, macbql, sotiennop, ngaynop, kythue, tieumuc, muc);
                                if ((System.IO.File.Exists(txtFilepath.Text)))
                                {
                                    System.IO.File.Delete(txtFilepath.Text);
                                }
                                if(lstErr.Count>0)
                                    Export(lstErr);
                                st.Append("$.notify('Thao tác thành công',{className: 'success',globalPosition: 'bottom right'});");
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                            }
                        }
                    }
                    catch (Exception ms)
                    {
                        st.Append("$.notify('" + ms.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }
                }
            }
        }

        protected void grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            if (Session["File"] != null)
            {
                var data = ReadFromExcelfile(Session["File"].ToString());
                grid.DataSource = data;
            }
            else
            {
                grid.DataSource = null;
            }
            if (grid.DataSource == null)
                grid.DataSource = new string[] { };
        }

        protected void grid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int rowCounter = new int();
                Label lbl = e.Item.FindControl("numberLabel") as Label;
                rowCounter = grid.MasterTableView.PageSize * grid.MasterTableView.CurrentPageIndex;
                lbl.Text = (e.Item.ItemIndex + 1 + rowCounter).ToString();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Session["File"] = null;
            Response.Redirect("NhapSoLieuThue.aspx");
        }
    }
}