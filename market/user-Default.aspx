<%@ Page Title="" Language="C#" MasterPageFile="~/market/MasterPage2 .master" AutoEventWireup="true" CodeFile="user-Default.aspx.cs" Inherits="market_Default2" %>

<asp:Content ID="Content2" runat="server" contentplaceholderid="Content1">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="560px" >
                        <ItemTemplate>
                            <table class="auto-style1" style="border-width: 1px; border-color: #999999; width:540px; border-radius:5px; height: 100px; margin-bottom: 10px; border-top-style: dashed;"    >
                                <tr>
                                    <td class="auto-style3"  style="text-align: left;">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("UID", "user-content.aspx?UID={0}") %>' Text='<%# Eval("Name") %>' Font-Size="Medium" Font-Underline="False" ForeColor="Black"></asp:HyperLink>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("UID") %>' Visible="False" Font-Size="Small" Font-Underline="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                     <td style="text-align: left" >
                                        <asp:Label ID="Label4" runat="server" Text="简介："></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Intro") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <asp:Label ID="TagNameLabel" runat="server" Font-Size="Small" Text='<%# Eval("TagName") %>' BackColor="#44B6AE" ForeColor="White" Width="90px" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT [UID], [Name], [Intro] FROM [User_]"></asp:SqlDataSource>
 
</asp:Content>    


