using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class DanhSachDuocLenSoBo : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        public DanhSachDuocLenSoBo()
        {
            db = new DataClasses1DataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                LoadData();   
            }
        }
        protected void LoadData()
        {
            List<getDSHoDuocLenSoBoResult> data = db.getDSHoDuocLenSoBo(Session["UserID"].ToString()).ToList();
            grid.DataSource = data;
            grid.Rebind();
        }
        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            try
            {
                LoadData();
            }
            catch
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }
        }
    }
}