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
                LoadDataByID(masothue);
            }
        }
        protected void LoadDataByID(string id)
        {
            DanhBa danhba = db.DanhBas.SingleOrDefault(x => x.masothue == masothue);
            if (danhba != null)
            { 
                DateTime ngaycapcmnd, ngaycapmst, ngaysinh;
                ngaycapcmnd = DateTime.Now;
                ngaycapmst = DateTime.Now;
                ngaysinh = DateTime.Now;
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
                txtCMND.Text = danhba.cmnd;
                txtDiaChi.Text = danhba.diachiKD;
                txtHoTen.Text = danhba.hoten;
                txtMST.Text = danhba.masothue;
                txtNgayCapCMND.Text = ngaycapcmnd.ToString("dd/MM/yyyy");
                txtNgayCapMST.Text = ngaycapmst.ToString("dd/MM/yyyy");
                txtNgaySinh.Text = ngaysinh.ToString("dd/MM/yyyy");
                txtTenCuaHang.Text = danhba.tencuahang;
            }
        }
    }
}