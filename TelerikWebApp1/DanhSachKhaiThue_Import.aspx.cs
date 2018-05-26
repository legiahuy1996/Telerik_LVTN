using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
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
    public partial class DanhSachKhaiThue_Import : System.Web.UI.Page
    {
        private DataClasses1DataContext db = new DataClasses1DataContext();
        string FilePath = "";
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {

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

                IRow headerRow = sheet.GetRow(1);
                int cellCount = headerRow.LastCellNum;

                for (int j = 0; j < cellCount; j++)
                {
                    ICell cell = headerRow.GetCell(j);
                    dt.Columns.Add(cell.ToString());
                }

                for (int i = (sheet.FirstRowNum + 2); i <= sheet.LastRowNum; i++)
                {
                    IRow row = sheet.GetRow(i);
                    if (!checkEmptyRow(row))
                    {
                        DataRow dataRow = dt.NewRow();
                        for (int j = row.FirstCellNum; j < cellCount; j++)
                        {
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
            return null;
        }
        protected void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
                    if ((Extension == ".xls") || (Extension == ".xlsx"))
                    {
                        FilePath = Server.MapPath(FolderPath + FileName);
                        FileUpload1.SaveAs(FilePath);
                        var data = ReadFromExcelfile(FilePath);
                        txtFilepath.Text = FilePath;
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
        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            var data = ReadFromExcelfile(txtFilepath.Text);
            grid.DataSource = data;

            if (grid.DataSource == null)
                grid.DataSource = new string[] { };
        }


        protected void btnClose_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(Page.GetType(), "script", "window.close();", true);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachKhaiThue_Import.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            st.Clear();
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        string masothue = item["masothue"].Text.Trim();
                        string nam = item["nam"].Text.Trim();
                        string IDKHAITHUE = "";
                        KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.masothue == masothue && x.nam == nam);
                        if (kt != null)
                            IDKHAITHUE = kt.idKhaiThue.ToString();
                        string ReturnMess = "";
                        string ReturnMessCode = "";
                        bool trangthai;
                        float dientich = float.Parse(item["dientichKD"].Text.Trim());
                        int soluongld = int.Parse(item["soluongLD"].Text.Trim());
                        int tugio = int.Parse(item["TuGio"].Text.Trim());
                        int dengio = int.Parse(item["DenGio"].Text.Trim());
                        string manganh = item["manganh"].Text.Trim();
                        string doanhthu = item["doanhthu"].Text.Trim();
                        string nghekinhdoanh = item["nghekinhdoanh"].Text.Trim();
                        string status = item["trangthai"].Text.Trim();
                        if (status.ToUpper() == "TRUE")
                            trangthai = true;
                        else
                            trangthai = false;
                        int lan = int.Parse(item["lan"].Text.Trim());
                        string ngaykhaithue = item["ngaykhaithue"].Text.Trim();
                        db.Insert_KhaiThue(IDKHAITHUE, masothue, nam, dientich, soluongld, tugio, dengio, trangthai, lan, ngaykhaithue, ref ReturnMessCode, ref ReturnMess);
                        if (ReturnMessCode == "-2")
                        {
                            st.Append("$.notify('Đã tồn tại dữ liệu của năm " + nam + "',{className: 'error',globalPosition: 'bottom right'});");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                        }
                        else if (ReturnMessCode == "-1")
                        {
                            st.Append("$.notify('Không tồn tại mã số thuế " + masothue + "',{className: 'error',globalPosition: 'bottom right'});");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                        }
                        else
                        {
                            db.Insert_ChitietKhaiThue_NotXML(ReturnMessCode, doanhthu, manganh, nghekinhdoanh);
                            st.Append("$.notify('Thao tác thành công',{className: 'success',globalPosition: 'bottom right'});");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
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

        protected void btnTemplate_Click(object sender, EventArgs e)
        {
            Response.ContentType = "Application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=DanhSachKhaiThue_Import.xlsx");
            Response.TransmitFile(Server.MapPath("~/Template/DanhSachKhaiThue_Import.xlsx"));
            Response.End();
        }
    }
}