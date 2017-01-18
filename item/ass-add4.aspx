<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="ass-add4.aspx.cs" Inherits="item_ass_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" /><span>转让负责人权限</span><br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="UID" CellPadding="0" CellSpacing="0" RepeatDirection="Horizontal" Visible="False" RepeatColumns="8" Width="500px"></asp:RadioButtonList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   User_.Name,User_.UID
FROM      Assignment INNER JOIN
                Item_User ON Assignment.BelongItem = Item_User.ItemId INNER JOIN
                User_ ON Item_User.UID = User_.UID
WHERE   (Assignment.AssId = @AssId)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="HiddenField1" Name="AssId" PropertyName="Value" />
                    </SelectParameters>
    </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="完成创建" OnClick="Button1_Click" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
</asp:Content>

