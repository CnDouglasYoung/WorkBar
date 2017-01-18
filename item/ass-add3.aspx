<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="ass-add3.aspx.cs" Inherits="item_ass_add3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 309px;
        }
        .auto-style2 {
            width: 103px;
        }
    </style>
    <div>
        <asp:Label ID="Label1" runat="server" Text="添加任务标签"></asp:Label>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <br />
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div  style="background-color:blueviolet;padding :0 5px;margin-right:5px">
                <asp:Label ID="TagNameLabel" runat="server" Text='<%# Eval("TagName") %>' />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT   Tag.TagName
FROM      Tag INNER JOIN
                Ass_Tag ON Tag.TagId = Ass_Tag.TagId
WHERE   (Ass_Tag.AssId = @AssId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="HiddenField1" Name="AssId" PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Text="请输入标签名"
            OnFocus="javascript:if(this.value=='请输入标签名') {this.value=''}"
            OnBlur="javascript:if(this.value==''){this.value='请输入标签名'}">
        </asp:TextBox>
        <asp:Button ID="Button3" runat="server" Text="添加" OnClick="Button3_Click" />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" style="vertical-align: top">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>

