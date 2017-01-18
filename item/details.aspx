<%@ Page Title="" Language="C#" MasterPageFile="~/master/item.master" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="item_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin:15px;">
        <asp:Panel ID="Panel1" runat="server" Height="600px" ScrollBars="Vertical">
     <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                        <table class="content-style1" style="padding: 10px; font-family: 'Microsoft YaHei UI'; font-size: medium; color: #2F333C; background-color: #DED9FF; width: 670px;">
                    <tr>
                        <td class="content-style4" style="border-bottom: medium solid #4889AE; height: 36px; width: 576px; border-left-width: medium; border-right-width: medium; border-top-width: medium;">
                            <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="项目："></asp:Label>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' Font-Size="X-Large" />
                            <asp:Label ID="ItemIdLabel" runat="server" Text='<%# Eval("ItemId") %>' Visible="False" />
                        </td>
                        <td class="content-style6">                            
                           <asp:Label ID="numLabel" runat="server" Text='<%# Eval("num") %>' Font-Size="X-Large" /> / 
                            <asp:Label ID="UserNumberLabel" runat="server" Text='<%# Eval("UserNumber") %>' Font-Size="X-Large"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content-style8" style="height: 48px"> 项目简介：<br /> 
                            <asp:Label ID="IntroLabel" runat="server" Text='<%# Eval("Intro") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content-style8" style="height: 97px"> <hr />
                            项目标签：<br /> 
                            <div style="margin-top:5px;">
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" CellSpacing="5" RepeatColumns="6">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" PostBackUrl='<%# Eval("TagId", "~/item/ass-tag.aspx?TagId={0}") %>' Text='<%# Eval("TagName") %>' BackColor="#8775A7" BorderStyle="None" Font-Size="Small" ForeColor="White" Width="90px" />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT Tag.TagName, Tag.TagId 
FROM Item_Tag INNER JOIN Tag ON Item_Tag.TagId = Tag.TagId
Where Item_Tag.ItemId=@ItemId">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ItemIdLabel" Name="ItemId" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content-style8" style="height: 97px"> <hr />
                            项目成员：<br /> 
                            <div style="margin-top:5px;">
                            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" CellSpacing="5" RepeatColumns="6">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" PostBackUrl='<%# Eval("UID", "~/item/ass-user.aspx?UID={0}") %>' Text='<%# Eval("Name") %>' BackColor="#44B6AE" BorderStyle="None" Font-Size="Small" ForeColor="White" Width="90px" />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT User_.Name,User_.UID
FROM Item_User INNER JOIN User_ ON Item_User.UID = User_.UID
Where Item_User.ItemId=@ItemId and Item_User.IsAccept=1">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ItemIdLabel" Name="ItemId" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content-style5" style="height: 55px"> <hr>
                            项目详情：<br />
                            <asp:Label ID="DetailLabel" runat="server" Text='<%# Eval("Detail") %>' />
                        </td>
                    </tr>
                </table>
<br />
                <br />
            </ItemTemplate>
        </asp:DataList>
            </asp:Panel>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT [ItemId]
      ,[Name]
      ,[Intro]
      ,[Detail]
      ,[IsPublic]
      ,[UserNumber]
	  ,count(*)as num
  FROM [dbo].[item-content]
  Where Itemid=@ItemId
  group by Itemid,Name,Intro,Detail,IsPublic,UserNumber
  ">
            <SelectParameters>
                <asp:SessionParameter Name="ItemId" SessionField="ItemId" />
            </SelectParameters>
        </asp:SqlDataSource>
    
</asp:Content>

