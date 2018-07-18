using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp1
{
    public partial class QuenMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SendMail()
        {
            // Gmail Address from where you send the mail
            var fromAddress = "lehuy.sn96@gmail.com";
            // any address where the email will be sending
            var toAddress = txtEmail.Text;
            //Password of your gmail address
            const string fromPassword = "Password";
            string password = Membership.GeneratePassword(12, 1);
            // Passing the values and make a email formate to display
            string subject = "Lấy lại mật khẩu";
            string body = "From: CoQuanThue@Gmail.com" + "\n";
            body += "Subject: Reset lại mật khẩu của cán bộ quản lí thuế"  + "\n";
            body += "Mật khẩu của bạn là : "+password + "\n";
            // smtp settings
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(fromAddress, toAddress, subject, body);
        }
        protected void btnGetPass_Click(object sender, EventArgs e)
        {
            SendMail();
        }
    }
}