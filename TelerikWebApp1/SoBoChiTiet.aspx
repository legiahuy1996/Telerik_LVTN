<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SoBoChiTiet.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.SoBoChiTiet" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1>CHI TIẾT SỔ BỘ THUẾ</h1>
    <br />
    <form id="frm" runat="server">
        <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server">
            <tr>
                <td width="5%"></td>
                <td width="10%"></td>
                <td width="25%"></td>
                <td width="10%"></td>
                <td width="25%"></td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblThang">Tháng</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtThang" Width="10%" ReadOnly="true"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblNgayLapBo">Ngày lập bộ</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtNgayLapBo" Width="30%" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblDoanhThuGTGT">Doanh thu GTGT</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtGTGT" Width="40%" ReadOnly="true"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblDoanhthuTNCN">Doanh thu TNCN</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtTNCN" Width="40%" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblTyLeGTGT">Tỷ lệ GTGT</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtTyLeGTGT" Width="10%" ReadOnly="true"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblTyLeTNCN">Tỷ lệ TNCN</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtTyLeTNCN" Width="10%" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblSoTienGTGT">Số tiền GTGT</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtSoTienGTGT" Width="30%" ReadOnly="true"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblSoTienTNCN">Số tiền TNCN</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtSoTienTNCN" Width="30%" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblTrangThai">Trạng thái</asp:Label>
                </td>
                <td width="25%">
                    <asp:Label>Đã nộp</asp:Label>
                    <asp:RadioButton runat="server" ID="chkActive" GroupName="Status" Checked="true" />
                    <asp:Label>Chưa nộp thuế</asp:Label>
                    <asp:RadioButton runat="server" ID="chkNoActive" GroupName="Status" />
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label1">Mã Khai Thuế</asp:Label>
                </td>
                <td width="25%">  
                    <asp:TextBox class="input" runat="server" ID="txtIDKhaiThue" Width="30%" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
        </table>
          <hr />
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClick="btnSave_Click" ><span class="btnSave">L&#432;u</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnBack" name="btnBack" AccessKey="L" runat="server" ToolTip="ALT+L"
                            OnClientClick="DisableAllButton('_ctl0:btnList'); return true;" OnClick="btnBack_Click">
                    <span class="btnBack">V&#7873; DS YC</span>
                        </asp:LinkButton>


                    </span>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
