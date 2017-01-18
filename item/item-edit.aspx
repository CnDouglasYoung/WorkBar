<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="item-edit.aspx.cs" Inherits="item_item_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .auto-style2{
            
            padding :10px;
          
        }
        .auto-style3 {
            height: 48px;
        }
        .kuang{
            margin:15px;
        }
        .xuan{
            font-size:medium;
        }
        .tijiao{
            background-color:#F08200;
            border-style:None;
            font-size:large;
           color:white;
           width:75px; 
        }
        .biaoti{
            font-size:x-large;
            border-bottom:solid;
            border-color:#3c8dbc;
            padding-left:10px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../css/font.css" /> 
    <link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.min.css"/>
    <div class="kuang">
        <p class="biaoti">
            项目设置
        </p>
        <asp:Panel ID="Panel2" runat="server" Height="600px" ScrollBars="Vertical">
        <table  style="width:100%">
            
            
            <tr>
                <td class="auto-style2" style="vertical-align: top"><span class ="xuan">项目名</span></td>
                <td style="vertical-align: top" class="auto-style2"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top"><span class="xuan">项目简介</span></td>
                <td style="vertical-align: top" class="auto-style2"><asp:TextBox ID="TextBox3" runat="server" Height="19px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top"><span class="xuan">是否公开</span></td>
                <td style="vertical-align: top" class="auto-style2">
                    <asp:CheckBox ID="CheckBox1" runat="server"  onclick ="B()" Text="是" Checked="True" />
                    <asp:CheckBox ID="CheckBox2" runat="server"   onclick ="B()" Text="否"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top"><span class="xuan">项目预计人数</span></td>
                <td style="vertical-align: top" class="auto-style2"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top"><span class="xuan">项目图标</span></td>
                <td style="vertical-align: top">
                    <asp:Panel ID="Panel1" runat="server" Height="200px" ScrollBars="Auto">

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT IconCode FROM [Item_Icon]"></asp:SqlDataSource>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="9" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound" Width="560px">
                            <ItemTemplate>
                                <div>
                                <asp:RadioButton ID="RB"  CssClass="RBI" runat="server"  onclick = "A()"/>
                                <asp:Label ID="LB" CssClass="ItemIcon" runat="server" Text='<%# Eval("IconCode") %>' ForeColor="#0066FF"></asp:Label>&nbsp;
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top"><span class="xuan">项目标签</span></td>
                <td class="auto-style2" style="vertical-align: top">
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div  style="background-color:#8775a7; padding :2px 5px;margin-right:5px">
                    <asp:Label ID="TagNameLabel" runat="server" Text='<%# Eval("TagName") %>' ForeColor="White" />
                    <asp:ImageButton ID="ImageButton1" runat="server" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %> ' OnClick="ImageButton1_Click" ImageUrl="~/img/Icon/close_w.png" Height="10" Width="10" />
                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("TagId") %>' />
                </div>
            </ItemTemplate>
        </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Tag.TagName,Tag.TagId
FROM      Tag INNER JOIN
                Item_Tag ON Tag.TagId = Item_Tag.TagId
WHERE   (Item_Tag.ItemId = @ItemId)">
            <SelectParameters>
                <asp:SessionParameter Name="ItemId" SessionField="ItemId" />
            </SelectParameters>
        </asp:SqlDataSource>
               </td>
                </tr>
            <tr>
                <td></td>
                <td>
                            <asp:TextBox ID="TextBox4" runat="server" OnBlur="javascript:if(this.value==''){this.value='请输入标签名'}" OnFocus="javascript:if(this.value=='请输入标签名') {this.value=''}" Text="请输入标签名">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </asp:TextBox>
                            <asp:Button ID="Button5" runat="server" CssClass="tijiao" OnClick="Button5_Click" Text="添加" />
             </td>
            </tr>
            <tr>
                <td><span class="xuan">项目公告</span></td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Height="46px" Width="356px"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="发布"  CssClass="tijiao" OnClick="Button2_Click" />
                </td>
            </tr>
            <tr>
                <td  colspan="2" class="auto-style2" style="vertical-align: top" >
                    <span class="xuan">项目详情</span></td>
            </tr>
            <tr>
                <td  colspan="2" class="auto-style3" >
                    
                    <textarea id="textarea1" runat="server" style="max-height:300px;height:300px">
    <p>请输入内容...</p>
                    </textarea>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top; padding-left: 320px;" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="完成" OnClick="Button1_Click" CssClass="tijiao" />
                </td>
            </tr>
        </table>
        </asp:Panel>

<script type="text/javascript" src="../dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../dist/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('ContentPlaceHolder1_textarea1');
    editor.create();
</script>

     <script language="JavaScript" type="text/javascript">
         function A() {
             var dom = document.all;
             var ele = event.srcElement;
             if (ele.tagName == "INPUT" && ele.type.toLowerCase() == "radio") {
                 for (i = 0; i < dom.length; i++) {
                     if (dom[i].tagName == "INPUT" && dom[i].type.toLowerCase() == "radio") {
                         dom[i].checked = false;
                     }
                 }
             }
             ele.checked = true;
         }
         function B() {
             var dom = document.all;
             var ele = event.srcElement;
             if (ele.tagName == "INPUT" && ele.type.toLowerCase() == "checkbox") {
                 for (i = 0; i < dom.length; i++) {
                     if (dom[i].tagName == "INPUT" && dom[i].type.toLowerCase() == "checkbox") {
                         dom[i].checked = false;
                     }
                 }
             }
             ele.checked = true;
         }
      </script>
    </div>
</asp:Content>

