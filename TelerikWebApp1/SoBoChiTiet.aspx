<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SoBoChiTiet.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="TelerikWebApp1.SoBoChiTiet" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
    <h1>CHI TI&#7870;T S&#7892; B&#7896; THU&#7870;</h1>
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
                    <asp:Label runat="server" ID="lblNgayLapBo">Ngày l&#7853;p b&#7897;</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtNgayLapBo" Width="30%" ReadOnly="true"></asp:TextBox>
                </td>
                  <td width="10%">
                    <asp:Label runat="server" ID="Label2">Họ tên</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtHoTen" Width="50%" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblDoanhThuGTGT">Doanh thu GTGT</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtGTGT" onchange="javascript:checkNumber(this);" Width="30%" ReadOnly="true"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblDoanhthuTNCN">Doanh thu TNCN</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtTNCN" Width="30%" onblur="javascript:checkNumber(this);" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>
<%--            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblTyLeGTGT">T&#7927; l&#7879; GTGT</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtTyLeGTGT" Width="10%" ReadOnly="true"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblTyLeTNCN">T&#7927; l&#7879; TNCN</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtTyLeTNCN" Width="10%" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>--%>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblSoTienGTGT">S&#7889; ti&#7873;n GTGT</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtSoTienGTGT" Width="30%" ReadOnly="true" onblur="javascript:checkNumber(this);"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="lblSoTienTNCN">S&#7889; ti&#7873;n TNCN</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtSoTienTNCN" Width="30%" ReadOnly="true" onblur="javascript:checkNumber(this);"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label1">Mã Khai Thu&#7871;</asp:Label>
                </td>
                <td width="25%">  
                    <asp:TextBox class="Input" runat="server" ID="txtIDKhaiThue" Width="30%" ReadOnly="true"></asp:TextBox>
                </td>
                <td width="10%">
                    <asp:Label runat="server" ID="Label3">Mã số thuế</asp:Label>
                </td>
                <td width="25%">
                    <asp:TextBox class="Input" runat="server" ID="txtMST" Width="30%" ReadOnly="true"></asp:TextBox>
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
                     <%--   <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" OnClick="btnSave_Click" ><span class="btnSave">L&#432;u</span>
                        </asp:LinkButton>--%>
                        <asp:LinkButton ID="btnBack" name="btnBack" AccessKey="L" runat="server" ToolTip="ALT+L"
                            OnClientClick="DisableAllButton('_ctl0:btnList'); return true;" OnClick="btnBack_Click">
                    <span class="btnBack">V&#7873; DS </span>
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
                                            <telerik:GridBoundColumn UniqueName="KyThue" DataField="KyThue" HeaderText="Kỳ thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>   
                                             <telerik:GridBoundColumn UniqueName="NgayNop" DataField="NgayNop" HeaderText="Ngày nộp">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn> 
                                            <telerik:GridBoundColumn UniqueName="tieumuc" DataField="tieumuc" HeaderText="Tên gọi">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>                                            
                                            <telerik:GridBoundColumn UniqueName="SoTienNop" DataField="SoTienNop" HeaderText="S&#7889; ti&#7873;n &#273;ã n&#7897;p" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                          <%--  <telerik:GridBoundColumn UniqueName="SoTienConNo" DataField="SoTienConNo" HeaderText="S&#7889; ti&#7873;n còn n&#7907;" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="100px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="SoTienDu" DataField="SoTienDu" HeaderText="Số tiền dư" DataFormatString="{0:N0}">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" width="100px"/>
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
<asp:Content ContentPlaceHolderID="script" ID="script" runat="server">
    <script>
        $("#<%=txtNgayLapBo.ClientID%>").datepicker();
    </script>
</asp:Content>
