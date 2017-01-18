<%@ Page Title="" Language="C#" MasterPageFile="~/master/item.master" AutoEventWireup="true" CodeFile="ass-user.aspx.cs" Inherits="item_ass_tag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .TagButton{
            margin-right:10px;
            padding:2px 10px;
            font-style:normal;
        }
        .closeicon{
            height:25px;
            width:25px;
            margin-left:10px;
            
            　
                
        }
        
        .tag {
            width: 120px;
            height:20px;
            text-align:center ;           
            padding-top:10px;
            vertical-align:top
        }
        .tag2 {
            width: 120px;
            height:5px;
            margin-bottom:10px;
            margin-top:5px;
        }
        .name {
            height:45px;
            border-bottom-style: outset; 
            border-bottom-width: 2px
        }
        .container {
            width: 630px;
            height:500px;
        }
        .auto-style4 {
            width:701px;
            margin:0 auto;
            border-style:ridge;
            border-width:1px;
            height: 72px;
        }
        .importent{
            background-color:red;
            width :5px;
        }
        .notimportent{      
            width :5px;
        }
            #ImageButton1{
               align-items:baseline;
            }
            .yincang{
                display:none;
            }
            .dingwei{
                position:absolute;
                top:170px;
                left:580px;
            }
        </style>
    <asp:Panel ID="Panel1" runat="server" Height="600px" ScrollBars="Vertical">
    <div class ="kuang">
     <div>
         <p class="biaoti">
            用户信息
        </p>
         <div style="padding-left: 70px">
         <asp:DataList ID="DataList6" runat="server" DataSourceID="SqlDataSource4">
            <ItemTemplate>
                <table style="cellpadding:0px;cellspacing:0px;padding: 10px; border: thin dashed #2F333C; width:557px; font-family: 'Microsoft YaHei UI'; font-size: medium; color: #2F333C; background-color: #FFFFFF; margin-top: 10px; margin-bottom: 10px; height: 340px;">
                    <tr>
                        <td  style="padding: 5px; width: 110px;">
                            <asp:Image ID="Image1" runat="server" Height="100px"  ImageUrl='<%# Eval("HeadPhoto") %>' Width="100px" />
                        </td>
                        <td style="padding: 5px;background-color: #DAE5E6;">
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' Font-Size="X-Large" />
                            <asp:Label ID="UIDLabel" runat="server" Text='<%# Eval("UID") %>' />
                            
                            </td><td style="background-color: #DAE5E6; padding-right: 10px; padding-left: 10px;">
                            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="【站内信icon】" Height="30px" ImageUrl="~/img/Icon/comments.png" OnClick="ImageButton1_Click" Width="30px"/>
                        </td>
                        
                    </tr>
                    <tr>
                        <td  style="padding:5px ;background-color: #DAE5E6;">
                            <asp:Label ID="Label2" runat="server" Text="个人简介："></asp:Label>
                        </td>
                        <td style="padding: 5px;border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #DAE5E6; text-align: left;" >
                            <asp:Label ID="IntroLabel" runat="server" Text='<%# Eval("Intro") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td  style="padding: 5px; background-color: #DAE5E6;">
                            <asp:Label ID="Label3" runat="server" Text="个人标签："></asp:Label>
                        </td>
                        <td style="padding: 5px;border-color: #DAE5E6; padding: 5px; border-bottom-style: solid; border-bottom-width: thin;">
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <asp:Button ID="Button3" runat="server" PostBackUrl='<%# Eval("TagId", "user-tag.aspx?TagId={0}") %>' Text='<%# Eval("TagName") %>' BackColor="#44B6AE" BorderStyle="None" ForeColor="White"  />
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
                    </tr>
                </table>
<br />
            </ItemTemplate>
        </asp:DataList>
             </div>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT [UID], [Name], [Gender], [HeadPhoto], [Email], [Intro] FROM [User_] WHERE ([UID] = @UID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="UID" QueryStringField="UID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
         <div style="margin:15px 0px; ">
<asp:Label ID="Label2" runat="server" Text="负责任务" Font-Size="Large"></asp:Label>
         <hr />
          </div>  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT DISTINCT Name 
FROM User_
WHERE UID=@UID">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="UID" Name="UID"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
    </div>

      <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" OnDataBinding="DataList3_DataBinding" OnItemDataBound="DataList3_ItemDataBound">
                                                    <ItemTemplate>
                                                         
                                                        <table class="auto-style4" style="border-style: none; background-color: #DED9FF">
                                                            <tr>
                                                                <td rowspan="4" id="isimportent" runat="server" cssclass="notimportent">&nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="Label3" runat="server" Text="任务："></asp:Label>
                                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                                                </td>
                                                                <td>负责人：
                                                                    <asp:Label ID="Name1Label" runat="server" Text='<%# Eval("Name1") %>' />
                                                                </td>
                                                                <td>是否重要：
                                                                    <asp:Label ID="IsImportantLabel" runat="server" Text='<%# Eval("IsImportant") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">Remark:
                                                                    <asp:Label ID="RemarkLabel" runat="server" Text='<%# Eval("Remark") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" OnItemDataBound="DataList2_ItemDataBound" CellPadding="0">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="Button2" runat="server" CssClass="TagButton" PostBackUrl='<%# Eval("TagId") %>' Text='<%# Eval("TagName") %>'  OnClick="Button2_Click" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>' BackColor="#8775A7" BorderStyle="None" ForeColor="White" Font-Size="Small" Height="30px" Width="120px" />
                        
                                                                            </ItemTemplate>
                                                                        </asp:DataList>
                                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT Tag.TagName, Tag.TagId 
FROM Ass_Tag INNER JOIN Tag ON Ass_Tag.TagId = Tag.TagId
Where Ass_Tag.AssId=@AssId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="AssIdLabel" Name="AssId" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>From:
                                                                    <asp:Label ID="BeginTimeLabel" runat="server" Text='<%# Eval("BeginTime") %>' />
                                                                </td>
                                                                <td>To:
                                                                    <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Eval("EndTime") %>' />
                                                                </td>
                                                                <td>AssId:
                                                                    <asp:Label ID="AssIdLabel" runat="server" Text='<%# Eval("AssId") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:DataList>
       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Assignment.Name, Assignment.Remark, Assignment.BelongList, Assignment.BelongItem, Assignment.BeginTime, 
                Assignment.EndTime, Assignment.CreateTime, Assignment.IsImportant, User_.Name AS Name1,
                Assignment.AssId
FROM      Assignment INNER JOIN
                User_ ON Assignment.ResponsibleUID = User_.UID
WHERE   (Assignment.BelongItem = @ItemId) AND (Assignment.ResponsibleUID = @UID)
ORDER BY Assignment.EndTime">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="" Name="ItemId" SessionField="ItemId" Type="Int32" />
                                                         <asp:QueryStringParameter QueryStringField="UID" Name="UID"></asp:QueryStringParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

    <div style="margin:15px 0px; ">
        <asp:Label ID="Label5" runat="server" Text="参与任务" Font-Size="Large"></asp:Label>
        <hr />     
    </div>
       <asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource2" OnDataBinding="DataList3_DataBinding" OnItemDataBound="DataList3_ItemDataBound">
                                                    <ItemTemplate>
                                                         
                                                        <table class="auto-style4" style="border-style: none; background-color: #DED9FF">
                                                            <tr>
                                                                <td rowspan="4" id="isimportent" runat="server" cssclass="notimportent">&nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text="任务："></asp:Label>
                                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                                                </td>
                                                                <td>负责人：
                                                                    <asp:Label ID="Name1Label" runat="server" Text='<%# Eval("Name1") %>' />
                                                                </td>
                                                                <td>是否重要：
                                                                    <asp:Label ID="IsImportantLabel" runat="server" Text='<%# Eval("IsImportant") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">Remark:
                                                                    <asp:Label ID="RemarkLabel" runat="server" Text='<%# Eval("Remark") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">
                                                                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" OnItemDataBound="DataList2_ItemDataBound" CellPadding="0">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="Button2" runat="server" CssClass="TagButton" PostBackUrl='<%# Eval("TagId") %>' Text='<%# Eval("TagName") %>'  OnClick="Button2_Click" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>' BackColor="#8775A7" BorderStyle="None" ForeColor="White" Font-Size="Small" Height="30px" Width="120px" />
                        
                                                                            </ItemTemplate>
                                                                        </asp:DataList>
                                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT Tag.TagName, Tag.TagId 
FROM Ass_Tag INNER JOIN Tag ON Ass_Tag.TagId = Tag.TagId
Where Ass_Tag.AssId=@AssId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="AssIdLabel" Name="AssId" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>From:
                                                                    <asp:Label ID="BeginTimeLabel" runat="server" Text='<%# Eval("BeginTime") %>' />
                                                                </td>
                                                                <td>To:
                                                                    <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Eval("EndTime") %>' />
                                                                </td>
                                                                <td>AssId:
                                                                    <asp:Label ID="AssIdLabel" runat="server" Text='<%# Eval("AssId") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:DataList>
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT   Assignment.Name, Assignment.Remark, Assignment.BelongList, Assignment.BelongItem, Assignment.BeginTime, 
                Assignment.EndTime, Assignment.CreateTime, Assignment.IsImportant, User_.Name AS Name1, 
                Assignment.AssId
FROM      Assignment INNER JOIN
                User_ ON Assignment.ResponsibleUID = User_.UID INNER JOIN
                Ass_User ON Assignment.AssId = Ass_User.AssId
WHERE   (Assignment.BelongItem = @ItemId) AND (Ass_User.UID = @UID)
ORDER BY Assignment.EndTime">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="" Name="ItemId" SessionField="ItemId" Type="Int32" />
                                                         <asp:QueryStringParameter QueryStringField="UID" Name="UID"></asp:QueryStringParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
        </div>
        </asp:Panel>
</asp:Content>

