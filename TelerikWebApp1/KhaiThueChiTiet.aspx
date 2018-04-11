<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="KhaiThueChiTiet.aspx.cs" Inherits="TelerikWebApp1.KhaiThueChiTiet" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
   <h1 style="margin-left: 30%">Khai thuế chi tiết</h1>
    <br />
  <form id="frm" runat="server">
     <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server">
         
        <tr>
            <td style="width: 5%"></td>
            <td style="width: 15%"></td>
            <td style="width: 30%"></td>
            <td style="width: 20%"></td>
            <td style="width: 30%"></td>
        </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblMST">Mã số thuế</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtMST" Width="80%"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblDoanhThu">Doanh thu</asp:Label>
                </td>
                <td >
                    <asp:TextBox class="input" runat="server" ID="txtDoanhThu" Width="80%"></asp:TextBox>
                </td>
            </tr>
         <tr><td><br /></td></tr>
            <tr>
                <td></td>
                <td  >
                    <asp:Label runat="server" ID="lblNam">Năm</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtNam" Width="80%"></asp:TextBox>
                </td>
                <td  >
                    <asp:Label runat="server" ID="lblMonBai">IDMonBai</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtMonBai" Width="80%"></asp:TextBox>
                </td>
            </tr>
         <tr><td><br /></td></tr>
            <tr>
                <td></td>
                <td  >
                    <asp:Label runat="server" ID="lblSodt">Số điện thoại</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtSodt" Width="80%"></asp:TextBox>
                </td>
                <td  >
                    <asp:Label runat="server" ID="lblEmail">Email</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtEmail" Width="80%"></asp:TextBox>
                </td>
            </tr>
         <tr><td><br /></td></tr>
            <tr>
                <td></td>
                <td  >
                    <asp:Label runat="server" ID="lblNote">Ghi chú</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtNote" Width="80%"></asp:TextBox>
                </td>
                <td  >
                    <asp:Label runat="server" ID="lblNgheKD">Nghề kinh doanh</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtNgheKD" Width="80%"></asp:TextBox>
                </td>
            </tr>
         <tr><td><br /></td></tr>
            <tr>
                <td></td>
                <td  >
                    <asp:Label runat="server" ID="lblDTKD">Diện tích KD</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtDTKD" Width="80%"></asp:TextBox>
                </td>
                <td  >
                    <asp:Label runat="server" ID="lblSoLuongLD">Số lượng LD</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtSoLuongLD" Width="80%"></asp:TextBox>
                </td>
            </tr>
         <tr><td><br /></td></tr>
            <tr>
                <td></td>
                <td  >
                    <asp:Label runat="server" ID="lblTuGio">Từ Giờ</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtTuGio" Width="80%"></asp:TextBox>
                </td>
                <td  >
                    <asp:Label runat="server" ID="lblDenGio">Đến Giờ</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtDenGio" Width="80%"></asp:TextBox>
                </td>
            </tr>
         <tr><td><br /></td></tr>
            <tr>
                <td></td>
                <td  >
                    <asp:Label runat="server" ID="lblDiaChiKD">Địa chỉ KD</asp:Label>
                </td>
                <td  >
                    <asp:TextBox class="input" runat="server" ID="txtDiaChiKD" Width="80%"></asp:TextBox>
                </td>
                <td  >
                    <asp:Label runat="server" ID="lblTrangThaiHoatDong">Trạng thái hoạt động</asp:Label>
                </td>
                <td  >
                    <asp:CheckBox class="input" runat="server" ID="chkTrangThaiHoatDong" Checked="true" Width="80%"></asp:CheckBox>
                </td>
            </tr>
           <tr><td><br /></td></tr>
        </table>
      <hr />
<table cellspacing="1" cellpadding="1" width="100%" border="0">
    <tr>
        <td colspan="3" align="center">
            <span class="btn1">
                <asp:LinkButton ID="btnReset" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R" OnClick="btnReset_Click"><span class="btnReset">Làm mới</span>
                </asp:LinkButton>
                <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClick="btnSave_Click"><span class="btnSave">Lưu</span>
                </asp:LinkButton>
            </span>
        </td>
    </tr>
</table>
      </form>
</asp:Content>
