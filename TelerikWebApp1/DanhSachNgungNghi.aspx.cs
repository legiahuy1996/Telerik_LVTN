using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class DanhSachNgungNghi : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            db = new DataClasses1DataContext();
            if(!IsPostBack)
            {
                getDataSearch();
            }
        }
        public void getDataSearch()
        {
            string masothue = txtMST.Text.Trim();

            List<GetDSNgungNghiResult> lst = db.GetDSNgungNghi(masothue, Session["UserID"].ToString()).ToList();
            grid.DataSource = lst;
            grid.Rebind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getDataSearch();
        }

        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            try
            {
                getDataSearch();
            }
            catch
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }
        }
    }
}