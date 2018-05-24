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
                <td style="width: 5%"></td>
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
                <td style="width: 5%"></td>
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
                <td style="width: 5%"></td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label5">Họ Tên</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtHoTen" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label6">Ngày tính thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtNgayTinhThue" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 5%"></td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label7">Mã ngành</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtMaNganh" Width="80%"></asp:TextBox>
                </td>
                <td width="15%">
                    <asp:Label runat="server" ID="Label8">Số điện thoại</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtSDT" Width="80%"></asp:TextBox>
                </td>
            </tr>


        </table>
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
                    </span>
                </td>
            </tr>
            <tr>
                <td width="100%">
                    <telerik:radscriptmanager runat="server" id="RadScriptManager2" />
                    <telerik:radskinmanager id="RadSkinManager2" runat="server" skin="Office2007"/>
                    <telerik:radsplitter id="RadSplitter2" width="100%" runat="server" orientation="Horizontal">
                        <telerik:RadPane ID="RadPane1" Height="500px" Width="90%" runat="server" Scrolling="Both">
                            <telerik:RadGrid runat="server" ID="grid" CellPadding="1" CellSpacing="1" AllowPaging="true" AllowAutomaticUpdates="true" AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="false"  >
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="true" />
                                </ClientSettings>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true" PageSizes="5,10,25,50,100,250" />
                                <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" AllowMultiColumnSorting="true">
                                    <Columns>
                                        <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                                        </telerik:GridClientSelectColumn>
                                        
                                        <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                              <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="Sửa">
                                        <HeaderStyle Width="50" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemTemplate>
                                            <asp:ImageButton CssClass="rgpointer" ID="Edit" runat="server" ImageUrl="~/Images/edit.gif" CommandName="EDIT_DATA" />
                                        </ItemTemplate>
                                     </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Họ tên" >
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                            <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn UniqueName="cmnd" DataField="cmnd" HeaderText="CMND">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                         <telerik:GridBoundColumn UniqueName="ngaysinh" DataField="ngaysinh" HeaderText="Ngày sinh" DataFormatString="{0:dd/MM/yyyy}">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="tencuahang" DataField="tencuahang" HeaderText="Tên cửa hàng" >
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="120px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                       
                                        <telerik:GridBoundColumn UniqueName="diachiKD" DataField="diachiKD" HeaderText="Địa chỉ kinh doanh">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="120px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="120px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="ngaybatdaukd" DataField="ngaybatdaukd" HeaderText="Ngày bắt đầu kinh doanh" DataFormatString="{0:dd/MM/yyyy}">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="sogp" DataField="sogp" HeaderText="Số giấy phép">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="tennganh" DataField="tennganh" HeaderText="Nhóm ngành">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                            <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" />
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

                        </telerik:RadPane>
                    </telerik:radsplitter>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
