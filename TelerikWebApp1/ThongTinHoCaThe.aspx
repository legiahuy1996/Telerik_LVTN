<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="ThongTinHoCaThe.aspx.cs" Inherits="TelerikWebApp1.ThemMoiHoCaThe" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1>Thông tin hộ cá thể</h1>
    <br />
    <form id="frm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table cellspacing="1" cellpadding="1" width="100%" border="0" runat="server">

            <tr>
                <td style="width: 5%"></td>
                <td style="width: 15%"></td>
                <td style="width: 30%"></td>
                <td style="width: 20%"></td>
                <td style="width: 30%"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server">Ngày cấp MST</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" ID="txtNgayCapMST" runat="server" MaxLength="15" Width="80px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblMST">Mã số thuế</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="Input" ID="txtMST" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
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
                    <asp:Label runat="server">Họ tên</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" ID="txtHoTen" runat="server" Width="80%"></asp:TextBox>
                </td>

                <td>
                    <asp:Label runat="server" ID="lblCMND">CMND</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="Input" ID="txtCMND" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
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
                    <asp:Label runat="server">Ngày sinh</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" ID="txtNgaySinh" runat="server" MaxLength="15" Width="80px"></asp:TextBox>
                </td>
                <td>

                    <asp:Label runat="server">Tên cửa hàng</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="Input" ID="txtTenCuaHang" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
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
                    <asp:Label runat="server">Địa chỉ</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" ID="txtDiaChi" runat="server" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
                <td>

                    <asp:Label runat="server">Ngày cấp CMND</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="Input" ID="txtNgayCapCMND" runat="server" Width="80px"></asp:TextBox>
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
                    <asp:Label runat="server" CssClass="labelRequire">Mã đường phố</asp:Label></td>
                <td>
                    <telerik:RadComboBox class="Input" ID="cboMaDuongPho" Width="80%" runat="server" Skin="Office2007"></telerik:RadComboBox>
                </td>
                <td>

                    <asp:Label runat="server">Năm</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="Input" runat="server" MaxLength="14" Width="50px" ID="txtNam"></asp:TextBox>
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
                    <asp:Label runat="server">Nghề kinh doanh</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" runat="server"  Width="80%" ID="txtNghekinhDoanh"></asp:TextBox>
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
                    <asp:Label runat="server">Vốn kinh doanh</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" runat="server" Width="80%" ID="txtVonKD"></asp:TextBox></td>
                <td>

                    <asp:Label runat="server">Ngày bắt đầu kinh doanh</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="Input" runat="server"  Width="80px" ID="txtNgayBatDauKD"></asp:TextBox>
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
                    <asp:Label runat="server">Ngày tính thuế</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" runat="server" ID="txtNgayTinhThue" MaxLength="15" Width="80px"></asp:TextBox></td>
                <td>

                    <asp:Label runat="server">Số giấy phép</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="Input" runat="server"  Width="80%" ID="txtSoGP"></asp:TextBox>
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
                    <asp:Label runat="server">Số điện thoại</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" runat="server"  Width="80%" ID="txtSoDT"></asp:TextBox></td>
                <td>

                    <asp:Label runat="server">Email</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="Input" runat="server" Width="80%" ID="txtEmail"></asp:TextBox>
                    <%--<asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ"></asp:RegularExpressionValidator>--%>
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
                    <asp:Label runat="server">Ghi chú</asp:Label></td>
                <td>
                    <asp:TextBox class="Input" runat="server"  Width="80%" TextMode="MultiLine" ID="txtGhiChu"></asp:TextBox></td>

            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td></td>

            </tr>
        </table>
        <hr />
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnReset" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R" OnClick="btnReset_Click"><span class="btnReset">Làm mới</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClick="btnSave_Click" OnClientClick="return validateform();"><span class="btnSave">Lưu</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnBack" name="btnBack" AccessKey="L" runat="server" ToolTip="ALT+L"
                            OnClientClick="DisableAllButton('_ctl0:btnList'); return true;" OnClick="btnBack_Click">
                    <span class="btnBack">V&#7873; danh sách</span>
                        </asp:LinkButton>

                    </span>
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
<asp:Content ContentPlaceHolderID="script" ID="script" runat="server">
    <script>
        $("#<%=txtNgayCapCMND.ClientID%>").datepicker();
        $("#<%=txtNgayCapMST.ClientID%>").datepicker();
        $("#<%=txtNgaySinh.ClientID%>").datepicker();
        $("#<%=txtNgayTinhThue.ClientID%>").datepicker();
        $("#<%=txtNgayBatDauKD.ClientID%>").datepicker();
        $('#<%=lblMST.ClientID%>').attr('class', 'labelRequire');
        $('#<%=lblCMND.ClientID%>').attr('class', 'labelRequire');
        //function validateEmail(email) {
        //    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        //    return re.test(String(email).toLowerCase());
        //}
        function validateform() {
            if (CheckIsNull('txtMST') == false) return false;
            if (CheckIsNull('txtCMND') == false) return false;
             if (CheckIsNull_RCB('cboMaDuongPho') == false) return false;
        }
        //function checkSave() {
        //    if (CheckIsNull('txtMST') == false) return false;
        //    if (CheckIsNull('txtNam') == false) return false;
        //}
    </script>
</asp:Content>


