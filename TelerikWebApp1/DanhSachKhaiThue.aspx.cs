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
        protected void ToggleRowSelection(object sender, EventArgs e)
        {
            ((sender as CheckBox).NamingContainer as GridItem).Selected = (sender as CheckBox).Checked;
            bool checkHeader = true;
            foreach (GridDataItem dataItem in grid.MasterTableView.Items)
            {
                if (!(dataItem.FindControl("CheckBox1") as CheckBox).Checked)
                {
                    checkHeader = false;
                    break;
                }
            }
            GridHeaderItem headerItem = grid.MasterTableView.GetItems(GridItemType.Header)[0] as GridHeaderItem;
            (headerItem.FindControl("headerChkbox") as CheckBox).Checked = checkHeader;
        }
        protected void ToggleSelectedState(object sender, EventArgs e)
        {
            CheckBox headerCheckBox = (sender as CheckBox);
            foreach (GridDataItem dataItem in grid.MasterTableView.Items)
            {
                (dataItem.FindControl("CheckBox1") as CheckBox).Checked = headerCheckBox.Checked;
                dataItem.Selected = headerCheckBox.Checked;
            }
        }
        public void loadData()
        {
            string MST = txtMST.Text;
            string SoGP = txtSoGP.Text;
            string CuaHang = txtDiaChiCuaHang.Text;
            string MaNganh = cboMaNganh.SelectedValue.Trim();
            string Nam = txtNam.Text;
            List<getDSThueResult> lst = db.getDSThue(MST, CuaHang, SoGP, MaNganh,Nam).ToList();
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