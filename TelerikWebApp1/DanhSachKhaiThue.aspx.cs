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
        }
     
        public void loadData()  
        {
            string MST = txtMST.Text;
            string SoGP = txtSoGP.Text;
            string MaNganh = cboMaNganh.SelectedValue;
            string Nam = txtNam.Text;
            List<getDSThueResult> lst = db.getDSThue(MST, SoGP, MaNganh,Nam).ToList();
            grid.DataSource = lst;
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