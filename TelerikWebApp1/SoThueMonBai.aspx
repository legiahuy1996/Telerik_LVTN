<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SoThueMonBai.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.SoThueMonBai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="content" runat="server">
    <h1>Sổ thuế môn bài</h1>
    <br />
    <form id="frm" runat="server">
        <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server" height="100px">
            <tr>
                <td width="18%"></td>
                <td width="8%">
                    <h3>
                        <asp:Label runat="server" ID="lblThangNam">Tháng in bảng kê khai(MM/yy)</asp:Label></h3>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtThangNam" onblur="return CheckMonthYear(this)" Width="20%" MaxLength="7"></asp:TextBox>
                </td>
            </tr>
        </table>
        <hr />
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnExport" name="btnExport" runat="server" AccessKey="E" ToolTip="Alt+E" OnClick="btnExport_Click"  >
		                    <span class="btnExport">Xuất DL</span>
                        </asp:LinkButton>
                    </span>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>