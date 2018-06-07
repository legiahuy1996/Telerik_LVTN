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
    public partial class ThemMoiHoCaThe : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder(); 
        private string masothue = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
            masothue = Request.QueryString["masothue"];
            if (!IsPostBack)
            {

            }
        }
        protected void LoadDataByID(string id)
        {
            DanhBa danhba = db.DanhBas.SingleOrDefault(x=>x.masothue==masothue);
            if(danhba!=null)
            {
                
            }
        }
    }
}