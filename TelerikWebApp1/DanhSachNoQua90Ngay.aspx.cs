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
            List<sono> lstSoNoTNCN = db.sonos.Where(x => x.tieumuc == 1003).OrderBy(x =>x.masothue).ToList();
            List<sono> lstSoNoGTGT = db.sonos.Where(x => x.tieumuc == 1701).ToList();
            List<sono> lstSoNoMonNai = db.sonos.Where(x => x.tieumuc == 0).ToList();
            List<DanhBa> lst90 = new List<DanhBa>();
            int dem = 0;
            for (int i = 0; i < lstSoNoTNCN.Count; i++)
            {
                if (i == lstSoNoTNCN.Count - 1)
                    break;
                if (lstSoNoTNCN[i].CreateTime.Value.Month + 1 == lstSoNoTNCN[i + 1].CreateTime.Value.Month)
                    dem++;
                if (dem == 2)
                {
                    DanhBa a = db.DanhBas.SingleOrDefault(x => x.masothue == lstSoNoTNCN[i].masothue);
                    lst90.Add(a);
                    break;
                }
            }
            if(lst90.Count ==0)
            {
                for (int i = 0; i < lstSoNoGTGT.Count; i++)
                {
                    if (i == lstSoNoGTGT.Count - 1)
                        break;
                    if (lstSoNoGTGT[i].CreateTime.Value.Month + 1 == lstSoNoGTGT[i + 1].CreateTime.Value.Month)
                        dem++;
                    if (dem == 2)
                    {
                        DanhBa a = db.DanhBas.SingleOrDefault(x => x.masothue == lstSoNoGTGT[i].masothue);
                        lst90.Add(a);
                        break;
                    }
                }
            }

            grid.DataSource = lst90;
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