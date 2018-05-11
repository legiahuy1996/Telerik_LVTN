using System;
using System.Collections.Generic;
using System.Linq;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
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
            grid.DataSource = db.getDSThue(MST, SoGP, MaNganh, Nam);
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
        }
    }
}