<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="ass-add1.aspx.cs" Inherits="item_ass_add1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type="text/javascript" src="../js/Calendar.js"></script> 
    <style type="text/css">
       td{
           padding :10px;
          font-size:medium;
       }
    </style>
     <!--项目列表-->
    <div class="kuang">
        <p class="biaoti">
            添加任务
        </p>
        <table class="auto-style1">
            <tr>
             <td>
              <asp:Label ID="Label1" runat="server" Text="所属项目：" BorderStyle="None" Font-Size="Medium" Height="24px" Width="81px"></asp:Label>
             
               <asp:DropDownList ID="DropDownList1" runat="server" CssClass="Ldrop"  Width="170px" BackColor="#ECF0F5" DataSourceID="SqlDataSourcea" DataTextField="Name" DataValueField="ItemId"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Font-Size="Medium" OnDataBinding="DropDownList1_DataBinding" AutoPostBack="True" ></asp:DropDownList>
            
            <asp:SqlDataSource ID="SqlDataSourcea" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Item.Name, Item.ItemId
FROM      Item_User INNER JOIN
                Item ON Item_User.ItemId = Item.ItemId
WHERE   Item_User.UID=@UID AND Item_User.IsAccept=1">
         <SelectParameters>
                <asp:SessionParameter Name="UID" SessionField="UID" />
         </SelectParameters>
    </asp:SqlDataSource>
    <br />
            </td>
            </tr>
    <!--任务列表-->
            <tr>
             <td>
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
             <td>
    <span class="xuan">任务名：</span><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
            </td>
            </tr>
     <!--开始时间-->
      <tr>
             <td>
    <span class="xuan">开始时间：</span><asp:TextBox ID="TextBox2" runat="server"   onclick="SelectDate(this)"></asp:TextBox>

    <br />
            </td>
            </tr>
     <!--结束时间-->
            <tr>
             <td>
    <span  class="xuan">结束时间：</span><asp:TextBox ID="TextBox3" runat="server"  onclick="SelectDate(this)"></asp:TextBox>
     <br />
            </td>
            </tr>
            <tr>
             <td>
     <asp:CheckBox ID="CheckBox1" runat="server" Text="是否为重要任务" />
     <br />
            </td>
            </tr>
            <tr>
             <td>
     <span class="xuan">任务详情：</span><br />
                 </td>
            </tr>
            <tr>
             <td>
    <textarea id="TextArea1" runat="server" name="S1" style="height: 100px; width: 300px"></textarea><br />
       </td>
            </tr>
            <tr>
                <td class="auto-style3" style="vertical-align: top">
                    <asp:Button ID="Button1" runat="server" Text="下一步" OnClick="Button1_Click" CssClass="tijiao" />
                </td>
                
            </tr>
        </table>
        </div>
</asp:Content>

