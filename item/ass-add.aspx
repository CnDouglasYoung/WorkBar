<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="ass-add.aspx.cs" Inherits="item_ass_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.min.css"/>
    <script type="text/javascript" src="../js/Calendar.js"></script> 
    <style type="text/css">
       td{
           padding :10px;
          font-size:medium;
       }
        .auto-style1 {
            width: 720px;
        }
        
        .auto-style3 {
            width: 63px;
        }
                
        .auto-style7 {
            width: 592px;
        }
        
        .auto-style12 {
            width: 193px;
        }
        
        </style>
    <asp:HiddenField ID="HiddenField1" runat="server" Value="" />
    <asp:Panel ID="Panel5" runat="server"　 ScrollBars="Vertical" Height="633px">
    <asp:Panel ID="Panel1" runat="server">
        
     <!--项目列表-->
    <div class="kuang">
        <p class="biaoti">
            添加任务
        </p>
        <table class="auto-style1">
            <tr>
             <td class="auto-style12">
                 
                 <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-Size="Medium" Height="24px" Text="所属项目：" Width="81px"></asp:Label>
                 <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" BackColor="#ECF0F5" CssClass="Ldrop" DataSourceID="SqlDataSourcea" DataTextField="Name" DataValueField="ItemId" Font-Size="Medium" OnDataBinding="DropDownList1_DataBinding" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="170px">
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSourcea" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Item.Name, Item.ItemId
FROM      Item_User INNER JOIN
                Item ON Item_User.ItemId = Item.ItemId
WHERE   Item_User.UID=@UID AND Item_User.IsAccept=1">
                     <SelectParameters>
                         <asp:SessionParameter Name="UID" SessionField="UID" />
                     </SelectParameters>
                 </asp:SqlDataSource>
                 </td>
                <td class="auto-style3">
                 <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl="~/img/Icon/1.png" Width="50px" />
                 
            </td>
            </tr>
    <!--任务列表-->
            <tr>
             <td class="auto-style12">
    <asp:Label ID="Label2" runat="server" Text="任务分组：" BorderStyle="None" Font-Size="Medium" Height="24px" Width="81px"></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="Ldrop"  Width="170px" BackColor="#ECF0F5" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="ListId"   Font-Size="Medium"  AutoPostBack="True" ></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT ListId, Name 
FROM List 
WHERE (BelongItem = @ItemId)">
        <SelectParameters>
            <asp:SessionParameter Name="ItemId" SessionField="ItemId" />
        </SelectParameters>
    </asp:SqlDataSource>
     <br />
                 </td>
            </tr>
    <!--任务名-->
            <tr>
             <td class="auto-style12">
    <span class="xuan">任务名：</span><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
            </td>
            </tr>
     <!--开始时间-->
      <tr>
             <td class="auto-style12">
    <span class="xuan">开始时间：</span><asp:TextBox ID="TextBox2" runat="server"   onclick="SelectDate(this)"></asp:TextBox>

    <br />
            </td>
            </tr>
     <!--结束时间-->
            <tr>
             <td class="auto-style12">
    <span  class="xuan">结束时间：</span><asp:TextBox ID="TextBox3" runat="server"  onclick="SelectDate(this)"></asp:TextBox>
     <br />
            </td>
            </tr>
            <tr>
             <td class="auto-style12">
     <asp:CheckBox ID="CheckBox1" runat="server" Text="是否为重要任务" />
     <br />
            </td>
            </tr>
            <tr>
             <td class="auto-style12">
     <span class="xuan">任务详情：</span><br />
                 </td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea id="TextArea1" runat="server" name="S1" style="height: 100px; width: 555px"></textarea><br /> </td>
            </tr>
            <tr>
                <td style="padding-left: 300px;" class="auto-style12">
                    <asp:Button ID="Button1" runat="server" Text="下一步" OnClick="Button1_Click" CssClass="tijiao" />
                </td>
                
            </tr>
        </table>
        </div>
        
    </asp:Panel>
    <!-------------------------------2------------------------------>
    <div class ="kuang" style="width: 720px">
        <asp:Panel ID="Panel2" runat="server" Visible="False">
         <hr />
            <table style="width: 720px">
                <tr><td class="auto-style7">
                   添加参与人：
                             
                    
                </td>
                    <td>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/img/Icon/2.png" Width="50px" Height="50px" />
                        </td>
                </tr>
                <tr><td class="auto-style7">
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Item_User.UID, User_.Name
FROM      Item_User INNER JOIN
                User_ ON Item_User.UID = User_.UID INNER JOIN
                Assignment ON Item_User.ItemId = Assignment.BelongItem
WHERE   (Item_User.IsAccept = 1) AND (Assignment.AssId = @AssId) AND(Item_User.UID<>@UID)" >
           
            <SelectParameters>
                <asp:ControlParameter Name="AssId" ControlID="HiddenField1" />
                <asp:SessionParameter Name ="UID" SessionField="UID" />
            </SelectParameters>
        </asp:SqlDataSource>
                  <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound" RepeatColumns="5">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server"  Text='<%# Eval("Name") %>'/>                
                        <asp:HiddenField ID="HiddenField1" runat="server"  Value='<%# Eval("UID") %>'/>&nbsp;&nbsp;&nbsp;&nbsp;
                    </ItemTemplate>
        </asp:DataList>
                  <br />
                    </td></tr>
                <tr><td style="padding-left: 300px">
                  <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="下一步" CssClass="tijiao" />
            </td></tr></table>
                    
    </asp:Panel></div>
      <div class ="kuang">
    <asp:Panel ID="Panel3" runat="server" Visible="False">
         <hr /><table>
             <tr><td class="auto-style7">
                  添加/删除标签:
                 </td>
                 <td>
                     <asp:Image ID="Image3" runat="server" Height="50px" ImageUrl="~/img/Icon/3.png" Width="50px" />
                 </td>
             </tr>
             <tr><td class="auto-style7">
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div  style="background-color:#8775a7; padding :2px 5px;margin-right:5px">
                    <asp:Label ID="TagNameLabel" runat="server" Text='<%# Eval("TagName") %>' ForeColor="White" />
                    <asp:ImageButton ID="ImageButton1" runat="server" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %> ' OnClick="ImageButton1_Click" ImageUrl="~/img/Icon/close_w.png" Height="10" Width="10" />
                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("TagId") %>' />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Tag.TagName,Tag.TagId
FROM      Tag INNER JOIN
                Ass_Tag ON Tag.TagId = Ass_Tag.TagId
WHERE   (Ass_Tag.AssId = @AssId)">
            <SelectParameters>
                <asp:ControlParameter Name="AssId" ControlID="HiddenField1" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" Text="请输入标签名"
            OnFocus="javascript:if(this.value=='请输入标签名') {this.value=''}"
            OnBlur="javascript:if(this.value==''){this.value='请输入标签名'}">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </asp:TextBox>
        <asp:Button ID="Button5" runat="server" Text="添加" OnClick="Button5_Click" BackColor="#3C8DBC" CssClass="tijiao" Font-Size="Medium" Height="25px" Width="58px" /><br />
        </td>
                 <td>&nbsp;</td>
             </tr>
             <tr><td style="padding-left: 300px" >
                 <asp:Button ID="Button2" runat="server" Text="下一步" OnClick="Button2_Click" CssClass="tijiao" />
   </td>
                 <td>&nbsp;</td>
             </tr></table>
                  </asp:Panel>
          </div>
        <div class="kuang ">
    <asp:Panel ID="Panel4" runat="server" Visible="False" Width="730px">
        <hr /><table><tr><td class="auto-style7">
            负责人权限：</td> 
            <td>
                <asp:Image ID="Image4" runat="server" Height="50px" ImageUrl="~/img/Icon/4.png" Width="50px" />
            </td>
            </tr>
            
                </tr>
            <tr><td class="auto-style7">
        <asp:CheckBox ID="CheckBox2" runat="server"  Text="点击转让负责人权限" OnCheckedChanged="CheckBox2_CheckedChanged"  AutoPostBack="true"/>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="UID" CellPadding="0" CellSpacing="0" RepeatDirection="Horizontal" Visible="False" RepeatColumns="5" Width="500px"></asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   User_.Name,User_.UID
FROM      Assignment INNER JOIN
                Item_User ON Assignment.BelongItem = Item_User.ItemId INNER JOIN
                User_ ON Item_User.UID = User_.UID
WHERE   (Assignment.AssId = @AssId) and (User_.UID<>@UID)">
                    <SelectParameters>
                        <asp:ControlParameter Name="AssId" ControlID="HiddenField1" />
                        <asp:SessionParameter Name="UID" SessionField="UID" />
                    </SelectParameters>
                    </asp:SqlDataSource>
                </td></tr>
            <caption>
                &nbsp;</tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="Button7" runat="server" CssClass="tijiao" OnClick="Button7_Click" Text="完 成" />
                    </td>
                    
                </tr>
            </caption>
        </table>
                </asp:Panel>
            </div>
        </asp:Panel>
    
    <script type="text/javascript" src="../dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../dist/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('ContentPlaceHolder1_TextArea1');
    editor.create();
    var div = document.getElementById('ContentPlaceHolder1_Panel5');
    div.scrollTop = div.scrollHeight;
</script>
</asp:Content>

