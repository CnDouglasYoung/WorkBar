<%@ Page Title="用户详情" Language="C#" MasterPageFile="~/market/MasterPage2 .master" AutoEventWireup="true" CodeFile="user-content.aspx.cs" Inherits="market_user_content" %>

<asp:Content ID="Content2" runat="server" contentplaceholderid="Content1">
   
           
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table style="padding: 10px; border: thin dashed #2F333C; width:557px; font-family: 'Microsoft YaHei UI'; font-size: medium; color: #2F333C; background-color: #FFFFFF; margin-top: 10px; margin-bottom: 10px; height: 340px;">
                    <tr>
                        <td  style="padding: 5px; width: 110px;">
                            <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("HeadPhoto") %>' Width="100px" />
                        </td>
                        <td  colspan="2" style="padding: 5px;background-color: #DAE5E6;">
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' Font-Size="X-Large" />
                            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="【站内信icon】" />
                            <asp:Label ID="UIDLabel" runat="server" Text='<%# Eval("UID") %>' />
                        </td>
                        
                    </tr>
                    <tr>
                        <td  style="padding:5px ;background-color: #DAE5E6;">
                            <asp:Label ID="Label2" runat="server" Text="个人简介："></asp:Label>
                        </td>
                        <td  colspan="2" style="padding: 5px;border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #DAE5E6; text-align: left;" >
                            <asp:Label ID="IntroLabel" runat="server" Text='<%# Eval("Intro") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td  style="padding: 5px; background-color: #DAE5E6;">
                            <asp:Label ID="Label3" runat="server" Text="个人标签："></asp:Label>
                        </td>
                        <td  colspan="2" style="padding: 5px;border-color: #DAE5E6; padding: 5px; border-bottom-style: solid; border-bottom-width: thin;">
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <asp:Button ID="Button3" runat="server" PostBackUrl='<%# Eval("TagId", "user-tag.aspx?TagId={0}") %>' Text='<%# Eval("TagName") %>'  />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT Tag.TagName, User_Tag.TagId 
FROM User_Tag INNER JOIN Tag ON User_Tag.TagId = Tag.TagId
Where User_Tag.UID=@UID">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="UIDLabel" Name="UID" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td   style="padding: 5px; background-color: #DAE5E6; height: 37px;">
                            <asp:Label ID="Label1" runat="server" Text="E-Mail:"></asp:Label>
                        </td>
                        <td   style="padding: 5px; height: 37px;">
                            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        </td>
                        <td style="padding: 5px;width:58px; height: 37px;" >
                            <asp:Button ID="jianli" runat="server" Text="点击下载简历" BackColor="#F08200" BorderStyle="None"  ForeColor="White" />
                        </td>
                    </tr>
                    <tr>
                        <td   style="padding: 5px;">
                            <asp:Button ID="yaoqing" runat="server" Text="邀请加入项目" BackColor="#F08200" BorderStyle="None" Height="30px" ForeColor="White" Font-Size="Large" />
                        </td>
                    </tr>
                </table>
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT [UID], [Name], [Gender], [HeadPhoto], [Email], [Intro] FROM [User_] WHERE ([UID] = @UID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="UID" QueryStringField="UID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>