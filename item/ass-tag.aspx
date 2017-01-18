<%@ Page Title="" Language="C#" MasterPageFile="~/master/item.master" AutoEventWireup="true" CodeFile="ass-tag.aspx.cs" Inherits="item_ass_tag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .TagButton{
            margin-right:10px;
            padding:2px 10px;
            font-style:normal;
        }
        body {background-color: #EEEEEE}
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
        .auto-style3 {
            
            width:600px;
            background-color:#ffffff;            
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
        .auto-style5 {
            width: 145px;
        }
        .auto-style6 {
            width: 188px;
        }
    
        </style>
    <div style="margin: 15px">
     <div style="margin:15px 0px; ">

    <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <asp:Label ID="Label2" runat="server" Text="标签：" Font-Size="X-Large"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("TagName") %>' Font-Size="Large" ForeColor="#8775A7" BorderStyle="None" />
            
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT DISTINCT Tag.TagName
FROM      Ass_Tag INNER JOIN
                Tag ON Ass_Tag.TagId = Tag.TagId
WHERE    (Ass_Tag.TagId = @TagId)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="TagId" Name="TagId"></asp:QueryStringParameter>
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
      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT   Ass_Tag.AssId, Assignment.Name, Assignment.Remark, Assignment.BelongList, Assignment.BelongItem, 
                Assignment.BeginTime, Assignment.EndTime, Assignment.CreateTime, Assignment.IsImportant, User_.Name AS Name1, 
                Tag.TagName
FROM      Ass_Tag INNER JOIN
                Assignment ON Ass_Tag.AssId = Assignment.AssId INNER JOIN
                User_ ON Assignment.ResponsibleUID = User_.UID INNER JOIN
                Tag ON Ass_Tag.TagId = Tag.TagId
WHERE   (Assignment.BelongItem = @ItemId) AND (Ass_Tag.TagId = @TagId)
ORDER BY Assignment.EndTime">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="" Name="ItemId" SessionField="ItemId" Type="Int32" />
                                                         <asp:QueryStringParameter QueryStringField="TagId" Name="TagId"></asp:QueryStringParameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
        </div>
</asp:Content>

