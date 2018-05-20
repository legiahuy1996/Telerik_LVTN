using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TelerikWebApp1.Model;

namespace TelerikWebApp1
{
    public partial class DanhSachKhaiThue : System.Web.UI.Page
    {
        private DataClasses1DataContext db;
        StringBuilder st = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DataClasses1DataContext();
            if (!IsPostBack)
                LoadComBo();
        }
        protected void LoadComBo()
        {

            cboMaNganh.DataSource = (from a in db.manganhs where a.manganh1 != "07" select new { ma = a.manganh1, ten = a.tennganh }).ToList();
            cboMaNganh.DataValueField = "ma";
            cboMaNganh.DataTextField = "ten";
            cboMaNganh.DataBind();
            cboMaNganh.Items.Insert(0, "");
            cboMaNganh.SelectedIndex = 0;
        }
        public void loadData()
        {
            string MST = txtMST.Text;
            string SoGP = txtSoGP.Text;
            string MaNganh = cboMaNganh.SelectedValue;
            string Nam = txtNam.Text;
            string trangthai = rdbTinhTrang.SelectedValue.Trim();
            grid.DataSource = db.getDSThue(MST, SoGP, MaNganh, Nam,trangthai);
            grid.Rebind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadData();
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachKhaiThue.aspx");
        }

        protected void btnLock_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            st.Clear();
            string strErr = "";
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        string idKhaiThue = item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "");
                        KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.idKhaiThue == int.Parse(idKhaiThue));
                        if (kt != null)
                        {
                            kt.TrangThaiHoatDong = false;
                            db.SubmitChanges();
                        }
                    }catch(Exception mess)
                    {
                        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }
                   
                }
            }
            st.Append("$.notify('Khoá trạng thái thành công',{className: 'success',globalPosition: 'bottom right'});");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            loadData();
        }

        protected void grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            try
            {
                loadData();
            }
            catch
            {
                if (grid.DataSource == null)
                    grid.DataSource = new string[] { };
            }
        }

        protected void grid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            string commandName = e.CommandName.ToUpper();
            GridDataItem item;
            if (commandName == "EDIT_DATA")
            {
                if (e.Item is GridDataItem)
                {
                    item = (GridDataItem)e.Item;
                    if (item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "") != "")
                    {
                        string url = "KhaiThueChiTiet.aspx?idKhaiThue=" + item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "");
                        Response.Redirect(url);
                    }
                }
            }
        }

        protected void btnUnLock_Click(object sender, EventArgs e)
        {
            GridDataItem item;
            st.Clear();
            string strErr = "";
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        string idKhaiThue = item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "");
                        KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.idKhaiThue == int.Parse(idKhaiThue));
                        if (kt != null)
                        {
                            kt.TrangThaiHoatDong = true;
                            db.SubmitChanges();
                        }
                    }
                    catch (Exception mess)
                    {
                        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }

                }
            }
            st.Append("$.notify('Mở khoá trạng thái thành công',{className: 'success',globalPosition: 'bottom right'});");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            loadData();
        }

        protected void grid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                int rowCounter = new int();
                Label lbl = e.Item.FindControl("numberLabel") as Label;
                rowCounter = grid.MasterTableView.PageSize * grid.MasterTableView.CurrentPageIndex;
                lbl.Text = (e.Item.ItemIndex + 1 + rowCounter).ToString();
            }
        }

        protected void btnCopy_Click(object sender, EventArgs e)
        {
            
            GridDataItem item;
            st.Clear();
            string strErr = "";
            for (int i = 0; i < grid.Items.Count; i++)
            {
                item = (GridDataItem)grid.Items[i];
                CheckBox checkBox = (CheckBox)item["ClientSelectColumn"].Controls[0];
                if (checkBox.Checked == true)
                {
                    try
                    {
                        string masothue = item["masothue"].Text.Trim().Replace("&nbsp;", "");
                        string idKhaiThue = item["idKhaiThue"].Text.Trim().Replace("&nbsp;", "");
                        List<KhaiThue> lstkhaithue = db.KhaiThues.Where(x => x.masothue == masothue && x.nam == DateTime.Now.Year.ToString()).ToList();
                        if (lstkhaithue.Count ==0)
                        {
                            KhaiThue kt = db.KhaiThues.SingleOrDefault(x => x.idKhaiThue == int.Parse(idKhaiThue));
                            if(kt!=null)
                            {
                                List<ChiTietKhaiThue> ctkt = db.ChiTietKhaiThues.Where(x=>x.idKhaiThue == kt.idKhaiThue).ToList();
                                if(ctkt.Count >0)
                                {
                                    string ReturnMess = "";
                                    string ReturnMessCode = "";
                                    db.Insert_KhaiThue(""
                                        , kt.masothue, DateTime.Now.Year.ToString(), kt.DienTichKD, kt.SoLuongLD, kt.TuGio, kt.DenGio, kt.TrangThaiHoatDong,
                                        kt.Lan, DateTime.Now.ToString("dd/MM/yyyy"), ref ReturnMessCode,ref ReturnMess
                                        );
                                    string idKhaiThueNew = ReturnMessCode;
                                    foreach(ChiTietKhaiThue ct in ctkt)
                                    {
                                        db.Insert_ChitietKhaiThue_NotXML(idKhaiThue,ct.DoanhThu.ToString(),ct.manganh,ct.nghekinhdoanh);
                                    }
                                }
                            }
                        }
                    }
                    catch (Exception mess)
                    {
                        st.Append("$.notify('" + mess.Message + "',{className: 'error',globalPosition: 'bottom right'});");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
                    }

                }
            }
            st.Append("$.notify('Sao chép thông tin thành công',{className: 'success',globalPosition: 'bottom right'});");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", st.ToString(), true);
            loadData();
        }
    }
}