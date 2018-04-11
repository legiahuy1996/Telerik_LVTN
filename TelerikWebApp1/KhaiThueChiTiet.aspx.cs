using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class KhaiThueChiTiet : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
        }
        public int InsertData()
        {
            string mst = txtMST.Text;
            int doanhthu = int.Parse(txtDoanhThu.Text);
            string nam = txtNam.Text;
            string idmonbai = txtMonBai.Text;
            string sdt = txtSodt.Text;
            string email = txtEmail.Text;
            string ghichu = txtNote.Text;
            string nghekinhdoanh = txtNgheKD.Text;
            int dientich =int.Parse(txtDTKD.Text);
            int soluongld = int.Parse(txtSoLuongLD.Text);
            int tugio = int.Parse(txtTuGio.Text);
            int dengio = int.Parse(txtDenGio.Text);
            string diachi = txtDiaChiKD.Text;
            bool trangthai = chkTrangThaiHoatDong.Checked;

            int lst = db.Insert_KhaiThue(null, mst, doanhthu, nam, idmonbai, sdt, email, ghichu, nghekinhdoanh, dientich, soluongld, tugio, dengio, diachi, trangthai, null, null, null, null);
                return lst;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertData();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("KhaiThueChiTiet.aspx");
        }
    }
}