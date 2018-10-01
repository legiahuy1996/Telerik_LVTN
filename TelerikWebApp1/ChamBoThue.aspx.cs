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
    public partial class ChamBoThue : System.Web.UI.Page
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
                loadDataSearch();
                //if (DateTime.Now == GoToEndOfMonth(DateTime.Now))
                //    btnCreate.Enabled = true;
                //else
                //    btnCreate.Enabled = false;
            }
               
        }
        public DateTime GoToEndOfMonth(DateTime date)
        {
            if (date.Month == 12)
            {
                // nếu là tháng 12 thì trả về ngày 31
                return new DateTime(date.Year, date.Month, 31);
            }
            // chuyển tới ngày đầu tiên của tháng kế tiếp
            DateTime tem = new DateTime(date.Year, date.Month + 1, 1);
            // lùi lại 1 ngày là về ngày cuối tháng của tháng hiện tại rồi. 
            return tem.AddDays(-1);
        }
        public void loadDataSearch()
        {
            string nghekinhdoanh = txtNgheKinhDoanh.Text;
            string MST = txtMST.Text;
            string diachi = txtDiaChi.Text;
            string hoten = txtHoTen.Text;
   
            grid.DataSource = db.ChamBoThue_LoadData(MST, nghekinhdoanh, diachi, hoten, Session["UserID"].ToString()); 
            grid.Rebind();
        }
        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
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

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            st.Clear();
            int dem = 0;
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        dem++;
                        string idSoBoThue = item["idSoBoThue"].Text.Trim();
                        string ReturnMess = "";
                        db.ChamBoThue(idSoBoThue,ref ReturnMess);
                        if(ReturnMess!="")
                        {
                            st.Append("$.notify('" + ReturnMess + "',{className: 'error',globalPosition: 'bottom right'});");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                        }
                        else
                        {
                            st.Append("$.notify('Thao tác thành công',{className: 'success',globalPosition: 'bottom right'});");
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                        }
                    }
                    catch (Exception ms)
                    {
                        st.Append("$.notify('" + ms.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }
                }
            }
            if (dem == 0)
            {
                st.Append("$.notify('Vui lòng chọn 1 mẫu tin',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
        }
    }
}