using System;
using System.Collections.Generic;
using System.Globalization;
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
            if (Session["taikhoan"] == null)
                Response.Redirect("Login.aspx");
            db = new DataClasses1DataContext();
            masothue = Request.QueryString["masothue"];
            txtNgayCapMST.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtNgayTinhThue.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtNam.Text = DateTime.Now.Year.ToString();
            if (!IsPostBack)
            {
                LoadDataByID(masothue);
            }
        }
        protected void LoadDataByID(string id)
        {
            DanhBa danhba = db.DanhBas.SingleOrDefault(x => x.masothue == masothue);
            if (danhba != null)
            {
                DateTime ngaycapcmnd, ngaycapmst, ngaysinh, ngaybatdaukd, ngaytinhthue;
                ngaycapcmnd = DateTime.Now;
                ngaycapmst = DateTime.Now;
                ngaysinh = DateTime.Now;
                ngaybatdaukd = DateTime.Now;
                ngaytinhthue = DateTime.Now;
                if (danhba.ngaycapcmnd != null)
                {
                     ngaycapcmnd = (DateTime)danhba.ngaycapcmnd;
                }
                if (danhba.ngaycapmst != null)
                {
                    ngaycapmst = (DateTime)danhba.ngaycapmst;
                }
                if (danhba.ngaysinh != null)
                {
                     ngaysinh = (DateTime)danhba.ngaysinh;
                }
                if (danhba.ngaybatdaukd != null)
                    ngaybatdaukd = (DateTime)danhba.ngaybatdaukd;
                if (danhba.ngaytinhthue != null)
                    ngaytinhthue = (DateTime)danhba.ngaytinhthue;
                txtCMND.Text = danhba.cmnd;
                txtDiaChi.Text = danhba.diachiKD;
                txtHoTen.Text = danhba.hoten;
                txtNgayCapCMND.Text = ngaycapcmnd.ToString("dd/MM/yyyy");
                txtNgayCapMST.Text = ngaycapmst.ToString("dd/MM/yyyy");
                txtNgaySinh.Text = ngaysinh.ToString("dd/MM/yyyy");
                txtTenCuaHang.Text = danhba.tencuahang;
                txtNghekinhDoanh.Text = danhba.nghekinhdoanh;
                txtNam.Text = danhba.nam;
                txtVonKD.Text = danhba.vonkd.ToString();
                txtNgayBatDauKD.Text= ngaybatdaukd.ToString("dd/MM/yyyy");
                txtNgayTinhThue.Text = ngaytinhthue.ToString("dd/MM/yyyy");
                txtSoDT.Text = danhba.sodt;
                txtSoGP.Text = danhba.sogp;
                txtEmail.Text = danhba.email;
                txtGhiChu.Text = danhba.ghichu;
                masothue =danhba.masothue;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            string url = "DanhSachHoCaThe.aspx";
            Response.Redirect(url);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThongTinHoCaThe.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            string ngaycapmst = txtNgayCapMST.Text;
            string hoten = txtHoTen.Text;
            string tencuahang = txtTenCuaHang.Text;
            string ngaysinh = txtNgaySinh.Text;
            if(ngaysinh !="")
            {
                DateTime dngaysinh = DateTime.ParseExact(txtNgaySinh.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                DateTime dngaycap = DateTime.ParseExact(txtNgayCapMST.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                if (dngaysinh.AddYears(18)>dngaycap)
                {
                    st.Append("$.notify('Chưa đủ tuổi cấp mã số thuế',{className: 'error',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }
               
            }
            string cmnd = txtCMND.Text;
            string diachi = txtDiaChi.Text;
            string ngaycapcmnd = txtNgayCapCMND.Text;
            string nam = txtNam.Text;
            string nghekinhdoanh = txtNghekinhDoanh.Text;
            string vonkd = txtVonKD.Text;
            string ngaybatdaukd = txtNgayBatDauKD.Text;
            string ngaytinhthue = txtNgayTinhThue.Text;
            string sogp = txtSoGP.Text;
            string sodt = txtSoDT.Text;
            string email = txtEmail.Text;
            string ghichu = txtGhiChu.Text;
            try
            {
                try
                {
                    string id="";
                    db.Insert_HoCaThe(masothue, ngaycapmst, hoten, tencuahang, ngaysinh, cmnd, diachi, ngaycapcmnd, nam, nghekinhdoanh, vonkd, ngaybatdaukd, ngaytinhthue, sogp, sodt, email, ghichu, Session["UserID"].ToString());
                    st.Append("$.notify('Thao tác thành công',{className: 'success',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }
                catch (Exception mess)
                {
                    st.Append("$.notify('"+mess.Message+"',{className: 'error',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }
            } catch(Exception mess)
            {
                st.Append("$.notify('" + mess.Message.Replace("\"","") + "',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
        }
    }
}