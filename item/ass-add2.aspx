<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="ass-add2.aspx.cs" Inherits="item_ass_add2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="添加参与人"></asp:Label><br />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Item_User.UID, User_.Name
FROM      Item INNER JOIN
                Item_User ON Item.ItemId = Item_User.ItemId INNER JOIN
                User_ ON Item_User.UID = User_.UID
WHERE   (Item.ItemId = @ItemId) AND (Item_User.IsAccept = 1) AND (Item_User.UID<>@UID) " >
           
            <SelectParameters>
                <asp:SessionParameter Name="ItemId" SessionField="ItemId" />
                <asp:SessionParameter Name="UID" SessionField="UID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
            <ItemTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server"  Text='<%# Eval("Name") %>'/>                
                <asp:HiddenField ID="HiddenField1" runat="server"  Value='<%# Eval("UID") %>'/>&nbsp;&nbsp;&nbsp;&nbsp;
            </ItemTemplate>
        </asp:DataList>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" style="vertical-align: top">
                    <asp:Button ID="Button1" runat="server" Text="下一步" OnClick="Button1_Click" />
                </td>
                <td class="auto-style3" style="vertical-align: top">
                    &nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>

