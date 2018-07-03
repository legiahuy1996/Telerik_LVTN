<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachNoThue.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.DanhSachNoThue" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1>Danh Sách Hộ Nợ Thuế</h1>
    <br />
    <form id="frm" runat="server">
         <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server">
              <tr>
                <td></td>
                <td width="10%">
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblMaSoThue">Mã số thuế</asp:Label>
                </td>
                <td width="25%">
                   <asp:TextBox class="input" runat="server" ID="txtMST" Width="50%"></asp:TextBox>
                </td>
                <td width="25%">            
                </td>
            </tr>
        </table>
        <hr />
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnSearch" name="btnSearch" AccessKey="S" ToolTip="ALT+S" runat="server" OnClick="btnSearch_Click" ><span class="btnSearch">Tìm kiếm</span>
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
                                    AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="false" OnNeedDataSource="grid_NeedDataSource"
                                   >
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
                                            <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Họ tên">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="KyThue" DataField="KyThue" HeaderText="Kỳ thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>                                            
                                            <telerik:GridBoundColumn UniqueName="SoTien" DataField="SoTien" HeaderText="Số tiền còn nợ" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="tieumuc" DataField="tieumuc" HeaderText="Loại thuế còn nợ">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="100px"/>
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
