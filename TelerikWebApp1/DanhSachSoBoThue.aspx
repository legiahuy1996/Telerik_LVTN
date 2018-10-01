<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="DanhSachSoBoThue.aspx.cs" Inherits="TelerikWebApp1.DanhSachSoBoThue" EnableSessionState="True" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1>SỔ BỘ THUẾ</h1>
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
                    <asp:TextBox class="Input" runat="server" ID="txtMST" Width="80%"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label6">Tháng lập bộ</asp:Label>
                </td>
                <td width="40%">
                    <asp:TextBox class="Input" runat="server" ID="txtThangLapBo" Width="30px"></asp:TextBox>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <asp:Label runat="server" ID="Label2">Năm lập bộ</asp:Label>
                    <asp:TextBox class="Input" runat="server" ID="txtNamLapBo" Width="30px"></asp:TextBox>
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
                    <asp:Label runat="server" ID="lblDiaChi">Địa chỉ kinh doanh</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtDiaChi" Width="80%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td></td>
                 <td>
                    <asp:Label runat="server" ID="Label1">Loại thuế</asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList runat="server" ID="rblLoaiThue" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">Thuế GTGT</asp:ListItem>
                        <asp:ListItem Value="2">Thuế TNCN</asp:ListItem>
                        <asp:ListItem Value="3">Thuế môn bài</asp:ListItem>
                        <asp:ListItem Value="4" Selected="True">Tất cả</asp:ListItem>
                    </asp:RadioButtonList>
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
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnSearch" name="btnSearch" runat="server" AccessKey="F" ToolTip="Alt+F" OnClick="btnSearch_Click">
		                    <span class="btnSearch">Tìm kiếm</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnReset" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R"><span class="btnReset">Làm mới</span>
                        </asp:LinkButton>
                        <%--  <asp:LinkButton ID="btnCreate" name="btnCreate" runat="server" AccessKey="C" ToolTip="Alt+C" >
		                    <span class="btnCreate">Lập sổ bộ</span>
                        </asp:LinkButton>--%>
                        <asp:LinkButton ID="btnExport" name="btnExport" runat="server" AccessKey="E" ToolTip="Alt+E" OnClick="btnExport_Click">
		                    <span class="btnExport">Xuất DL</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnImport" name="btnImport" runat="server" AccessKey="E" ToolTip="Alt+E">
		                    <span class="btnImport">Import DL</span>
                        </asp:LinkButton>
                       
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
                                    AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="false"
                                    OnNeedDataSource="grid_NeedDataSource" OnItemCommand="grid_ItemCommand">
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

                                            <%--<telerik:GridTemplateColumn UniqueName="Edit" HeaderText="Sửa">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:ImageButton CssClass="rgpointer" ID="Edit" runat="server"
                                                        ImageUrl="~/Images/edit.gif" CommandName="EDIT_DATA" />
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>--%>
                                               <telerik:GridTemplateColumn SortExpression="Detail" UniqueName="Detail"
                                                HeaderText="Chi tiết">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkMST" CssClass="Hlink" runat="server"
                                                        CommandName="EDIT_DATA">Chi tiết</asp:LinkButton>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridBoundColumn UniqueName="idSoBoThue" DataField="idSoBoThue" HeaderText="idSoBoThue" >
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="idKhaiThue" DataField="idKhaiThue" HeaderText="idKhaiThue" Visible="true" Display="false">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"  Width="50px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Tên người nộp thuế">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="NgayLapBo" DataField="NgayLapHo" HeaderText="Ngày lập bộ" Visible="false">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="diachiKD" DataField="diachiKD" HeaderText="Địa chỉ kinh doanh">
                                                <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="150px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>

                                            <telerik:GridBoundColumn UniqueName="Thang" DataField="Thang" HeaderText="Tháng lập bộ">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="ThueGTGT" DataField="ThueGTGT" HeaderText="Thuế GTGT phải nộp 1 tháng" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="ThueTNCN" DataField="ThueTNCN" HeaderText="Thuế TNCN phải nộp 1 tháng" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="MucThue" DataField="MucThue" HeaderText="Thuế môn bài" DataFormatString="{0:N0}">
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
    <script>
        function validateDOB(obj) {
            //var dob = obj.value;
            //var pattern = /^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$/;
            //if (dob == null || dob == "" || !pattern.test(dob)) {
            //    alert("Invalid date of birth");
            //    return false;
            //}
            //else {
            //    return true
            //}
        }
        function ShowExcelSelectPage() {
            window.open("DanhSachSoBoThue_Import.aspx", 'SelectFile', 'status=1,toolbar=0,scrollbars=1,resizable=0,alwaysRaised=Yes, top=20, left=30, width=1200, height=600,1 ,align=center');
            return false;
        }
    </script>
</asp:Content>
