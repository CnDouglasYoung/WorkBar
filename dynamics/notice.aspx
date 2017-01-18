<%@ Page Title="" Language="C#" MasterPageFile="~/master/dynamic.master" AutoEventWireup="true" CodeFile="notice.aspx.cs" Inherits="dynamics_notice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <style type="text/css">
        td{
            padding :5px;
        }
        </style>
    
     <div class ="kuang ">
        <p class="biaoti">
            公告
        </p>
          <asp:Panel ID="Panel1" runat="server" Height="560px" ScrollBars="Vertical">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <table style="width: 226%; background-color: #DED9FF;">
                <tr>
                    <td>项目：<asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>发布人：<asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("User_Name") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="NoticeIdLabel" runat="server" Text='<%# Eval("NoticeId") %>' Visible="False" />
                        <asp:Label ID="TextLabel" runat="server" Text='<%# Eval("Text") %>' />
                    </td>
                </tr>
                <tr>
                    <td>发布时间：<asp:Label ID="CreateTimeLabel" runat="server" Text='<%# Eval("CreateTime") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ReadedLabel" runat="server" Text='<%# Eval("Readed") %>' />
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT   Notice.Text , Notice.CreateTime , Notice_User.Readed, Item.Name, User_.Name AS User_Name ,
                Notice.NoticeId
FROM      Notice INNER JOIN
                Notice_User ON Notice.NoticeId = Notice_User.NoticeId INNER JOIN
                Item ON Notice.BelongItem = Item.ItemId INNER JOIN
                User_ ON Notice.BelongUID = User_.UID
WHERE   (Notice_User.UID = @UID)">
        <SelectParameters>
            <asp:SessionParameter Name="UID" SessionField="UID" />
        </SelectParameters>
    </asp:SqlDataSource>
              </asp:Panel>
</div>
</asp:Content>

