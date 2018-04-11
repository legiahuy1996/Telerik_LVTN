<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="DanhSachKhaiThue.aspx.cs" Inherits="TelerikWebApp1.DanhSachKhaiThue" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1 style="margin-left: 30%">Danh Sách Khai Thuế</h1>
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
                    <asp:Label runat="server" ID="lblNayCap">Ngày cấp CMND</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtNgayCapCMND" Width="80%"></asp:TextBox>
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
        <table width="100" cellpadding="0" cellspacing="0">
            <tr>
                <td id="tdTimKem" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnSearch" name="btnSearch" runat="server" AccessKey="F" ToolTip="Alt+F">
		                    <span class="btnSearch">Tìm kiếm</span>
                        </asp:LinkButton>
                    </span>
                </td>

                <td id="tdLamMoi" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnAddNew" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R">
		                    <span class="btnReset">Làm mới</span>
                        </asp:LinkButton>
                    </span>
                </td>

                <td id="tdTinhLai" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnReCalc" name="btnReCalc" runat="server" AccessKey="R" ToolTip="Alt+R">
		                    <span class="btnRecalc">Tính lại</span>
                        </asp:LinkButton>
                    </span>
                </td>

                <td id="tdTaoMoi" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnCreate" name="btnCreate" runat="server" AccessKey="C" ToolTip="Alt+C">
		                    <span class="btnCreate">Tạo mới</span>
                        </asp:LinkButton>
                    </span>
                </td>


                <td id="tdKhoa" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnLock" name="btnLock" runat="server" AccessKey="L" ToolTip="Alt+L">
		                    <span class="btnLock">Khóa</span>
                        </asp:LinkButton>
                    </span>
                </td>



                <td id="tdXuatDL" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnExport" name="btnExport" runat="server" AccessKey="E" ToolTip="Alt+E">
		                    <span class="btnExport">Xuất DL</span>
                        </asp:LinkButton>
                    </span>
                </td>


            </tr>

        </table>
         <table width="100" cellpadding="0" cellspacing="0">
                 <tr>
                <td>
                    <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
                    <telerik:RadSkinManager ID="RadSkinManager2" runat="server" ShowChooser="true" />
                    <telerik:RadSplitter ID="RadSplitter2" Width="650px" runat="server" Orientation="Horizontal">
                        <telerik:RadPane ID="RadPane1" Height="650px" Width="100%" runat="server" Scrolling="Both">
                            <telerik:RadGrid runat="server" Width="650px" ID="grid" CellPadding="1" CellSpacing="1" AllowPaging="true" AllowAutomaticUpdates="true" AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="true">
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

