<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoiMatKhau.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.DoiMatKhau" %>

<asp:Content ID="DoiMatKhau" ContentPlaceHolderID="content" runat="server">
    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
    </head>
    <body>
        <form id="form1" runat="server">
            <h1 style="font-size: 20px;">Đổi mật khẩu</h1>
            <br />
            <table cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
                <tr align="center">
                    <td width="30%"></td>
                    <td width="10%"></td>
                    <td width="50%" align="center"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="lblNam">Mật khẩu cũ</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="Input" TextMode="Password" runat="server" ID="txtOldPass" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="Label1">Mật khẩu mới</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="Input" TextMode="Password" runat="server" ID="txtNewPass" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label runat="server" ID="Label2">Xác nhận mật khẩu mới</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox class="Input" TextMode="Password" runat="server" ID="txtNewPassAgain" Width="150px" ></asp:TextBox>
                    </td>
                </tr>
            </table>
            <hr />
            <table width="100" cellpadding="0" cellspacing="0">
                <tr>
                    <td id="tdLamMoi" runat="server">
                        <span class="btn1">
                            <asp:LinkButton ID="btnAddNew" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R">
		                    <span class="btnReset">Làm mới</span>
                            </asp:LinkButton>
                        </span>
                    </td>
                    <td id="td1" runat="server">
                        <span class="btn1">
                            <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClientClick="return checkSave();" OnClick="btnSave_Click"><span class="btnSave">L&#432;u</span>
                            </asp:LinkButton>
                        </span>
                    </td>

                </tr>
            </table>
        </form>
    </body>
    </html>
</asp:Content>
