using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class Login : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string taikhoan = txtTaiKhoan.Text;
            string matkhau = Encryptor.MD5Hash(txtMatKhau.Text);
            nguoisudung user = db.nguoisudungs.SingleOrDefault(x => x.email == taikhoan && x.matkhau == matkhau);
            if(user != null)
            {
                Session["TaiKhoan"] = taikhoan;
                Response.Redirect("Default.aspx");
            }
            else
            {
                st.Append("$.notify('Tài khoản hoặc mật khẩu không đúng',{className: 'error',globalPosition: 'top center'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }

            
        }
    }
}