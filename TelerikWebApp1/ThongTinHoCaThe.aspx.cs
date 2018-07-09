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
            if (!IsPostBack)
            {
                LoadComBo();
                LoadDataByID(masothue);
            }
        }
        protected void LoadComBo()
        {
            cboMaDuongPho.DataSource = (from a in db.maduongphos  select new { ma = a.madp, ten = a.tenduong }).ToList();
            cboMaDuongPho.DataValueField = "ma";
            cboMaDuongPho.DataTextField = "ten";
            cboMaDuongPho.DataBind();
            cboMaDuongPho.Items.Insert(0, "");
            cboMaDuongPho.SelectedIndex = 0;
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
                txtMST.Text = danhba.masothue;
                txtNgayCapCMND.Text = ngaycapcmnd.ToString("dd/MM/yyyy");
                txtNgayCapMST.Text = ngaycapmst.ToString("dd/MM/yyyy");
                txtNgaySinh.Text = ngaysinh.ToString("dd/MM/yyyy");
                txtTenCuaHang.Text = danhba.tencuahang;
                cboMaDuongPho.SelectedValue = danhba.madp;
                txtNghekinhDoanh.Text = danhba.nghekinhdoanh;
                txtNam.Text = danhba.nam;
                txtVonKD.Text = danhba.vonkd.ToString();
                txtNgayBatDauKD.Text= ngaybatdaukd.ToString("dd/MM/yyyy");
                txtNgayTinhThue.Text = ngaytinhthue.ToString("dd/MM/yyyy");
                txtSoDT.Text = danhba.sodt;
                txtSoGP.Text = danhba.sogp;
                txtEmail.Text = danhba.email;
                txtGhiChu.Text = danhba.ghichu;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachHoCaThe.aspx");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThongTinHoCaThe.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string masothue = txtMST.Text;
            string ngaycapmst = txtNgayCapMST.Text;
            string hoten = txtHoTen.Text;
            string tencuahang = txtTenCuaHang.Text;
            string ngaysinh = txtNgaySinh.Text;
            string cmnd = txtCMND.Text;
            string diachi = txtDiaChi.Text;
            string ngaycapcmnd = txtNgayCapCMND.Text;
            string madp = cboMaDuongPho.SelectedValue.Trim();
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
                    db.Insert_HoCaThe(masothue, ngaycapmst, hoten, tencuahang, ngaysinh, cmnd, diachi, ngaycapcmnd, madp, nam, nghekinhdoanh, vonkd, ngaybatdaukd, ngaytinhthue, sogp, sodt, email, ghichu);
                    st.Append("$.notify('Thao tác thành công',{className: 'success',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    LoadDataByID(masothue);
                }
                catch
                {
                    st.Append("$.notify('Chương trình xảy ra lỗi',{className: 'error',globalPosition: 'bottom right'});");
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