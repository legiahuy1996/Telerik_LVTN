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
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        StringBuilder st = new StringBuilder();
        private DataClasses1DataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string oldpass = Encryptor.MD5Hash(txtOldPass.Text);
            nguoisudung user = db.nguoisudungs.SingleOrDefault(x => x.matkhau == oldpass);
            if (user != null)
            {
                if (txtNewPass.Text == txtNewPassAgain.Text)
                {
                    user.matkhau = Encryptor.MD5Hash(txtNewPass.Text);
                    db.SubmitChanges();
                    st.Append("$.notify('Đổi mật khẩu thành công',{className: 'success',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }
                else
                {
                    st.Append("$.notify('Mật khẩu nhập lại chưa trùng khớp',{className: 'error',globalPosition: 'bottom right'});");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                }
            }
            else
            {
                st.Append("$.notify('Mật khẩu cũ chưa đúng',{className: 'error',globalPosition: 'bottom right'});");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            }
        }
    }
}