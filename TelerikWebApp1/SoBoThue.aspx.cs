﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
        public SoBoThue()
        {
            db = new DataClasses1DataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        #region method

        public void loadDataSearch()
        {
            string Activity = "Search";

            string MST = txtMST.Text;
            string CMND = txtCMND.Text;
            string tencuahang = txtTenCuaHang.Text;
            string ngaycapCMND = txtNgayCapCMND.Text;
            string sogp = txtSoGP.Text;
            string diachi = txtDiaChi.Text;
            string hoten = txtHoTen.Text;
            string ngaytinhthue = txtNgayTinhThue.Text;
            string manganh = txtMaNganh.Text;
            string sdt = txtSDT.Text;





            List<spfrm_SoBoThueResult> data = db.spfrm_SoBoThue(MST, CMND, tencuahang, ngaycapCMND, sogp, diachi, hoten, ngaytinhthue, manganh, sdt, null, Activity, null).ToList();
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
            try
            {
                foreach (GridDataItem item in grid.SelectedItems)
                {
                    CheckBox chk = (CheckBox)item["ClientSelectColumn"].Controls[0];
                    if (chk.Checked == true)
                    {
                        idkhaithue = item["idKhaiThue"].Text;
                        db.spfrm_SoBoThue(null, null, null, null, null, null, null, null, null, null, int.Parse(idkhaithue), "Create", null);



                    }
                }

                btnSearch_Click(null, null);
            }catch(Exception err)
            {
                Response.Write(err);
            }
           

        }

       
    }
}