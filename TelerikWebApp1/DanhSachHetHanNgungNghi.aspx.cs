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
    public partial class DanhSachHetHanNgungNghi : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            db = new DataClasses1DataContext();
            if (!IsPostBack)
            {
                getDataSearch();
            }
        }
        public void getDataSearch()
        {
            string masothue = txtMST.Text.Trim();
            grid.DataSource = (from c in db.thongtinngungnghis
                               join d in db.KhaiThues on c.idKhaiThue equals d.idKhaiThue
                               join a in db.DanhBas on d.masothue equals a.masothue
                               where c.denngay == DateTime.Now && (masothue == "" || d.masothue == masothue)
                               select new
                               {
                                   masothue = d.masothue,
                                   hoten = a.hoten,
                                   nghekinhdoanh = a.nghekinhdoanh
                               }).ToList();
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getDataSearch();
        }
    }
}