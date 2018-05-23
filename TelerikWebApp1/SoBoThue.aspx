<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="SoBoThue.aspx.cs" Inherits="TelerikWebApp1.SoBoThue" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1>LẬP SỔ BỘ THUẾ</h1>
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
                    <asp:TextBox class="input" runat="server" ID="txtMST" Width="80%"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblTenCuaHang">Tên cửa hàng</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtTenCuaHang" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblCMND">CMND</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtCMND" Width="80%"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblNayCap">Ngày cấp CMND</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtNgayCapCMND" Width="80%" onblur="return validateDOB(this);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblSoGP">Số giấy phép</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtSoGP" Width="80%"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblDiaChi">Địa chỉ kinh doanh</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtDiaChi" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label5">Họ Tên</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtHoTen" Width="80%"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label6">Ngày tính thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtNgayTinhThue" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label7">Ngành</asp:Label>
                </td>
                <td width="25%">
                    <telerik:RadComboBox class="input" ID="cboMaNganh" Width="80%" runat="server"></telerik:RadComboBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label8">Số điện thoại</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="input" runat="server" ID="txtSDT" Width="80%"></asp:TextBox>
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
                        <asp:LinkButton ID="btnReset" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R" OnClick="btnReset_Click" ><span class="btnReset">Làm mới</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnCreate" name="btnCreate" runat="server" AccessKey="C" ToolTip="Alt+C" OnClick="btnCreate_Click">
		                    <span class="btnCreate">Lập sổ bộ</span>
                        </asp:LinkButton>
                      <%--  <asp:LinkButton ID="btnExport" name="btnExport" runat="server" AccessKey="E" ToolTip="Alt+E">
		                    <span class="btnExport">Xuất DL</span>
                        </asp:LinkButton>--%>
                    </span>
                </td>
            </tr>
        </table>
        <br />
       
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
                    <telerik:RadSkinManager ID="RadSkinManager2" runat="server" />
                    <telerik:RadSplitter ID="RadSplitter2" Width="100%" runat="server" Orientation="Horizontal">
                        <telerik:RadPane ID="RadPane1" Height="500px" Width="100%" runat="server" Scrolling="Both">
                            <telerik:RadGrid runat="server"  AllowMultiRowSelection="true" Width="650px" Height="500px" ID="grid" CellPadding="1" CellSpacing="1" AllowPaging="true" AllowAutomaticUpdates="true" AllowSorting="true" AutoGenerateColumns="false">
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="true" />
                                </ClientSettings>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true" />
                                <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" AllowMultiColumnSorting="true">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                         <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                </telerik:GridClientSelectColumn>
                                      
                                        <telerik:GridBoundColumn UniqueName="idKhaiThue" DataField="idKhaiThue" HeaderText="idKhaiThue" Visible="true">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>                                       
                                        <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Tên người nộp thuế">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="TongDoanhThu" DataField="TongDoanhThu" HeaderText="Doanh thu">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                             <%--           <telerik:GridBoundColumn UniqueName="sodt" DataField="sodt" HeaderText="Số điện thoại">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="email" DataField="email" HeaderText="Email">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="ghichu" DataField="ghichu" HeaderText="Ghi chú">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>                                   --%>     
                                        <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Nghề kinh doanh">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="DienTichKD" DataField="DienTichKD" HeaderText="Diện tích kinh doanh">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="SoLuongLD" DataField="SoLuongLD" HeaderText="Số lượng lao lượng">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                      <%--  <telerik:GridBoundColumn UniqueName="TuGio" DataField="TuGio" HeaderText="Từ giờ">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="DenGio" DataField="DenGio" HeaderText="Đến giờ">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn UniqueName="diachiKD" DataField="diachiKD" HeaderText="Địa chỉ kinh doanh">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="TrangThaiHoatDong" DataField="TrangThaiHoatDong" HeaderText="Trạng thái">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="DoanhThuTinhThueGTGT" DataField="DoanhThuTinhThueGTGT" HeaderText="Doanh thu tính thuế GTGT">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="DoanhThuTinhThueTNCN" DataField="DoanhThuTinhThueTNCN" HeaderText="Doanh thu tính thuế TNCN">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="TyLeTinhThueGTGT" DataField="TyLeTinhThueGTGT" HeaderText="Tỷ lệ tính thuế GTGT">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="TyLeTinhThueTNCN" DataField="TyLeTinhThueTNCN" HeaderText="Tỷ lệ tính thuế TNCN">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
    </script>
</asp:Content>
