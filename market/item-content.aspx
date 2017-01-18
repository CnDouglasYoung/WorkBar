<%@  Page Title="" Language="C#" MasterPageFile="~/market/MasterPage.master" AutoEventWireup="true"  CodeFile="item-content.aspx.cs" Inherits="market_item_content"%>
 



<asp:Content ID="Content2" runat="server" contentplaceholderid="Content1">
    <style type="text/css">
        .p1{
            position:fixed;
            left:50%; top:50%; z-index:200;
            width:500px; height:400px; 
            margin:-200px 0px 0px -250px; 
            background-color:rgba(244,244,244,0.8); 
        }
        .t{
            position:fixed;
            left:50%; top:50%; z-index:200;
            width:400px;height:300px;
            margin:-150px 0px 0px -200px; 
        }
        .b{
            margin:10px 200px;
            width:100px;height:30px
        }
        img {
    max-width: 500px;
}
        .tupian{
            max-width: 960px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.min.css"/>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                        <table class="content-style1" style="padding: 10px; border: thin dashed #2F333C; font-family: 'Microsoft YaHei UI'; font-size: medium; color: #2F333C; background-color: #FFFFFF; width: 557px; margin-top: 10px; margin-bottom: 10px; height: 430px;">
                    <tr>
                        <td class="content-style4" style="text-align: left;">
                            <asp:Label ID="Label2" runat="server" Font-Size="X-Large" Text="项目："></asp:Label>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' Font-Size="X-Large" />
                            <asp:Label ID="ItemIdLabel" runat="server" Text='<%# Eval("ItemId") %>' Visible="False" />
                        </td>
                        <td class="content-style6" style="text-align: left;">                            
                           <asp:Label ID="numLabel" runat="server" Text='<%# Eval("num") %>' Font-Size="X-Large" /> / 
                            <asp:Label ID="UserNumberLabel" runat="server" Text='<%# Eval("UserNumber") %>' Font-Size="X-Large"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content-style8" style="text-align: left">项目简介：<br /> <hr>
                            <asp:Label ID="IntroLabel" runat="server" Text='<%# Eval("Intro") %>' />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content-style8" style="text-align: left">项目标签：<br /> <hr />
                            <div style="margin-top:5px;">
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" CellSpacing="5">
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" PostBackUrl='<%# Eval("TagId", "item-tag.aspx?TagId={0}") %>' Text='<%# Eval("TagName") %>' BackColor="#8775A7" BorderStyle="None" Font-Size="Small" ForeColor="White" Width="90px" Visible="False" />
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT Tag.TagName, Tag.TagId 
FROM Item_Tag INNER JOIN Tag ON Item_Tag.TagId = Tag.TagId
Where Item_Tag.ItemId=@ItemId">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ItemIdLabel" Name="ItemId" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                                <br />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content-style5" style="text-align: left">项目详情：<br /> <hr>
                            <asp:Panel ID="Panel2" runat="server" Width="520px" HorizontalAlign="Justify" ScrollBars="Auto"><p id="DetailLabel" runat="server" ><%# Eval("Detail") %></p></asp:Panel>
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="margin:0 auto"  class="content-style7">
                            <asp:Button ID="shenqing" runat="server" Text="申请加入" BackColor="#F08200" BorderColor="#2F333C" BorderStyle="None" Font-Names="Microsoft YaHei UI" Font-Size="Medium" Height="41px" Width="121px" ForeColor="White" Visible="False" OnClick="shenqing_Click"/>
                        </td>
                    </tr>
                </table>
<br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT [ItemId]
      ,[Name]
      ,[Intro]
      ,[Detail]
      ,[IsPublic]
      ,[UserNumber]
	  ,count(*)as num
  FROM [dbo].[item-content]
  Where IsAccept=1 and Itemid=@ItemId
  group by Itemid,Name,Intro,Detail,IsPublic,UserNumber
  ">
            <SelectParameters>
                <asp:QueryStringParameter Name="ItemId" QueryStringField="ItemId" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:Panel ID="Panel1" runat="server" CssClass="p1" Visible="False">
        <div style="margin:10px 0">
        <span style="margin-top:20px;margin-left:200px;margin-right:160px;width:100px;text-align:center;font-size:24px">申请加入</span>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="20" Width="20" ImageUrl="~/img/Icon/close.png"  OnClick="ImageButton1_Click"/>
        </div>
        <textarea id="textarea1"  class="t" runat="server"></textarea>
        <asp:Button ID="Button2" runat="server" Text="提交" CssClass ="b" OnClick="Button2_Click"/>
    </asp:Panel>
<script type="text/javascript" src="../dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../dist/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('Content1_textarea1');
    editor.create();
</script>
</asp:Content>
