<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChamBoThue.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.ChamBoThue" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1 style="font-size: 20px;">Chấm bộ thuế</h1>
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
                    <asp:Label runat="server" ID="lblMST">Mã số thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtMST" Width="80px"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label2">Năm lập bộ</asp:Label>
                </td>
                <td width="40%">
                    <asp:TextBox class="Input" runat="server" ID="txtNamLapBo" Width="50px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblCMND">Tháng kinh doanh </asp:Label>
                </td>
                <td width="30%">
                    <asp:TextBox class="Input" runat="server" ID="txtThang" Width="50px" onblur="return validateDOB(this);"></asp:TextBox>
                </td>

                <td width="10%">
                    <asp:Label runat="server" ID="lblDiaChi">Địa chỉ kinh doanh</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtDiaChi" Width="80%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label5">Họ Tên</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtHoTen" Width="80%"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblNgheKinhDoanh">Nghề kinh doanh</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtNgheKinhDoanh" Width="80%"></asp:TextBox>
                </td>
            </tr>


        </table>

        <hr />
        <table width="100" cellpadding="0" cellspacing="0">
            <tr>
                <td id="tdTimKem" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnSearch" name="btnSearch" runat="server" AccessKey="F" ToolTip="Alt+F" OnClick="btnSearch_Click">
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
                <td id="tdChamSoBo" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnCreate" name="btnCreate" runat="server" AccessKey="C" ToolTip="Alt+C" OnClick="btnCreate_Click">
		                    <span class="btnCreate">Chấm sổ bộ</span>
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
                                    AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="false"
                                    OnNeedDataSource="grid_NeedDataSource">
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
                                           <telerik:GridBoundColumn UniqueName="STT" DataField="STT" HeaderText="STT" >
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="50px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="idSoBoThue" DataField="idSoBoThue" Visible="true" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Họ tên">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="Thang" DataField="Thang" HeaderText="Tháng">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="50px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="50px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="diachiKD" DataField="diachiKD" HeaderText="Địa chỉ kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="DoanhThu" DataField="DoanhThu" HeaderText="Doanh Thu" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"  />
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
