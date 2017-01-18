<%@ Page Title="" Language="C#" MasterPageFile="~/market/MasterPage2 .master" AutoEventWireup="true" CodeFile="user-search.aspx.cs" Inherits="market_Default2" %>

<asp:Content ID="Content2" runat="server" contentplaceholderid="Content1">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="650px" >
                        <ItemTemplate>
                            <table class="auto-style1" style="padding: 5px; border-style: inset; width:650px;border-radius:5px;margin:0 auto "    >
                                <tr>
                                    <td class="auto-style3">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("UID", "user-content.aspx?UID={0}") %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("UID") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Intro") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <asp:Label ID="TagNameLabel" runat="server" Font-Size="Small" Text='<%# Eval("TagName") %>' />
                                                &nbsp;
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT top 4 Tag.TagName 
FROM User_ INNER JOIN User_Tag ON User_.UID = User_Tag.UID INNER JOIN Tag ON User_Tag.TagId = Tag.TagId
where User_.UID=@UID">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Label3" Name="UID" PropertyName="Text" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT [UID], [Name], [Intro] 
FROM [User_]
Where Name Like '%'+@Taxt+'%' or Intro Like '%'+@Taxt+'%' ">
        <SelectParameters>
            <asp:QueryStringParameter Name="Taxt" QueryStringField="Taxt" />
        </SelectParameters>
    </asp:SqlDataSource>
             
</asp:Content>

