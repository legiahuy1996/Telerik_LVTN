<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="InKeKhaiNopThue.aspx.cs" Inherits="TelerikWebApp1.InKeKhaiNopThue" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
<h1>In Kê Khai Nộp Thuế</h1>
    <br />
     <form id="frm" runat="server">
          <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server" height="100px">
            <tr>
                <td width="18%"></td>
                <td width="8%">
                     <h3><asp:Label runat="server" ID="lblThangNam">Tháng in bảng kê khai(MM/yy)</asp:Label></h3>
                </td>
                <td width="25%">
                     <asp:TextBox class="input" runat="server" ID="txtThangNam" Width="20%" MaxLength="7"></asp:TextBox>
                </td>
            </tr>
          </table>
         <hr />
 <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnExport" name="btnExport" runat="server" AccessKey="E" ToolTip="Alt+E" OnClick="btnExport_Click">
		                    <span class="btnExport">Xuất DL</span>
                        </asp:LinkButton>
                    </span>
                </td>
            </tr>
        </table>
         </form>
</asp:Content>