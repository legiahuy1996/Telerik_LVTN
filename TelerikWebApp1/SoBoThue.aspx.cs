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
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                loadDataSearch();
            }
        }
        #region method
        public void loadDataSearch()
        {
            string Activity = "Search";
            string MST = txtMST.Text;
            string CMND = txtCMND.Text;
           List<spfrm_SoBoThueResult> data = db.spfrm_SoBoThue(MST, CMND, null, null, null, null, null, null, null, null, null, Activity, null, Session["UserID"].ToString()).ToList();
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
            int dem = 0;
            try
            {
                foreach (GridDataItem item in grid.SelectedItems)
                {
                    CheckBox chk = (CheckBox)item["ClientSelectColumn"].Controls[0];
                    if (chk.Checked == true)
                    {
                        dem++;
                        idkhaithue = item["idKhaiThue"].Text;
                        db.spfrm_SoBoThue(null, null, null, null, null, null, null, null, null, null, int.Parse(idkhaithue), "Create", null, Session["UserID"].ToString());
                    }
                }
                if(dem==0)
                {
                    st.Append("$.notify('Vui lòng chọn 1 mẫu tin',{className: 'error',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }
                else
                {
                    st.Append("$.notify('Lập sổ bộ thành công',{className: 'success',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    btnSearch_Click(null, null);
                }
              
            }catch(Exception err)
            {
                Response.Write(err);
            }
           

        }

        protected void grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            try
            {
                loadDataSearch();
            }
            catch
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }

        }
    }
}