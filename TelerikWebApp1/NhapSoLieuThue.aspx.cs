using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
                    string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
                    if ((Extension == ".xls") || (Extension == ".xlsx"))
                    {
                        FilePath = Server.MapPath(FolderPath + FileName);
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
                        db.Insert_SoLieuNopThue(masothue, macbql, sotiennop, ngaynop, kythue, tieumuc, muc);
                        if ((System.IO.File.Exists(txtFilepath.Text)))
                        {
                            System.IO.File.Delete(txtFilepath.Text);
                        }
                        st.Append("$.notify('Thao tác thành công',{className: 'success',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);


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