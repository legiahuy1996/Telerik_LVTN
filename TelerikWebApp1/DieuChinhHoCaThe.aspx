<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="DieuChinhHoCaThe.aspx.cs" Inherits="TelerikWebApp1.DieuChinhHoCaThe" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="DanhSachHoCaThe" ContentPlaceHolderID="content" runat="server">
    <h1 style="margin-left: 30%">Điều chỉnh hộ cá thể</h1>
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
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnSearch" name="btnSearch" runat="server">
			            <span class="btnSearch" >Tìm kiếm</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnDetail" OnClick="btnDetail_Click" name="btnDetail" runat="server">
                        
			            <span class="btnDetail">Điều chỉnh</span>
                        </asp:LinkButton>

                    </span>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
                    <telerik:RadSkinManager ID="RadSkinManager2" runat="server" ShowChooser="true" />
                    <telerik:RadSplitter ID="RadSplitter2" Width="650px" runat="server" Orientation="Horizontal">
                        <telerik:RadPane ID="RadPane1" Height="500px" Width="100%" runat="server" Scrolling="Both">
                            <telerik:RadGrid runat="server" ID="grid" CellPadding="1" CellSpacing="1" AllowPaging="true" AllowAutomaticUpdates="true" AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="true">
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="true" />
                                </ClientSettings>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true" />
                                <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" AllowMultiColumnSorting="true">
                                    <Columns>
                                        <telerik:GridTemplateColumn UniqueName="CheckBoxTemplateColumn">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="ToggleRowSelection"
                                                    AutoPostBack="True" />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="headerChkbox" runat="server" OnCheckedChanged="ToggleSelectedState"
                                                    AutoPostBack="True" />
                                            </HeaderTemplate>
                                        </telerik:GridTemplateColumn>
                                    </Columns>
                                    <%--                            <Columns>
                                    <telerik:GridBoundColumn SortExpression="EmpID" UniqueName="EmpID" DataField="EmpID"
                                    HeaderText="EmpID">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80%" />
                                </telerik:GridBoundColumn>
                            </Columns>--%>
                                </MasterTableView>
                            </telerik:RadGrid>

                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
