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
         <table width="100%" cellpadding="1" cellspacing="1" border="0">
            <tr>
                <td>
                    <hr />
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
                                            <telerik:GridBoundColumn UniqueName="Thang" DataField="Thang" HeaderText="Tháng">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="SoTienPhaiDong" DataField="SoTienPhaiDong" HeaderText="Số tiền phải đóng">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>                                            
                                            <telerik:GridBoundColumn UniqueName="SoTienDaNop" DataField="SoTienDaNop" HeaderText="Số tiền đã nộp">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="SoTienConNo" DataField="SoTienConNo" HeaderText="Số tiền còn nợ">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="100px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="TinhTrang" DataField="TinhTrang" HeaderText="Tình trạng">
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
