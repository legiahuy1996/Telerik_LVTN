using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TelerikWebApp1.Model;
namespace TelerikWebApp1
{
    public partial class DanhSachNoThue : System.Web.UI.Page
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
            grid.DataSource = db.getDsConNo(masothue, Session["UserID"].ToString());
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            st.Clear();
            string strErr = "";
            int dem = 0;
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                TextBox txtSoTien = (TextBox)item["ClientSelectColumn"].FindControl("txtSoTien");
                if (checkBox.Checked == true)
                {
                    try
                    {
                        dem++;
                        string id = item["idSoNo"].Text.Trim().Replace("&nbsp;", "");
                        sono sn = db.sonos.SingleOrDefault(x => x.idSoNo == int.Parse(id));
                        if (sn != null)
                        {
                            sn.SoTien = int.Parse(txtSoTien.Text.Replace(",", ""));
                            sn.Editer = Session["taikhoan"].ToString();
                            sn.EditTime = DateTime.Now;
                            db.SubmitChanges();
                            st.Append("$.notify('Thao tác thành công',{className: 'success',globalPosition: 'bottom right'});");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);

                        }
                    }
                    catch (Exception mess)
                    {
                        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }
                }
            }
            if (dem == 0)
            {
                st.Append("$.notify('Vui lòng chọn 1 mẫu tin',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
            getDataSearch();
        }

    }
}