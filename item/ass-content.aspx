<%@ Page Title="" Language="C#" MasterPageFile="~/master/item.master" AutoEventWireup="true" CodeFile="ass-content.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <style type="text/css">

        .ass-tr{
            padding:2px 0;
        }
       

        .auto-style3 {
            padding: 2px 0;
            height: 62px;
        }
       
         .tijiao2{
             margin-left:10px;
         }

        .auto-style4 {
        width: 253px;
    }
    .auto-style5 {
        padding: 2px 0;
        width: 373px;
    }
    .auto-style6 {
        width: 39px;
    }

    </style>
    <link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.min.css"/>
    <div style="margin-top: 10px;width:100%">
        <asp:Panel ID="Panel1" runat="server" Height="580px" ScrollBars="Vertical">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="DataList1_ItemDataBound" Visible="True" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" Width="100%">
        <ItemTemplate>
            <table style="width:100%; margin-left:15px;margin-top:0px;margin-bottom:0px">
        <tr class="ass-tr">
            <td class="ass-tr" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="任务：" Font-Size="X-Large"></asp:Label>
                <asp:Label class="aspl" ID="NameLabel" runat="server" Font-Size="24px" Text='<%# Eval("Name") %>'>任务名</asp:Label>
                &nbsp;
                <asp:Label ID="IsImportantLabel" runat="server" Text='<%# Eval("IsImportant") %>' Visible="False" />
                <asp:Label ID="AssIdLabel" runat="server" Text='<%# Eval("AssId") %>' Visible="False" />
                <asp:Label ID="ResponsibleUIDLabel" runat="server" Text='<%# Eval("ResponsibleUID") %>' Visible="False" />                
                </td>  
            <td class="auto-style6">
                <asp:ImageButton ID="ImageButton1" runat="server" Visible="False"  ImageUrl="~/img/Icon/favorites-filling.png"  Height="25px" Width="25px" CssClass="icon2" />
                 </td>
            <td><asp:ImageButton ID="IconSet" runat="server" Visible="False"  ImageUrl="~/img/Icon/set.png"  Height="25px" Width="25px" CssClass="icon" OnClick="IconSet_Click"/>
           </td>
         <tr>
                 <td class="ass-tr" colspan="2">
                <var  style="font-style:normal;margin-top:10px">负责人：[<asp:Label class="aspl" ID="UserNameLabel" runat="server" Font-Size="Small"  Text='<%# Eval("UserName") %>'></asp:Label>]</var>
                 </td>              
        </tr>    
        </tr>
        <tr>
            <td class="auto-style5">开始时间：<asp:Label ID="BeginTimeLabel" runat="server" Text='<%# Eval("BeginTime") %>'></asp:Label></td>
            <td class="auto-style4">结束时间：<asp:Label ID="EndTimeLabel" runat="server" Text='<%# Eval("EndTime") %>'></asp:Label></td>
        </tr>
        <tr>
            <td class="ass-tr" colspan="2">
                任务详情<hr />
                <asp:Label class="aspl" ID="Label3" runat="server" Text='<%# Eval("Remark") %>'></asp:Label>
            </td>
        </tr>
       
    </table>
        </ItemTemplate>
    </asp:DataList>
     
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT Assignment.Name, Assignment.AssId, Assignment.ResponsibleUID, User_.Name AS UserName, Assignment.Remark, Assignment.BeginTime, Assignment.EndTime, Assignment.IsImportant 
FROM Assignment INNER JOIN User_ ON Assignment.ResponsibleUID = User_.UID
Where  Assignment.AssId=@AssId">
        <SelectParameters>
            <asp:QueryStringParameter Name="AssId" QueryStringField="AssId" />
        </SelectParameters>
    </asp:SqlDataSource>
 <table style="width:100%; margin-left:15px;margin-top:0px;margin-bottom:0px">
    <tr>
            <td class="auto-style3">任务标签 <hr />
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" OnItemDataBound="DataList2_ItemDataBound" CellSpacing="5" Height="34px" CssClass="bq">
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" PostBackUrl='<%# Eval("TagId") %>' Text='<%# Eval("TagName") %>'  OnClick="Button2_Click" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>' BackColor="#8775A7" BorderStyle="None" ForeColor="White" Width="90px" Font-Size="Small" />
                        
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT Tag.TagName, Tag.TagId 
FROM Ass_Tag INNER JOIN Tag ON Ass_Tag.TagId = Tag.TagId
Where Ass_Tag.AssId=@AssId">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="AssId" Name="AssId"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
      
        <tr>
           <td class="ass-tr">参与人 <hr />
                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4" RepeatDirection="Horizontal" OnItemDataBound="DataList3_ItemDataBound" CellSpacing="5">
                    <ItemTemplate>
                        <asp:Button ID="Button4" runat="server" PostBackUrl='<%# Eval("UID") %>' Text='<%# Eval("Name") %>' BackColor="#44B6AE" BorderStyle="None" Height="25px" Width="90px" ForeColor="White" />
                    </ItemTemplate>
               </asp:DataList>
               <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT Ass_User.UID, User_.Name
FROM Ass_User INNER JOIN Assignment ON Ass_User.AssId = Assignment.AssId INNER JOIN User_ ON Ass_User.UID = User_.UID 
WHERE (Ass_User.AssId = @AssId)">
                   <SelectParameters>
                      <asp:QueryStringParameter QueryStringField="AssId" Name="AssId"></asp:QueryStringParameter>
                   </SelectParameters>
               </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="ass-tr">留言
&nbsp;<hr />            
            </td>
        </tr>
     </table>

    <div style="width:585px;margin-bottom:5px;margin-left:15px; background-color: #ECF0F5;">        
        <asp:Panel ID="PanelLY" runat="server" Height="200px" ScrollBars="Vertical" BackColor="#ECF0F5" OnDataBinding="Page_Load" AutoScroll="True">
        <asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table style="width:500px;margin:2px 0px 2px 0px; background-color:white">
                    <tr style="background-color:burlywood">
                        <td style="width:60%;padding:5px">
                            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                        </td>
                        <td style="width:35%;padding:5px">
                            <asp:Label ID="CreatTimeLabel" runat="server" Text='<%# Eval("CreatTime") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"style="padding:5px" >
                            <asp:Label ID="DetailLabel" runat="server" Text='<%# Eval("Detail") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"style="padding:5px">
                            <asp:HyperLink ID="FileNameHyperLink" runat="server" Text='<%# Eval("FileName") %>'>???</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:默认 %>' SelectCommand="SELECT   User_.Name AS UserName, Ass_Comment.Detail, Ass_Comment.CreatTime, File_.FileName
FROM      User_ INNER JOIN
                Ass_Comment ON User_.UID = Ass_Comment.CreateUID LEFT OUTER JOIN
                File_ ON Ass_Comment.FileId = File_.FileId
WHERE   (Ass_Comment.AssId = @AssId)
ORDER BY Ass_Comment.CreatTime desc">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="AssId" Name="AssId"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </div>
    <!--留言填写-->

    <textarea id="LiuYan" runat="server" style="width:497px; margin-left:15px; height: 78px;"></textarea> <br />
    <div style="width:585px;margin-bottom:5px;margin-left:15px;padding-left:250px">    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
        <asp:Button ID="Button3" runat="server" Text="留言" BackColor="#F08200" BorderStyle="None" ForeColor="White" OnClick="Button3_Click" CssClass="tijiao"/>
    </div>
    <div style="width:585px;margin-bottom:5px;margin-left:15px;"> 
    </div>  
            <asp:Button ID="Buttonn" runat="server" Text="完成任务" BackColor="#F08200" BorderStyle="None" ForeColor="White" OnClick="Buttonn_Click" CssClass="tijiao2" Height="40px" Width="120px" Font-Size="X-Large" Visible="False"/>
            </asp:Panel>
        </div>        
  <script type="text/javascript" src="../dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../dist/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('ContentPlaceHolder1_ContentPlaceHolder1_LiuYan');
    editor.create();
</script>
</asp:Content>

