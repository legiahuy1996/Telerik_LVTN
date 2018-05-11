<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="KhaiThueChiTiet.aspx.cs" Inherits="TelerikWebApp1.KhaiThueChiTiet" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1>Khai thu&#7871; chi ti&#7871;t</h1>
    <br />
    <form id="frm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <table cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">

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
                    <asp:Label runat="server" CssClass="labelRequire" ID="lblMST">Mã s&#7889; thu&#7871;</asp:Label>

                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtMST" Width="50%"></asp:TextBox>
                    <span class="btn1">
                        <asp:LinkButton runat="server" ID="btnLayTuDanhBa" name="btnLayTuDanhBa" Width="30%" OnClick="btnLayTuDanhBa_Click"><span class="btnAdd" >L&#7845;y t&#7915; danh b&#7841;</span></asp:LinkButton>
                    </span>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblNam">N&#259;m</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtNam" Width="50px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblNgayKhaiThue">Ngày khai thu&#7871;</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtMgayKhaiThue" Width="90px"></asp:TextBox>
                </td>
                   <td>
                    <asp:Label runat="server" ID="Label8">Lần khai thuế</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtLan" Width="80%"></asp:TextBox>
                </td>

            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblTuGio">Th&#7901;i gian kinh doanh</asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="Label1">T&#7915; Gi&#7901;</asp:Label>
                    <asp:TextBox class="input" runat="server" ID="txtTuGio" Width="50px"></asp:TextBox>
                    <asp:Label runat="server" ID="Label2">&#272;&#7871;n Gi&#7901;</asp:Label>
                    <asp:TextBox class="input" runat="server" ID="txtDenGio" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblEmail">Email</asp:Label>
                </td>
                <td>
                    <br />
                    <asp:TextBox ID="txtEmail" runat="server" class="input" onblur="return validateEmail<asp:RegularExpressionValidator runat=" RegularExpressionValidator="" server="" Width="80%"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                        ErrorMessage="Email không h&#7907;p l&#7879;" ControlToValidate="txtEmail" ForeColor="Red"
                        SetFocusOnError="True"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>


                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblSodt">S&#7889; &#273;i&#7879;n tho&#7841;i</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtSodt" Width="80%"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblNote">Ghi chú</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtNote" Width="80%" TextMode="MultiLine"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>
                </td>
                 <td>
                    <asp:Label runat="server" ID="lblDiaChiKD">&#272;&#7883;a ch&#7881; KD</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtDiaChiKD" Width="80%"></asp:TextBox>
                </td>
                  <td>
                    <asp:Label runat="server" ID="Label9">Ngày khai thuế</asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtNgayKhai" Width="90px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">

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
                    <asp:Label runat="server" ID="Label3" Font-Bold="true" Font-Underline="true">N&#7897;i dung khai thu&#7871;</asp:Label>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label runat="server" ID="lblMaNganh">Ngành</asp:Label>
                </td>
                <td>

                    <telerik:RadComboBox class="input" ID="cboMaNganh" Width="80%" runat="server"></telerik:RadComboBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="Label4">Doanh thu hàng tháng</asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtDanhThu" Width="80%"></asp:TextBox>
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
                    <asp:Label runat="server" ID="Label5">Ngh&#7873; kinh doanh</asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtNgheKinhDoanh" Width="80%"></asp:TextBox>
                </td>

            </tr>
        </table>
        <asp:Button ID="btnAddDetail" class="ButtonCommand" runat="server" Style="width: 25px; height: 19px" Text="V" OnClick="btnAddDetail_Click" OnClientClick="return focus()"></asp:Button>
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center"></td>
            </tr>
            <tr>
                <td width="100%">

                    <telerik:RadSkinManager ID="RadSkinManager2" runat="server" Skin="Office2007" />
                    <telerik:RadSplitter ID="RadSplitter2" Width="100%" Height="250px" runat="server" Orientation="Horizontal">
                        <telerik:RadPane ID="RadPane1" Height="234px" Width="100%" runat="server" Scrolling="X">
                            <telerik:RadGrid runat="server" ID="grid" Height="234px" CellPadding="1" CellSpacing="1" AllowPaging="true"
                                AllowAutomaticUpdates="true" AllowMultiRowSelection="true" AllowSorting="true" AutoGenerateColumns="false" OnNeedDataSource="grid_NeedDataSource" OnItemCommand="grid_ItemCommand">
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="true" />
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                </ClientSettings>
                                <PagerStyle Mode="NextPrevNumericAndAdvanced" AlwaysVisible="true" PageSizes="5,10,25,50,100,250" />
                                <MasterTableView GroupLoadMode="Client" Width="100%" CommandItemDisplay="Top" AllowMultiColumnSorting="true">
                                    <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                    <Columns>

                                        <telerik:GridTemplateColumn UniqueName="Delete" HeaderText="Xóa">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtSeqRow" runat="server" Style="display: none" Text='<%# Eval("Seq") %>'></asp:TextBox>
                                                <asp:ImageButton CssClass="rgpointer" ID="Delete_Demand" runat="server" ImageUrl="~/Images/ht1.gif" CommandArgument='<%# Eval("Seq")%>'
                                                    CommandName="DELETE_DEMAND" OnClientClick="return SetSeq(this)" />
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn UniqueName="tennganh" DataField="tennganh" HeaderText="Nhóm ngành">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn UniqueName="doanhthu" DataField="doanhthu" HeaderText="Doanh Thu">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                            <ItemStyle HorizontalAlign="left" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn UniqueName="TyLeTinhThueGTGT" DataField="TyLeTinhThueGTGT" HeaderText="T&#7927; l&#7879; thu&#7871; GTGT">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>

                                        <telerik:GridBoundColumn UniqueName="TyLeTinhThueTNCN" DataField="TyLeTinhThueTNCN" HeaderText="T&#7927; l&#7879; thu&#7871; TNCN">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn UniqueName="nghekinhdoanh" DataField="nghekinhdoanh" HeaderText="Ngh&#7873; kinh doanh">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="idchitiet" UniqueName="idchitiet" DataField="idchitiet"
                                            Visible="true" Display="false" >
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="manganh" UniqueName="manganh" DataField="manganh"
                                            Visible="true" Display="false">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
        <br />
        <table cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
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
                    <asp:Label runat="server" ID="lblTrangThaiHoatDong">Tr&#7841;ng thái ho&#7841;t &#273;&#7897;ng</asp:Label>
                </td>
                <td>
                    <asp:Label>&#272;ang ho&#7841;t &#272;&#7897;ng</asp:Label>
                    <asp:RadioButton runat="server" ID="chkActive" GroupName="Status" Checked="true" />
                    <asp:Label>T&#7841;m ng&#432;ng/ngh&#7881;</asp:Label>
                    <asp:RadioButton runat="server" ID="chkNoActive" GroupName="Status" />
                </td>
                <td>
                    <asp:Label runat="server" ID="lblSoLuongLD">S&#7889; l&#432;&#7907;ng LD</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtSoLuongLD" Width="80%"></asp:TextBox>
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
                    <asp:Label runat="server" ID="Label6">Ngày b&#7855;t &#273;&#7847;u kinh doanh</asp:Label>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtStartDate" Width="90px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="Label7">Diện tích kinh doanh</asp:Label>
                </td>
                <td>
                    <asp:TextBox class="input" runat="server" ID="txtDienTichKD" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
        </table>
        <hr />


        <hr />
        <table cellspacing="1" cellpadding="1" width="100%" border="0">
            <tr>
                <td colspan="3" align="center">
                    <span class="btn1">
                        <asp:LinkButton ID="btnReset" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R" OnClick="btnReset_Click"><span class="btnReset">Làm m&#7899;i</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClick="btnSave_Click"><span class="btnSave">L&#432;u</span>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnBack" name="btnBack" AccessKey="L" runat="server" ToolTip="ALT+L"
                            OnClientClick="DisableAllButton('_ctl0:btnList'); return true;">
                    <span class="btnBack">V&#7873; DS YC</span>
                        </asp:LinkButton>


                    </span>
                </td>
            </tr>
        </table>
        <div id="divHidden" style="display: none">
             <asp:TextBox ID="txtSeq" runat="server" />
            </div>
    </form>

</asp:Content>
<asp:Content ContentPlaceHolderID="script" ID="script" runat="server">
    <script>
        $("#<%=txtStartDate.ClientID%>").datepicker();
        $("#<%=txtNgayKhai.ClientID%>").datepicker();
        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }



    </script>
</asp:Content>
