<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DanhSachTongSoTienPhaiThu.aspx.cs" Inherits="TelerikWebApp1.DanhSachTongSoTienPhaiThu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" runat="server">
    <h1>Sổ thuế</h1>
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
                        <asp:LinkButton ID="btnSearch" name="btnSearch" AccessKey="S" ToolTip="ALT+S" runat="server" OnClick="btnSearch_Click"><span class="btnSearch">Tìm kiếm</span>
                        </asp:LinkButton>
                    </span>
                    <span class="btn1">
                        <asp:LinkButton ID="btnExport" name="btnExport" runat="server" AccessKey="E" ToolTip="Alt+E" OnClick="btnExport_Click">
		                    <span class="btnExport">Xuất DL</span>
                        </asp:LinkButton>
                    </span>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%" cellpadding="1" cellspacing="1" border="0">
            <tr>
                <td>
                    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                    <telerik:RadSkinManager ID="RadSkinManager2" runat="server" Skin="Office2007" />
                    <telerik:RadSplitter ID="RadSplitter2" Width="100%" runat="server" Orientation="Horizontal">
                        <telerik:RadPane ID="RadPane1" Height="500px" Width="100%" runat="server" Scrolling="Both">
                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
                                <telerik:RadGrid runat="server" ID="grid" RenderMode="Lightweight" CellPadding="1" CellSpacing="1" AllowPaging="true" AllowAutomaticUpdates="true"
                                    AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="false" OnNeedDataSource="grid_NeedDataSource">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>

                                    <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" PagerStyle-AlwaysVisible="true" PagerStyle-PageSizes="5,10,15" AllowMultiColumnSorting="true">
                                        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="Thang" DataField="Thang" HeaderText="Tháng">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="TongDoanhThu" DataField="TongDoanhThu" HeaderText="Tổng doanh thu" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="SoTienGTGT1Thang" DataField="SoTienGTGT1Thang" HeaderText="Số tiền GTGT 1 tháng" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="SoTienTNCN1Thang" DataField="SoTienTNCN1Thang" HeaderText="Số tiền TNCN 1 tháng" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                        </Columns>
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
