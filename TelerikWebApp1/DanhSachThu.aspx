<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachThu.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.DanhSachThu" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1>Sổ Thu</h1>
    <br />
    <form id="frm" runat="server">
        <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server">
            <tr>
                <td></td>
                <td width="10%"></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblMaSoThue">Mã số thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtMST" Width="50%"></asp:TextBox>
                </td>
                <td width="25%"></td>
            </tr>
            <tr>
                <td></td>
                <td width="10%"></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblThangNam">Tháng in bảng kê khai(MM/yy)</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtThangNam" onblur="return CheckMonthYear(this)" Width="20%" MaxLength="7"></asp:TextBox>
                </td>
                <td width="25%"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>

                <td colspan="3">
                    <asp:RadioButtonList runat="server" ID="rblLoaiThue" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1701">Thuế GTGT</asp:ListItem>
                        <asp:ListItem Value="1003">Thuế TNCN</asp:ListItem>
                        <asp:ListItem Value="0000">Thuế môn bài</asp:ListItem>
                        <asp:ListItem Value="" Selected="True">Tất cả</asp:ListItem>
                    </asp:RadioButtonList>
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
                        <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClick="btnSave_Click" OnClientClick="return checkSave();"><span class="btnSave">L&#432;u</span>
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
                                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                                                <HeaderStyle Width="50px" />
                                            </telerik:GridClientSelectColumn>
                                            <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Họ tên">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="SoTienNop" DataField="SoTienNop" HeaderText="Số tiền nộp">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtSoTienNop" CssClass="Input" onblur="javascript:checkNumeric(this);" Text='<%# Bind("SoTienNop", "{0:N0}") %>' Width="80px"></asp:TextBox>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="KyThue" DataField="KyThue" HeaderText="Kỳ thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="NgayNop" DataField="NgayNop" HeaderText="Ngày nộp">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="tieumuc" DataField="tieumuc" HeaderText="Loại thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn UniqueName="id" DataField="id" Visible="true" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
