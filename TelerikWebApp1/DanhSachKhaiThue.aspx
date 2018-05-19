<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="DanhSachKhaiThue.aspx.cs" Inherits="TelerikWebApp1.DanhSachKhaiThue" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1 style="font-size: 20px;">Danh Sách Khai Thuế</h1>
    <br />
    <form id="frm" runat="server">

        <table cellspacing="1" cellpadding="0" width="100%" border="0" runat="server">
            <tr align="center">
                <td width="20%"></td>
                <td width="10%"></td>
                <td width="50%" align="center"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblNam">Năm</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtNam" Width="40%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblMST">Mã số thuế</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtMST" Width="40%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblMaNganh">Mã ngành</asp:Label>
                </td>
                <td>
                    <telerik:RadComboBox class="input" runat="server" ID="cboMaNganh" Width="40%"></telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblSoGP">Số giấy phép</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtSoGP" Width="40%"></asp:TextBox>
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
                        <asp:LinkButton ID="btnAddNew" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R" OnClick="btnAddNew_Click">
		                    <span class="btnReset">Làm mới</span>
                        </asp:LinkButton>
                    </span>
                </td>
                <td id="tdKhoa" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnLock" name="btnLock" runat="server" AccessKey="L" ToolTip="Alt+L" OnClick="btnLock_Click">
		                    <span class="btnLock">Khóa</span>
                        </asp:LinkButton>
                    </span>
                </td>
                <td id="tdXuatDL" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnExport" name="btnExport" runat="server" AccessKey="E" ToolTip="Alt+E">
		                    <span class="btnExport">Export DL</span>
                        </asp:LinkButton>
                    </span>
                </td>
                <td id="tdThemDL" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnImport" name="btnImport" runat="server" AccessKey="E" ToolTip="Alt+E">
		                    <span class="btnImport">Import DL</span>
                        </asp:LinkButton>
                    </span>
                </td>

            </tr>

        </table>
        <table width="100%" cellpadding="1" cellspacing="1" border="0">
            <tr>
                <td>
                    <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
                    <telerik:RadSkinManager ID="RadSkinManager2" runat="server" ShowChooser="true" />
                    <telerik:RadSplitter ID="RadSplitter2" Width="100%" runat="server" Orientation="Horizontal">
                        <telerik:RadPane ID="RadPane1" Height="500px" Width="100%" runat="server" Scrolling="Both">
                            <telerik:RadGrid runat="server" ID="grid" CellPadding="1" CellSpacing="1" AllowPaging="true" AllowAutomaticUpdates="true" AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="false">
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="true" />
                                </ClientSettings>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true" />
                                <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" AllowMultiColumnSorting="true">
                                    <Columns>
                                        <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                                        </telerik:GridClientSelectColumn>
                                        <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="Sửa">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemTemplate>
                                                <asp:ImageButton CssClass="rgpointer" ID="Edit" runat="server"
                                                    ImageUrl="~/Images/edit.gif" CommandName="EDIT_DATA" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="TongDoanhThu" DataField="TongDoanhThu" HeaderText="Tổng Doanh thu">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="bac" DataField="bac" HeaderText="Bậc môn bài">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="diachiKD" DataField="diachiKD" HeaderText="Địa chỉ kinh doanh">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="sogp" DataField="sogp" HeaderText="Số giấy phép">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="tennganh" DataField="tennganh" HeaderText="Tên ngành">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn UniqueName="TrangThaiHoatDong" DataField="TrangThaiHoatDong" HeaderText="Trạng thái">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>

                        </telerik:RadPane>
                    </telerik:RadSplitter>
                </td>
            </tr>
        </table>

    </form>
</asp:Content>

