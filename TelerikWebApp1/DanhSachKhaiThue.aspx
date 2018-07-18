<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="DanhSachKhaiThue.aspx.cs" Inherits="TelerikWebApp1.DanhSachKhaiThue" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1 style="font-size: 20px;">Danh Sách Khai Thuế</h1>
    <br />
    <form id="frm" runat="server">

        <table cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
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
                    <asp:TextBox class="InputCenter" runat="server" ID="txtNam" Width="50px" onblur="javascript:CheckYear1900(this);"></asp:TextBox>
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
                    <asp:TextBox class="Input1" runat="server" ID="txtMST" Width="80px" onblur="javascript:checkNumber(this);"></asp:TextBox>
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
                    <asp:TextBox class="Input1" runat="server" ID="txtSoGP" Width="80px"></asp:TextBox>
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
                    <asp:Label runat="server">Trạng thái</asp:Label></td>
                <td colspan="3">
                    <table cellspacing="0" cellpadding="1" width="100%" border="0">
                        <tr>
                            <td style="display: inline-block">
                                <asp:RadioButtonList runat="server" ID="rdbTinhTrang" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0">Tạm ngưng nghỉ</asp:ListItem>
                                    <asp:ListItem Value="1">Đang hoạt động</asp:ListItem>
                                    <asp:ListItem Value="2" Selected="True">Tất cả</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>

                    </table>
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
                <td id="tdSaoChep" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnCopy" name="btnCopy" AccessKey="S" OnClick="btnCopy_Click"
                            runat="server" ToolTip="ALT+S">
                    <span class="btnCopy">Sao chép</span>
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
                <td runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnUnLock" name="btnUnLock" AccessKey="U"
                            runat="server" ToolTip="ALT+U" OnClick="btnUnLock_Click" OnClientClick="return CheckUnLock()">
                    <span class="btnUnLock">Mở Khóa</span>
                        </asp:LinkButton>
                    </span>
                </td>
                <td id="tdXuatDL" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnExport" name="btnExport" runat="server" AccessKey="E" ToolTip="Alt+E" OnClick="btnExport_Click">
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
            <%--    <td id="tdLapSoBo" runat="server">
                    <span class="btn1">
                        <asp:LinkButton ID="btnCreate" name="btnCreate" runat="server" AccessKey="C" ToolTip="Alt+C" OnClick="">
		                    <span class="btnCreate">Lập sổ bộ</span>
                        </asp:LinkButton>

                    </span>
                </td>--%>


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
                                    OnNeedDataSource="grid_NeedDataSource" OnItemCommand="grid_ItemCommand" OnItemDataBound="grid_ItemDataBound">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                    </ClientSettings>

                                    <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" PagerStyle-AlwaysVisible="true" PagerStyle-PageSizes="10,50,100,200" AllowMultiColumnSorting="true">
                                        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                        <Columns>
                                            <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
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
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Họ tên">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="TongDoanhThu" DataField="TongDoanhThu" HeaderText="Tổng Doanh thu" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="bac" DataField="bac" HeaderText="Bậc môn bài">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="lankhaithue" DataField="lankhaithue" HeaderText="Lần khai thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="diachiKD" DataField="diachiKD" HeaderText="Địa chỉ kinh doanh">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="sogp" DataField="sogp" HeaderText="Số giấy phép">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="tennganh" DataField="tennganh" HeaderText="Tên ngành">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="TrangThaiHoatDong" DataField="TrangThaiHoatDong" HeaderText="Trạng thái">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="ThueGTGT" DataField="ThueGTGT" HeaderText="Tiền thuế GTGT phải đóng 1 tháng" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="ThueTNCN" DataField="ThueTNCN" HeaderText="Tiền thuế TNCN phải đóng 1 tháng" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="MucThue" DataField="MucThue" HeaderText="Tiền thuế môn bài" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="mattngungnghi" DataField="mattngungnghi" HeaderText="mattngungnghi" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridTemplateColumn UniqueName="tungay" DataField="tungay" HeaderText="Từ ngày">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txttungay" CssClass="Input" onblur="javascript:CheckDate(this);" Text='<%# Eval("tungay") %>' Width="80px"></asp:TextBox>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="denngay" DataField="denngay" HeaderText="Đến ngày">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtdenngay" CssClass="Input" onblur="javascript:CheckDate(this);" Text='<%# Eval("denngay") %>' Width="80px"></asp:TextBox>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="ngaynopdon" DataField="ngaynopdon" HeaderText="Ngày nộp đơn">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtNgayNopDon" CssClass="Input" onblur="javascript:CheckDate(this);" Text='<%# Eval("ngaynopdon") %>' Width="80px"></asp:TextBox>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn UniqueName="LyDo" DataField="LyDo" HeaderText="Lý do">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="txtLyDo" CssClass="Input" Text='<%# Eval("LyDo") %>' Width="80px" TextMode="MultiLine"></asp:TextBox>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
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
<asp:Content ContentPlaceHolderID="script" ID="script" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindPicker);
            bindPicker();
        });
        function bindPicker() {
            $("input[type=text][id*=txttungay]").datepicker();
            $("input[type=text][id*=txtdenngay]").datepicker();
            $("input[type=text][id*=txtNgayNopDon]").datepicker();
        }
    </script>
    <script> 

        function ShowExcelSelectPage() {
            window.open("DanhSachKhaiThue_Import.aspx", 'SelectFile', 'status=1,toolbar=0,scrollbars=1,resizable=0,alwaysRaised=Yes, top=20, left=30, width=1200, height=600,1 ,align=center');
            return false;
        }
    </script>
</asp:Content>
