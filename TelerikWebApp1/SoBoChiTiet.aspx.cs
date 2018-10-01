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
                if (Session["taikhoan"] == null)
                    Response.Redirect("Login.aspx");
                if (idSoBoThue != "")
                {
                    LoadDataByID(idSoBoThue);
                }
            }
        }
        protected void LoadDataByID(string id)
        {
            try
            {
                var sobothue = db.SoBoThues.SingleOrDefault(x => x.idSoBoThue == int.Parse(id));
                DateTime dt = new DateTime();
                txtIDKhaiThue.Text = sobothue.idKhaiThue.ToString();
                if (sobothue.NgayLapBo.ToString() != "")
                    dt = DateTime.Parse(sobothue.NgayLapBo.ToString());
                txtNgayLapBo.Text = dt.ToString("dd/MM/yyyy");
                int doanhthu = sobothue.DoanhThuTinhThueGTGT ?? 0;
                int sotienGTGT = sobothue.SoTienGTGT1Thang ?? 0;
                int sotienTNCN = sobothue.SoTienTNCN1Thang ?? 0;
                txtGTGT.Text = doanhthu.ToString("#,##");
                txtTNCN.Text = doanhthu.ToString("#,##");

                //txtTyLeGTGT.Text = sobothue.TyLeTinhThueGTGT.ToString();
                //txtTyLeTNCN.Text = sobothue.TyLeTinhThueTNCN.ToString();
                txtSoTienGTGT.Text = sotienGTGT.ToString("#,##");
                txtSoTienTNCN.Text = sotienTNCN.ToString("#,##");
                KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.idKhaiThue == sobothue.idKhaiThue);
                if (kt != null)
                {
                    DanhBa danhba = db.DanhBas.SingleOrDefault(x => x.masothue == kt.masothue);
                    txtMST.Text = danhba.masothue;
                    txtHoTen.Text = danhba.hoten;
                }
            }
            catch (Exception mess)
            {
                st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
        }
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    st.Clear();
        //    try
        //    {
        //        var kt = db.SoBoThues.SingleOrDefault(x => x.idSoBoThue == int.Parse(idSoBoThue));
        //        if (kt != null)
        //        {
        //            if (chkActive.Checked == true)
        //            {
        //                kt.TinhTrangNopThue = true;
        //            }
        //            else
        //            {
        //                kt.TinhTrangNopThue = false;
        //            }
        //            db.SubmitChanges();
        //            st.Append("$.notify('Cập nhật thông tin thành công',{className: 'success',globalPosition: 'bottom right'});");
        //            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
        //        }
        //    }
        //    catch (Exception mess)
        //    {
        //        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
        //        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
        //    }
        //}

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachSoBoThue.aspx");
        }

        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

            try
            {
                grid.DataSource = db.DanhSachThongTinHoCaThe(int.Parse(idSoBoThue));
            }
            catch (Exception ex)
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }
        }
    }
}