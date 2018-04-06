<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="KhaiThueChiTiet.aspx.cs" Inherits="TelerikWebApp1.KhaiThueChiTiet" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
   <h1 style="margin-left: 30%">Khai thuế chi tiết</h1>
    <br />
  <form id="frm" runat="server">
     <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server">
            <tr>
                <td width="15%">
                    <asp:Label runat="server" ID="lblMST">Mã số thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtMST" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblTenCuaHang">Tên cửa hàng</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtTenCuaHang" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%">
                    <asp:Label runat="server" ID="lblCMND">CMND</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtCMND" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblNayCap">Ngày cấp</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtNgayCap" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%">
                    <asp:Label runat="server" ID="lblSoGP">Số giấy phép</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtSoGP" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblDiaChi">Địa chỉ</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtDiaChi" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%">
                    <asp:Label runat="server" ID="Label5">Họ Tên</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="TextBox5" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label6">Ngày tính thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="TextBox6" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%">
                    <asp:Label runat="server" ID="Label7">Mã ngành</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="TextBox7" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label8">Số điện thoại</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="TextBox8" Width="80%"></asp:TextBox>
                </td>
            </tr>

           
        </table>
      <hr />
<table cellspacing="1" cellpadding="1" width="100%" border="0">
    <tr>
        <td colspan="3" align="center">
            <span class="btn1">
                <asp:LinkButton ID="btnReset" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R" ><span class="btnReset">Làm mới</span>
                </asp:LinkButton>
                <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" ><span class="btnSave">Lưu</span>
                </asp:LinkButton>
            </span>
        </td>
    </tr>
</table>
      </form>
</asp:Content>
