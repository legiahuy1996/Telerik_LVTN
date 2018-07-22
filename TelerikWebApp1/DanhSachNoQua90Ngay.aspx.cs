using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class DanhSachNoQua90Ngay : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        protected void LoadData()
        {
            string masothue = txtMST.Text;
            grid.DataSource = db.getDsConNoQua3Thang(masothue, Session["UserID"].ToString()).ToList();
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}