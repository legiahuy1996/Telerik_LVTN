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
    public partial class DanhSachKhaiThue : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            db = new DataClasses1DataContext();
            btnImport.Attributes.Add("OnClick", "return ShowExcelSelectPage()");
            if (!IsPostBack)
                LoadComBo();
        }
        protected void LoadComBo()
        {

            cboMaNganh.DataSource = (from a in db.manganhs where a.manganh1 != "07" select new { ma = a.manganh1, ten = a.tennganh }).ToList();
            cboMaNganh.DataValueField = "ma";
            cboMaNganh.DataTextField = "ten";
            cboMaNganh.DataBind();
            cboMaNganh.Items.Insert(0, "");
            cboMaNganh.SelectedIndex = 0;
        }
        public void loadData()
        {
            string MST = txtMST.Text;
            string SoGP = txtSoGP.Text;
            string MaNganh = cboMaNganh.SelectedValue;
            string Nam = txtNam.Text;
            string trangthai = rdbTinhTrang.SelectedValue.Trim();
            grid.DataSource = db.getDSThue(MST, SoGP, MaNganh, Nam,trangthai);
            grid.Rebind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachKhaiThue.aspx");
        }

        protected void btnLock_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            st.Clear();
            string strErr = "";
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        string idKhaiThue = item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "");
                        KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.idKhaiThue == int.Parse(idKhaiThue));
                        if (kt != null)
                        {
                            kt.TrangThaiHoatDong = false;
                            db.SubmitChanges();
                        }
                    }catch(Exception mess)
                    {
                        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }
                   
                }
            }
            st.Append("$.notify('Khoá trạng thái thành công',{className: 'success',globalPosition: 'bottom right'});");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            loadData();
        }

        protected void grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
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

        protected void grid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            string commandName = e.CommandName.ToUpper();
            GridDataItem item;
            if (commandName == "EDIT_DATA")
            {
                if (e.Item is GridDataItem)
                {
                    item = (GridDataItem)e.Item;
                    if (item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "") != "")
                    {
                        string url = "KhaiThueChiTiet.aspx?idKhaiThue=" + item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "");
                        Response.Redirect(url);
                    }
                }
            }
        }
        private void BindingFormatForExcel(ExcelWorksheet worksheet, List<getDSThueResult> listItems)
        {
            // Set default width cho tất cả column
            worksheet.DefaultColWidth = 10;
            // Tự động xuống hàng khi text quá dài
            worksheet.Cells.Style.WrapText = true;
            // Tạo header
            worksheet.Cells[1, 1].Value = "Mã số thuế";
            worksheet.Cells[1, 2].Value = "Tổng doanh thu";
            worksheet.Cells[1, 3].Value = "Bậc môn bài";
            worksheet.Cells[1, 4].Value = "Năm";
            worksheet.Cells[1, 5].Value = "Địa chỉ kinh doanh";
            worksheet.Cells[1, 6].Value = "Số giấy phép";
            worksheet.Cells[1, 7].Value = "Tên ngành";
            worksheet.Cells[1, 8].Value = "Trạng thái";
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
                worksheet.Cells[i + 2, 2].Value = item.TongDoanhThu;
                worksheet.Cells[i + 2, 3].Value = item.Bac;
                worksheet.Cells[i + 2, 4].Value = item.nam;
                worksheet.Cells[i + 2, 5].Value = item.diachiKD;
                worksheet.Cells[i + 2, 6].Value = item.sogp;
                worksheet.Cells[i + 2, 7].Value = item.tennganh;
                worksheet.Cells[i + 2, 8].Value = item.TrangThaiHoatDong;
            }
        }
        private Stream CreateExcelFile(Stream stream = null)
        {
            string MST = txtMST.Text;
            string SoGP = txtSoGP.Text;
            string MaNganh = cboMaNganh.SelectedValue;
            string Nam = txtNam.Text;
            string trangthai = rdbTinhTrang.SelectedValue.Trim();
            List<getDSThueResult> list = db.getDSThue(MST, SoGP, MaNganh, Nam, trangthai).ToList();
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
            Response.AddHeader("Content-Disposition", "attachment; filename=DanhSachKhaiThue.xlsx");
            // Lưu file excel của chúng ta như 1 mảng byte để trả về response
            Response.BinaryWrite(buffer.ToArray());
            // Send tất cả ouput bytes về phía clients
            Response.Flush();
            Response.End();
        }


        protected void btnUnLock_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            st.Clear();
            string strErr = "";
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        string idKhaiThue = item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "");
                        KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.idKhaiThue == int.Parse(idKhaiThue));
                        if (kt != null)
                        {
                            kt.TrangThaiHoatDong = true;
                            db.SubmitChanges();
                        }
                    }
                    catch (Exception mess)
                    {
                        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }

                }
            }
            st.Append("$.notify('Mở khoá trạng thái thành công',{className: 'success',globalPosition: 'bottom right'});");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            loadData();
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

        protected void btnCopy_Click(object sender, EventArgs e)
        {
            
            GridDataItem item;
            st.Clear();
            string strErr = "";
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        string masothue = item["masothue"].Text.Trim().Replace("&nbsp;", "");
                        string idKhaiThue = item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "");
                        List<KhaiThue> lstkhaithue = db.KhaiThues.Where(x => x.masothue == masothue && x.nam == DateTime.Now.Year.ToString()).ToList();
                        if (lstkhaithue.Count ==0)
                        {
                            KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.idKhaiThue == int.Parse(idKhaiThue));
                            if(kt!=null)
                            {
                                List<ChiTietKhaiThue> ctkt = db.ChiTietKhaiThues.Where(x=>x.idKhaiThue == kt.idKhaiThue).ToList();
                                if(ctkt.Count >0)
                                {
                                    string ReturnMess = "";
                                    string ReturnMessCode = "";
                                    db.Insert_KhaiThue(""
                                        , kt.masothue, DateTime.Now.Year.ToString(), kt.DienTichKD, kt.SoLuongLD, kt.TuGio, kt.DenGio, kt.TrangThaiHoatDong,
                                         DateTime.Now.ToString("dd/MM/yyyy"), ref ReturnMessCode,ref ReturnMess
                                        );
                                    string idKhaiThueNew = ReturnMessCode;
                                    foreach(ChiTietKhaiThue ct in ctkt)
                                    {
                                        db.Insert_ChitietKhaiThue_NotXML(idKhaiThueNew, ct.DoanhThu.ToString(),ct.manganh,ct.nghekinhdoanh);
                                    }
                                }
                            }
                        }
                        else
                        {
                            st.Append("$.notify('Đã tồn tại dữ liệu của năm " +DateTime.Now.Year.ToString()+ "',{className: 'error',globalPosition: 'bottom right'});");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                            txtNam.Focus();
                        }
                    }
                    catch (Exception mess)
                    {
                        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }

                }
            }
            st.Append("$.notify('Sao chép thông tin thành công',{className: 'success',globalPosition: 'bottom right'});");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            loadData();
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            Export();
            Response.Redirect("DanhSachKhaiThue.aspx");
        }
    }
}