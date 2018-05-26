﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NhapSoLieuThue.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.NhapSoLieuThue" %>

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
                        align="center">NHẬP DỮ LIỆU NỘP THUẾ</asp:Label>
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
                        <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClientClick="return checkSave();" OnClick="btnSave_Click"><span class="btnSave">L&#432;u</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnClose" name="btnClose" AccessKey="C" ToolTip="ALT+C" runat="server" CssClass="btnCloseOther" 
                            Text="Đóng">                            
                        </asp:LinkButton>
                       <asp:LinkButton ID="btnTemplate" name="btnTemplate" AccessKey="S" ToolTip="ALT+S" runat="server" CssClass="btnViewOther" OnClick="btnTemplate_Click"
                            Text="Xem file mẫu">
                        </asp:LinkButton>
                    </span>
                </td>
            </tr>
            <tr style="display:none">
                <asp:TextBox runat="server" ID="txtFilepath" Visible="false"></asp:TextBox>
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
                                    AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="true">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>

                                    <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" PagerStyle-AlwaysVisible="true" PagerStyle-PageSizes="5,10,15" AllowMultiColumnSorting="true">
                                        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                        <Columns>
                                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                                                <HeaderStyle />
                                            </telerik:GridClientSelectColumn>
                                           <%-- <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="STT">
                                                <HeaderStyle Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="numberLabel" runat="server" />
                                                </ItemTemplate>

                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="ngaykhaithue" DataField="ngaykhaithue" HeaderText="Ngày khai thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="DoanhThu" DataField="DoanhThu" HeaderText="Doanh thu">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="dientichKD" DataField="dientichKD" HeaderText="Diện tích kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="soluongLD" DataField="soluongLD" HeaderText="Số lượng lao động">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="manganh" DataField="manganh" HeaderText="Mã ngành">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="TuGio" DataField="TuGio" HeaderText="Từ giờ">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn UniqueName="DenGio" DataField="DenGio" HeaderText="Đến giờ">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                             <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="trangthai" DataField="trangthai" HeaderText="Trạng thái">
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