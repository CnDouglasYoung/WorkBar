<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="file-add.aspx.cs" Inherits="item_file_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="kuang">
        <p class="biaoti">
            添加文件
        </p>
    <table>
       
           
        <tr>
            <td style="width: 289px; height: 100px;">
    <asp:Label ID="Label1" runat="server" Text="上传文件到：" BorderStyle="None" Font-Size="Medium" Height="24px" Width="108px"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="Ldrop"  Width="170px" BackColor="#ECF0F5" DataSourceID="SqlDataSourcea" DataTextField="Name" DataValueField="ItemId"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Size="Medium" OnDataBinding="DropDownList1_DataBinding" AutoPostBack="True" ></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourcea" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Item.Name, Item.ItemId
FROM      Item_User INNER JOIN
                Item ON Item_User.ItemId = Item.ItemId
WHERE   Item_User.UID=@UID AND Item_User.IsAccept=1">
         <SelectParameters>
                <asp:SessionParameter Name="UID" SessionField="UID" />
         </SelectParameters>
    </asp:SqlDataSource>
      </td>
        
            <td style="padding-left: 10px; width: 184px; height: 100px;">
    <asp:FileUpload ID="FileUpload1" runat="server" />
                
</td>
        
            <td colspan="2" style="padding-left: 40px; height: 100px; width: 133px;">
    <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" CssClass="tijiao" /><br />
            </td>
        </tr>
    </table>
    </div>
</asp:Content>

