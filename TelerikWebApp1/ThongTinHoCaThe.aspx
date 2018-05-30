<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="ThongTinHoCaThe.aspx.cs" Inherits="TelerikWebApp1.ThemMoiHoCaThe" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="content" runat="server">
   <h1>Thông tin hộ cá thể</h1>
    <br />
  <form id="frm" runat="server">
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
            <td><asp:Label runat="server">Ngày cấp</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80px"></asp:TextBox>
            </td>
            <td>
                <asp:Label runat="server">Mã số thuế</asp:Label>
            </td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><br /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label runat="server">Họ tên</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80%"></asp:TextBox>
                </td>
            <td>

                <asp:Label runat="server">Tên cửa hàng</asp:Label>
                </td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><br /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label runat="server">Ngày sinh</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80px"></asp:TextBox>
             </td>
            <td>                       
                <asp:Label runat="server">CMND</asp:Label>      
           </td>
            <td>    
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><br /></td>
        </tr>
        <tr>
             <td></td>
            <td><asp:Label runat="server">Địa chỉ</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80%"></asp:TextBox></td><td>
                                    
                <asp:Label runat="server">Ngày cấp</asp:Label>    </td><td>       
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80px"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td><br /></td>
        </tr>
        <tr>
             <td></td>
            <td><asp:Label runat="server">Mã đường phố</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80%"></asp:TextBox></td><td>
                                    
                <asp:Label runat="server">Nơi cấp</asp:Label>          </td><td> 
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td><br /></td>
        </tr>
        <tr>
             <td></td>
            <td><asp:Label runat="server">Mã ngành</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80%"></asp:TextBox></td><td>
                                    
                <asp:Label runat="server">Nghề kinh doanh</asp:Label>           </td><td>
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td><br /></td>
        </tr>
        <tr>
             <td></td>
            <td><asp:Label runat="server">Vốn kinh doanh</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80%"></asp:TextBox></td><td>
                                    
                <asp:Label runat="server">Ngày bắt đầu kinh doanh</asp:Label>          </td><td> 
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80px"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td><br /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label runat="server">Ngày tính thuế</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80px"></asp:TextBox></td><td>
                                    
                <asp:Label runat="server">Số giấy phép</asp:Label>           </td><td>
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td><br /></td>
        </tr>
        <tr>
             <td></td>
            <td><asp:Label runat="server">Số điện thoại</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80%"></asp:TextBox></td><td>
                                    
                <asp:Label runat="server">Email</asp:Label>           </td><td>
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="80%"></asp:TextBox>
            </td>
        </tr>
                <tr>
            <td><br /></td>
        </tr>
        <tr>
             <td></td>
            <td><asp:Label runat="server">Ghi chú</asp:Label></td>
            <td>
                <asp:TextBox class="input" runat="server" MaxLength="15" Width="80%" TextMode="MultiLine"></asp:TextBox></td><td>
                                    
                <asp:Label runat="server">Năm</asp:Label>           </td><td>
                <asp:TextBox class="input" runat="server" MaxLength="14" Width="50px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td><br /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label runat="server">Thứ tự</asp:Label></td>
            <td><asp:TextBox class="input" runat="server" TextMode="Number" Width="50px"></asp:TextBox></td>
        </tr>
    </table>
    <hr />
<table cellspacing="1" cellpadding="1" width="100%" border="0">
    <tr>
        <td colspan="3" align="center">
            <span class="btn1">
                <asp:LinkButton ID="btnReset" name="btnReset" runat="server" AccessKey="R" ToolTip="Alt+R" ><span class="btnReset">Làm mới</span>
                </asp:LinkButton>
                <asp:LinkButton ID="btnSave" name="btnSave" AccessKey="S" ToolTip="ALT+S" runat="server" ><span class="btnSave">Lưu</span>
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
                                            <telerik:GridBoundColumn UniqueName="masothue" DataField="masothue" HeaderText="Mã số thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>                                           
                                            <telerik:GridBoundColumn UniqueName="hoten" DataField="hoten" HeaderText="Họ tên">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="nam" DataField="nam" HeaderText="Năm tính thuế">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="Thang" DataField="Thang" HeaderText="Thang">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="SoTienPhaiDong" DataField="SoTienPhaiDong" HeaderText="Số tiền phải đóng">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>                                            
                                            <telerik:GridBoundColumn UniqueName="SoTienDaNop" DataField="SoTienDaNop" HeaderText="Số tiền đã nộp">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px"/>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="SoTienConNo" DataField="SoTienConNo" HeaderText="Số tiền còn nợ">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="TinhTrang" DataField="TinhTrang" HeaderText="Tình trạng">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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


