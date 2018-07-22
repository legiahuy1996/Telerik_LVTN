<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachNoQua90Ngay.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.DanhSachNoQua90Ngay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="content" runat="server">
    <h1>DANH SÁCH HỘ NỢ THUẾ QUÁ 90 NGÀY</h1>
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
        <table width="100%" cellpadding="0" cellspacing="0">
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

                                    <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" PagerStyle-AlwaysVisible="true" PagerStyle-PageSizes="10,50,100,200" AllowMultiColumnSorting="true">
                                        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                        <Columns>


                                            
                                            <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Tên người nộp thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                           <%-- <telerik:GridBoundColumn UniqueName="TongDoanhThu" DataField="TongDoanhThu" HeaderText="Doanh thu" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DienTichKD" DataField="DienTichKD" HeaderText="Diện tích kinh doanh (KM vuông)">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="SoLuongLD" DataField="SoLuongLD" HeaderText="Số lượng lao lượng">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>--%>
                                            <%--  <telerik:GridBoundColumn UniqueName="TuGio" DataField="TuGio" HeaderText="Từ giờ">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="DenGio" DataField="DenGio" HeaderText="Đến giờ">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>--%>
                                            <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
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
