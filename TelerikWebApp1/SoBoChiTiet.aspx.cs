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
    public partial class SoBoChiTiet : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        string idSoBoThue = "";
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
            idSoBoThue = Request.QueryString["idSoBoThue"];
            if (!IsPostBack)
            {
                if (idSoBoThue != "")
                {
                    LoadDataByID(idSoBoThue);
                }
            }
        }
        protected void LoadDataByID(string id)
        {
            var sobothue = db.SoBoThues.SingleOrDefault(x=>x.idSoBoThue == int.Parse(id));
            txtIDKhaiThue.Text = sobothue.idKhaiThue.ToString();
            txtNgayLapBo.Text = sobothue.NgayLapBo.ToString();
            txtThang.Text = sobothue.Thang.ToString();
            txtGTGT.Text = sobothue.DoanhThuTinhThueGTGT.ToString();
            txtTNCN.Text = sobothue.DoanhThuTinhThueTNCN.ToString();
            txtTyLeGTGT.Text = sobothue.TyLeTinhThueGTGT.ToString();
            txtTyLeTNCN.Text = sobothue.TyLeTinhThueTNCN.ToString();
            txtSoTienGTGT.Text = sobothue.SoTienTNCN1Thang.ToString();
            txtSoTienTNCN.Text = sobothue.SoTienTNCN1Thang.ToString();
            if (sobothue.TinhTrangNopThue == true)
                chkActive.Checked = true;
            else
                chkNoActive.Checked = true;



        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            st.Clear();
            try
            {
                var kt = db.SoBoThues.SingleOrDefault(x => x.idSoBoThue == int.Parse(idSoBoThue));
                if (kt != null)
                {
                    if(chkActive.Checked == true)
                    {
                        kt.TinhTrangNopThue = true;
                    }
                    else
                    {
                        kt.TinhTrangNopThue = false;
                    }
                    db.SubmitChanges();
                    st.Append("$.notify('Cập nhật thông tin thành công',{className: 'success',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }
            }
            catch (Exception mess)
            {
                st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachSoBoThue.aspx");
        }

        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

            try
            {
                grid.DataSource = db.DanhSachThongTinHoCaThe(int.Parse(idSoBoThue));
                grid.Rebind();

            }
            catch
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }
        }
    }
}