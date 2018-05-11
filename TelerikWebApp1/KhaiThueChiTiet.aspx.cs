using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Windows.Documents.Spreadsheet.Expressions.Functions;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class KhaiThueChiTiet : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        protected StringBuilder sbXML = new StringBuilder();
        StringBuilder sbXMLNew = new StringBuilder();
        string idKhaiThue = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
            idKhaiThue = Request.QueryString["idKhaiThue"];
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
        public string InsertKhaiThue()
        {
            string mst = txtMST.Text;
            int doanhthu,dientich,soluongld,tugio,dengio,lan;
            if (txtDanhThu.Text != "")
                doanhthu = int.Parse(txtDanhThu.Text);
            else
                doanhthu = 0;
            string nam = txtNam.Text;
            string sdt = txtSodt.Text;
            string email = txtEmail.Text;
            string ghichu = txtNote.Text;
            string nghekinhdoanh = cboMaNganh.SelectedValue;
            if (txtDienTichKD.Text != "")
                dientich = int.Parse(txtDienTichKD.Text);
            else
                dientich = 0;
            if (txtSoLuongLD.Text != "")
                soluongld = int.Parse(txtSoLuongLD.Text);
            else
                soluongld = 0;
            if (txtTuGio.Text != "")
                tugio = int.Parse(txtTuGio.Text);
            else
                tugio = 0;
            if (txtDenGio.Text != "")
                dengio = int.Parse(txtDenGio.Text);
            else
                dengio = 0;
            string diachi = txtDiaChiKD.Text;
            bool trangthai;
            if (chkActive.Checked == true)
                 trangthai = true;
            else
                 trangthai = false;
            if (txtLan.Text != "")
                lan = int.Parse(txtLan.Text);
            else
                lan = 0;
            string ngaykhaithue = txtNgayKhai.Text;
            string ReturnMess = ""; 
            string ReturnMessCode = "";
            db.Insert_KhaiThue(idKhaiThue, mst,doanhthu,nam,sdt,email,ghichu,dientich,soluongld,tugio,dengio,diachi,trangthai,lan,ngaykhaithue,ref ReturnMessCode,ref ReturnMess);
            return ReturnMessCode;
        }
        protected void InsertChiTiet()
        {
            
            foreach (GridDataItem item in grid.Items)
            {
                sbXML.Append("<Record>");
                sbXML.Append("<idKhaiThue>" + idKhaiThue + "</idKhaiThue>");
                sbXML.Append("<idchitiet>" + item["idchitiet"].Text.Trim().Replace("&nbsp;", "") + "</idchitiet>");
                sbXML.Append("<manganh>" + item["manganh"].Text.Trim().Replace("&nbsp;", "") + "</manganh>");
                sbXML.Append("<DoanhThu>" + item["DoanhThu"].Text.Trim().Replace("&nbsp;", "") + "</DoanhThu>");
                sbXML.Append("<NgheKinhDoanh>" + item["NgheKinhDoanh"].Text.Trim().Replace("&nbsp;", "") + "</NgheKinhDoanh>");
                sbXML.Append("</Record>");
            }
            string strXML = "<Root>" + sbXML.ToString() + "</Root>";
            db.Insert_ChitietKhaiThue(strXML);
           
        }
        protected void LoadDataByID(string id)
        {
            KhaiThue khaithue = db.KhaiThues.SingleOrDefault(x => x.idKhaiThue == int.Parse(id));
            txtMST.Text = khaithue.masothue;
            txtNam.Text = khaithue.nam;
            txtNgayKhai.Text = khaithue.ngaykhaithue.ToString();
            txtLan.Text = khaithue.ToString();
            txtEmail.Text = khaithue.email;
            txtSodt.Text = khaithue.sodt;
            txtNote.Text = khaithue.ghichu;
            txtDiaChiKD.Text = khaithue.diachiKD;
            txtDienTichKD.Text = khaithue.DienTichKD.ToString();
            if (khaithue.TrangThaiHoatDong == true)
                chkActive.Checked = true;
            else
                chkNoActive.Checked = false;
            txtSoLuongLD.Text = khaithue.SoLuongLD.ToString();
            if (db.Load_ChiTietKhaiThue(id) != null)
                grid.DataSource = db.Load_ChiTietKhaiThue(id);
            else
                grid.DataSource = new string[] { };
            
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
           string Err = InsertKhaiThue();
            if(Err !="")
            {
                idKhaiThue = Err;
                InsertChiTiet();
                LoadDataByID(idKhaiThue);
            }
            Response.Redirect("KhaiThueChiTiet.aspx");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("KhaiThueChiTiet.aspx");
        }

        protected void btnLayTuDanhBa_Click(object sender, EventArgs e)
        {
            string MST = txtMST.Text;
            if (MST != "")
            {
                DanhBa danhba = db.DanhBas.SingleOrDefault(x => x.masothue == MST);
                if (danhba != null)
                {
                    txtMST.Text = MST;
                    txtNam.Text = DateTime.Now.Year.ToString();
                    txtMgayKhaiThue.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    txtDiaChiKD.Text = danhba.diachi;
                    txtEmail.Text = danhba.email;
                    txtSodt.Text = danhba.sodt;
                    txtNote.Text = danhba.ghichu;
                }

            }

        }
        protected void ClearControl()
        {
            
            cboMaNganh.SelectedIndex = 0;
          
            txtDanhThu.Text = "";
            txtNgheKinhDoanh.Text = "";
        }
        private string LoadDetail(string Seq)
        {
            string ReturnCode = string.Empty, ReturnMess = string.Empty;
            string manganh = "", DoanhThu = "", NgheKinhDoanh = "", NgayBDKinhDoanh = "";
            manganh = cboMaNganh.SelectedValue.Trim();
            DoanhThu = txtDanhThu.Text;
            NgheKinhDoanh = txtNgheKinhDoanh.Text;
            NgayBDKinhDoanh = txtStartDate.Text;

            for (int i = 0; i < grid.Items.Count; i++)
            {
                GridDataItem item = (GridDataItem)grid.Items[i];
                string Sq = ((TextBox)item.FindControl("txtSeqRow")).Text.Trim();
                if (Seq == "" || (Seq != "" && Seq != Sq))
                {
                    sbXML.Append("<Record>");
                    sbXML.Append("<idKhaiThue>" + idKhaiThue + "</idKhaiThue>");
                    sbXML.Append("<idchitiet>" + item["idchitiet"].Text.Trim().Replace("&nbsp;", "") + "</idchitiet>");
                    sbXML.Append("<manganh>" + item["manganh"].Text.Trim().Replace("&nbsp;", "") + "</manganh>");
                    sbXML.Append("<DoanhThu>" + item["DoanhThu"].Text.Trim().Replace("&nbsp;", "") + "</DoanhThu>");
                    sbXML.Append("<NgheKinhDoanh>" + item["NgheKinhDoanh"].Text.Trim().Replace("&nbsp;", "") + "</NgheKinhDoanh>");
                    sbXML.Append("</Record>");
                }

            }
            if (manganh != "")
            {
                sbXML.Append("<Record>");
                sbXML.Append("<idKhaiThue>" + idKhaiThue + "</idKhaiThue>");
                sbXML.Append("<idchitiet></idchitiet>");
                sbXML.Append("<manganh>" + manganh + "</manganh>");
                sbXML.Append("<DoanhThu>" + DoanhThu + "</DoanhThu>");
                sbXML.Append("<NgheKinhDoanh>" + NgheKinhDoanh + "</NgheKinhDoanh>");
                sbXML.Append("</Record>");

            }
            if (sbXML.ToString() != "")
            {
                string strXML = "<Root>" + sbXML.ToString() + "</Root>";
                grid.DataSource = db.LoadChiTietKhaiThueXML(strXML, ref ReturnCode, ref ReturnMess, "LoadDetailXML");
                grid.DataBind();
            }
            ClearControl();
            return ReturnMess;
        }
        protected string CheckTrungChiTiet()
        {
            string ReturnMess = string.Empty;
            string manganh = "", DoanhThu = "", NgheKinhDoanh = "", NgayBDKinhDoanh = "";
          
            manganh = cboMaNganh.SelectedValue.Trim();
            DoanhThu = txtDanhThu.Text;
            NgheKinhDoanh = txtNgheKinhDoanh.Text;
            NgayBDKinhDoanh = txtStartDate.Text;
            for (int i = 0; i < grid.Items.Count; i++)
            {
                GridDataItem item = (GridDataItem)grid.Items[i];
                {
                    sbXML.Append("<Record>");
                    sbXML.Append("<idKhaiThue>" + idKhaiThue + "</idKhaiThue>");
                    sbXML.Append("<idchitiet>" + item["idchitiet"].Text.Trim().Replace("&nbsp;", "") + "</idchitiet>");
                    sbXML.Append("<manganh>" + item["manganh"].Text.Trim().Replace("&nbsp;", "") + "</manganh>");
                    sbXML.Append("<DoanhThu>" + item["DoanhThu"].Text.Trim().Replace("&nbsp;", "") + "</DoanhThu>");
                    sbXML.Append("<NgheKinhDoanh>" + item["NgheKinhDoanh"].Text.Trim().Replace("&nbsp;", "") + "</NgheKinhDoanh>");
                    sbXML.Append("</Record>");
                }

            }
            sbXMLNew.Append("<Record>");
            sbXMLNew.Append("<idKhaiThue>" + idKhaiThue + "</idKhaiThue>");
            sbXMLNew.Append("<idchitiet></idchitiet>");
            sbXMLNew.Append("<manganh>" + manganh + "</manganh>");
            sbXMLNew.Append("<DoanhThu>" + DoanhThu + "</DoanhThu>");
            sbXMLNew.Append("<NgheKinhDoanh>" + NgheKinhDoanh + "</NgheKinhDoanh>");
            sbXMLNew.Append("</Record>");
            string strXML = "<Root>" + sbXML.ToString() + "</Root>";
            string strXMLNew = "<Root>" + sbXMLNew.ToString() + "</Root>";
            db.CheckTrung_ChitietKhaiThue(strXML, strXMLNew, ref ReturnMess);
            return ReturnMess;

        }
        protected void btnAddDetail_Click(object sender, EventArgs e)
        {
            string err = CheckTrungChiTiet();
            if (err == "")
            {
                sbXML.Clear();
                LoadDetail("");
            }
            else
                Response.Write(err);
            
        }

        protected void grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            try
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
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
            if (commandName == "DELETE_DEMAND")
            {
                if (e.Item is GridDataItem)
                {
                    item_detail = (GridDataItem)e.Item;
                    string idchitiet = item_detail["idchitiet"].Text.Trim().Replace("&nbsp;", "") + "$";
                    if (item_detail["idchitiet"].Text.Trim().Replace("&nbsp;", "") != "")
                    {
                        db.thues.DeleteOnSubmit(db.thues.SingleOrDefault(x=>x.idChiTiet == int.Parse(idchitiet)));
                        ChiTietKhaiThue ct = db.ChiTietKhaiThues.SingleOrDefault(x => x.idChiTiet == int.Parse(idchitiet));
                        db.ChiTietKhaiThues.DeleteOnSubmit(ct);
                        db.SubmitChanges();
                    }
                    txtSeq.Text ="";
                    TextBox txtSeqRow = (TextBox)item_detail.FindControl("txtSeqRow");
                    LoadDetail(txtSeqRow.Text);
                }
            }
        }
    }
}