<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="DanhSachHoCaThe.aspx.cs" Inherits="TelerikWebApp1.DanhSachHoCaThe" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="DanhSachHoCaThe" ContentPlaceHolderID="content" runat="server">
    <h1>Danh sách hộ cá thể</h1>
    <br />

    <form id="frm" runat="server">

        <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server">
            <tr>
                <td style="width: 5%"></td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblMST">Mã số thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtMST" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblTenCuaHang">Tên cửa hàng</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtTenCuaHang" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 5%"></td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblCMND">CMND</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtCMND" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblNayCap">Ngày cấp</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtNgayCap" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 5%"></td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblSoGP">Số giấy phép</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtSoGP" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="lblDiaChi">Địa chỉ</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtDiaChi" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 5%"></td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label5">Họ Tên</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtHoTen" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label6">Ngày tính thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtNgayTinhThue" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 5%"></td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label8">Số điện thoại</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtSDT" Width="80%"></asp:TextBox>
                </td>
            </tr>


        </table>
        <hr />
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">

                    <span class="btn1">
                        <asp:LinkButton ID="btnAddNew" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R" OnClick="btnAddNew_Click">
		                    <span class="btnReset">Làm mới</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnSearch" name="btnSearch" runat="server" OnClick="btnSearch_Click">
			            <span class="btnSearch" >Tìm kiếm</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnExportGrid" name="btnExportGrid" runat="server" OnClick="btnExportGrid_Click">
			            <span class="btnExport">Xuất DL</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnImport" name="btnImport" runat="server">
			            <span class="btnImport">Nhập DL</span>
                        </asp:LinkButton>
                    </span>
                    <hr />
                </td>

            </tr>
            <tr>
                <td width="100%">
                    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                    <telerik:RadSkinManager ID="RadSkinManager2" runat="server" Skin="Office2007" />
                    <telerik:RadSplitter ID="RadSplitter2" Height="500px" Width="100%" runat="server" Orientation="Horizontal">
                        <telerik:RadPane ID="RadPane1" Height="500px" Width="100%" runat="server" Scrolling="none">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="500px">
                                <telerik:RadGrid runat="server" ID="grid" CellPadding="1" Height="500px"
                                    OnNeedDataSource="grid_NeedDataSource" OnItemCommand="grid_ItemCommand"
                                    CellSpacing="1" AllowPaging="true" AllowAutomaticUpdates="true" AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="false">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>
                                    <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true" PageSizes="5,10,25,50,100,250" />
                                    <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" AllowMultiColumnSorting="true">
                                        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                        <Columns>
                                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" >
                                                <HeaderStyle  Width="50px"/>
                                            </telerik:GridClientSelectColumn>
                                            <telerik:GridTemplateColumn SortExpression="Detail" UniqueName="Detail"
                                                HeaderText="Chi tiết">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkMST" CssClass="Hlink" runat="server"
                                                        CommandName="LINKMST">Chi tiết</asp:LinkButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn SortExpression="Detail" UniqueName="Detail"
                                                HeaderText="Khai thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LNKKT" CssClass="Hlink" runat="server"
                                                        CommandName="LINKKT">>></asp:LinkButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Họ tên">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                                <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="cmnd" DataField="cmnd" HeaderText="CMND">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="ngaysinh" DataField="ngaysinh" HeaderText="Ngày sinh" DataFormatString="{0:dd/MM/yyyy}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="tencuahang" DataField="tencuahang" HeaderText="Tên cửa hàng">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="diachiKD" DataField="diachiKD" HeaderText="Địa chỉ kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="ngaybatdaukd" DataField="ngaybatdaukd" HeaderText="Ngày bắt đầu kinh doanh" DataFormatString="{0:dd/MM/yyyy}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="sogp" DataField="sogp" HeaderText="Số giấy phép">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                           



                                        </Columns>
                                        <%--                            <Columns>
                                    <telerik:GridBoundColumn SortExpression="EmpID" UniqueName="EmpID" DataField="EmpID"
                                    HeaderText="EmpID">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80%" />
                                </telerik:GridBoundColumn>
                            </Columns>--%>
                                    </MasterTableView>
                                </telerik:RadGrid>
                            </telerik:RadAjaxPanel>
                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
<asp:Content ContentPlaceHolderID="script" ID="script" runat="server">
    <script> 

        function ShowExcelSelectPage() {
            window.open("DanhSachHoCaThe_Import.aspx", 'SelectFile', 'status=1,toolbar=0,scrollbars=1,resizable=0,alwaysRaised=Yes, top=20, left=30, width=1200, height=600,1 ,align=center');
            return false;
        }
    </script>
</asp:Content>