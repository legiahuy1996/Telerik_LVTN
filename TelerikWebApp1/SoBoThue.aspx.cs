using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class SoBoThue : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        public SoBoThue()
        {
            db = new DataClasses1DataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadDataSearch();
                LoadComBo();
            }
        }
        #region method
        protected void LoadComBo()
        {

            cboMaNganh.DataSource = (from a in db.manganhs where a.manganh1 != "07" select new { ma = a.manganh1, ten = a.tennganh }).ToList();
            cboMaNganh.DataValueField = "ma";
            cboMaNganh.DataTextField = "ten";
            cboMaNganh.DataBind();
            cboMaNganh.Items.Insert(0, "");
            cboMaNganh.SelectedIndex = 0;
        }
        public void loadDataSearch()
        {
            string Activity = "Search";

            string MST = txtMST.Text;
            string CMND = txtCMND.Text;
            string tencuahang = txtTenCuaHang.Text;
            string ngaycapCMND = txtNgayCapCMND.Text;
            string sogp = txtSoGP.Text;
            string diachi = txtDiaChi.Text;
            string hoten = txtHoTen.Text;
            string ngaytinhthue = txtNgayTinhThue.Text;
            string manganh = cboMaNganh.SelectedValue.Trim();
            string sdt = txtSDT.Text;





            List<spfrm_SoBoThueResult> data = db.spfrm_SoBoThue(MST, CMND, tencuahang, ngaycapCMND, sogp, diachi, hoten, ngaytinhthue, manganh, sdt, null, Activity, null).ToList();
            grid.DataSource = data;
            grid.Rebind();
        }

        #endregion

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadDataSearch();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("SoBoThue.aspx");
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string idkhaithue = "";
            try
            {
                foreach (GridDataItem item in grid.SelectedItems)
                {
                    CheckBox chk = (CheckBox)item["ClientSelectColumn"].Controls[0];
                    if (chk.Checked == true)
                    {
                        idkhaithue = item["idKhaiThue"].Text;
                        db.spfrm_SoBoThue(null, null, null, null, null, null, null, null, null, null, int.Parse(idkhaithue), "Create", null);
                    }
                }
                st.Append("$.notify('Lập sổ bộ thành công',{className: 'success',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                btnSearch_Click(null, null);
            }catch(Exception err)
            {
                Response.Write(err);
            }
           

        }

       
    }
}