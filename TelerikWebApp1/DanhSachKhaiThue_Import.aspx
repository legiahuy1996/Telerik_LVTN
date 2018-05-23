<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhSachKhaiThue_Import.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.DanhSachKhaiThue_Import" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <form id="frm" runat="server" enctype="multipart/form-data">

        <table id="Table1" cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td width="30%"></td>
                <td width="10%"></td>
                <td width="60%"></td>
            </tr>
            <tr>
                <td colspan="3" height="20" align="center">
                    <asp:Label ID="lblTitle" runat="server" Style="font-weight: bold; font-size: 20px"
                        align="center">NHẬP DỮ LIỆU</asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:Label ID="lblErr" runat="server" Width="221px" Style="font-weight: bold; font-size: 15px" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <asp:TextBox ID="txtMAKHDBLD" runat="server" Style="display: none"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblSelectFile" runat="server" CssClass="LabelRequire"></asp:Label>
                </td>
                <td></td>
                <td align="left">
                    <asp:Label ID="lblWarning" runat="server" CssClass="LabelRequire" Text="Chỉ được chọn tối đa 1 file để xem dữ liệu"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 150px">
                    <div style="overflow: auto; width: 97%; height: 150px">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </td>
                <td style="height: 150px" valign="top" align="center">
                    <div>
                        <asp:LinkButton ID="btnSelect" name="btnSelect" AccessKey="A" ToolTip="ALT+A" runat="server" CssClass="btnSelectOther" OnClick="btnSelect_Click"
                            Text="Chọn">                                
                        </asp:LinkButton>
                    </div>
                </td>
                
            </tr>
            <tr>
                
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnReset" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R"><span class="btnReset">Làm m&#7899;i</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClientClick="return checkSave();"><span class="btnSave">L&#432;u</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnClose" name="btnClose" AccessKey="C" ToolTip="ALT+C" runat="server" CssClass="btnCloseOther" OnClick="btnClose_Click"
                            Text="Đóng">                            
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
                                <telerik:RadGrid runat="server" ID="grid" RenderMode="Lightweight" CellPadding="1" CellSpacing="1" AllowPaging="true" 
                                    AllowAutomaticUpdates="true"
                                    AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="true" OnNeedDataSource="grid_NeedDataSource">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>

                                    <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" PagerStyle-AlwaysVisible="true" PagerStyle-PageSizes="5,10,15" AllowMultiColumnSorting="true">
                                        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                        <Columns>
                                       <%--     <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                                                <HeaderStyle Width="50px" />
                                            </telerik:GridClientSelectColumn>
                                            <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="STT">
                                                <HeaderStyle Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="numberLabel" runat="server" />
                                                </ItemTemplate>

                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="Edit" HeaderText="Sửa">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:ImageButton CssClass="rgpointer" ID="Edit" runat="server"
                                                        ImageUrl="~/Images/edit.gif" CommandName="EDIT_DATA" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="idKhaiThue" DataField="idKhaiThue" Visible="true" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
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
                                            </telerik:GridBoundColumn>--%>
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
