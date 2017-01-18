<%@ Page Title="" Language="C#" MasterPageFile="~/master/item.master" AutoEventWireup="true" CodeFile="item.aspx.cs" Inherits="item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css" >
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
        .auto-style6 {
            width: 188px;
        }

    </style>

    
    <div style="height:760px;margin:15px;">
        <div style="margin:15px 0px; border-bottom-style: solid; border-bottom-width: medium; border-bottom-color: #3B8BBA;">
          
        <asp:DataList ID="DataListKey" runat="server" DataSourceID="SqlDataSource1" DataKeyField="ItemId" OnSelectedIndexChanged="DataListKey_SelectedIndexChanged" Width="725px" OnItemDataBound="DataListKey_ItemDataBound">
            <ItemTemplate> 
                 <asp:Label ID="Label3" runat="server" Text="项目：" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>' Font-Size="X-Large" ForeColor="Black"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ItemId") %>' Visible="False"></asp:Label>                
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/item/item-edit.aspx" style="position:absolute; top: 60px; left: 700px;" CssClass="LB" ToolTip="项目设置" Visible="False">
                <img src="../img/Icon/set.png" alt="" style="width: 25px; height: 25px; vertical-align: bottom;" />
                </asp:LinkButton>
                <asp:LinkButton ID="LinkButton22" runat="server" PostBackUrl="~/item/ass-add.aspx" style="position:absolute; top: 60px; left: 660px;" CssClass="LB" ToolTip="添加任务">
                <img src="../img/Icon/add.png" alt="" style="width: 25px; height: 25px; vertical-align: bottom;" /><span style="font-size:15px"></span>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:DataList> 
            
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT DISTINCT [ItemId], [Name] FROM [Item] WHERE ([ItemId] = @ItemId)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="ItemId" SessionField="ItemId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
<!--任务部分-->
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Width="728px" Height="530px" >
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" OnDataBinding="DataList2_DataBinding" OnItemDataBound="DataList2_ItemDataBound">
                                <ItemTemplate>
                                    <table class="auto-style3" style="background-color: #ECF0F5">
                                        <tr>
                                            <td >Name:
                                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                            </td>
                                            <td >
                                                <asp:Label ID="ListIdLabel" runat="server" Text='<%# Eval("ListId") %>' Visible="False" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                
                                                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" OnDataBinding="DataList3_DataBinding" OnItemDataBound="DataList3_ItemDataBound">
                                                    <ItemTemplate>
                                                        <table class="auto-style4" style="border-style: none; background-color: #DED9FF">
                                                            <tr>
                                                                <td rowspan="3" id="isimportent" runat="server" cssclass="notimportent">&nbsp;</td>
                                                                <td aria-disabled="False">
                                                                    <asp:Label ID="Label4" runat="server" Text="任务："></asp:Label>
                                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                                                </td>
                                                                <td>负责人：
                                                                    <asp:Label ID="Name1Label" runat="server" Text='<%# Eval("Name1") %>' />
                                                                </td>
                                                                <td class="auto-style6">
                                                                    <asp:Label ID="IsImportantLabel" runat="server" Text='<%# Eval("IsImportant") %>' Visible="True" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">任务详情:
                                                                    <asp:Label ID="RemarkLabel" runat="server" Text='<%# Eval("Remark") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>开始时间:
                                                                    <asp:Label ID="BeginTimeLabel" runat="server" Text='<%# Eval("BeginTime") %>' />
                                                                </td>
                                                                <td>结束时间:
                                                                    <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Eval("EndTime") %>' />
                                                                </td>
                                                                <td class="auto-style6">
                                                                    <asp:Label ID="AssIdLabel" runat="server" Text='<%# Eval("AssId") %>' Visible="False" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT Assignment.AssId, Assignment.Name, Assignment.Remark, Assignment.BeginTime, Assignment.EndTime, Assignment.IsImportant, User_.Name  
FROM Assignment INNER JOIN User_ ON Assignment.ResponsibleUID = User_.UID 
WHERE Assignment.BelongList = @BelongList and Assignment.BelongItem=@ItemId
ORDER BY Assignment.IsFinish, Assignment.EndTime">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="ListIdLabel" Name="BelongList" PropertyName="Text" />
                                                        <asp:SessionParameter DefaultValue="" Name="ItemId" SessionField="ItemId" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT [ListId], [Name] FROM [List] WHERE ([BelongItem] = @BelongItem) ORDER BY [Array]">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="" Name="BelongItem" SessionField="ItemId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            </asp:Panel>
    </div>        
    <div id="txt">aaa</div>
    <script type="text/javascript">
    var txt=document.getElementById("txt");
   var set={
    changeColor:function(){
        txt.style.color="red";
        txt.style.backgroundColor="#ccc";
    }
    </script>
</asp:Content>