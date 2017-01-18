
<%@  Page Title="" Language="C#" MasterPageFile="~/market/MasterPage.master" AutoEventWireup="true" CodeFile="item-tag.aspx.cs" Inherits="_item_tag"%>


<asp:Content ID="Content2" runat="server" contentplaceholderid="Content1">
    <style type="text/css">
        #p{
            width:200px
        }
    </style>
            <p id="p">项目标签：<asp:Label ID="Label1" runat="server" Text="Label" Font-Size="X-Large"></asp:Label></p>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="650px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                        <ItemTemplate>
                            <table class="auto-style1" style="border-width: 1px; border-color: #999999; width:540px; border-radius:5px; height: 100px; margin-bottom: 10px; border-top-style: dashed;"    >
                                <tr>
                                    <td class="auto-style13" style="text-align: left;">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ItemId", "item-content.aspx?ItemId={0}") %>' Text='<%# Eval("Name") %>' Font-Size="Medium" Font-Underline="False" ForeColor="Black"></asp:HyperLink>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("ItemId") %>' Visible="False" Font-Size="Small" Font-Underline="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left" >
                                        <asp:Label ID="Label4" runat="server" Text="简介："></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Intro") %>'   ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <asp:Label ID="TagNameLabel" runat="server" Font-Size="Small" Text='<%# Eval("Column1") %>' BackColor="#8775A7" ForeColor="White" Width="90px" />
                                                &nbsp;
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT TOP 4 replace(Tag.TagName,' ' , '') FROM Item INNER JOIN Item_Tag ON Item.ItemId = Item_Tag.ItemId INNER JOIN Tag ON Item_Tag.TagId = Tag.TagId Where Item.ItemId=@ItemId">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label3" Name="ItemId" PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT Item.Name, Item.Intro, Item.ItemId 
FROM Item INNER JOIN Item_Tag ON Item.ItemId = Item_Tag.ItemId 
Where  Item_Tag.TagId=@TagId and Item.IsPublic=1">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="TagId" QueryStringField="TagId" />
                        </SelectParameters>
                        </asp:SqlDataSource>
</asp:Content>
