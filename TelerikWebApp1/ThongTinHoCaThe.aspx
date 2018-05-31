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
      </form>
</asp:Content>


