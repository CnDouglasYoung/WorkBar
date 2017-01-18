<%@ Page Title="" Language="C#" MasterPageFile="~/master/item.master" AutoEventWireup="true" CodeFile="file.aspx.cs" Inherits="item_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style type="text/css">

          .biao {margin:10px
          }

    </style>
    <div style="border-style: none; margin: 15px;">
        <p class="biaoti" style="margin-bottom: 10px">
            项目文件
         
           <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/item/file-add.aspx" style="position:absolute; top: 59px; left: 700px;" CssClass="LB" ToolTip="添加日程">
               <img src="../img/Icon/add.png" alt="" style="width: 25px; height: 25px; vertical-align: bottom;" /><span style="font-size:15px"></span>
           </asp:LinkButton> 
        </p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="727px" AllowPaging="True" BorderColor="#FF6600"  BorderStyle="None" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged3">
            <AlternatingRowStyle BackColor="#DED9FF" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="FileName" DataNavigateUrlFormatString="~/file/{0}" DataTextField="FileName" Text="文件名" HeaderText="文件名" ControlStyle-ForeColor="#30383B" >
<ControlStyle ForeColor="#30383B"></ControlStyle>
            </asp:HyperLinkField>
            <asp:BoundField DataField="Name" HeaderText="上传用户名" SortExpression="Name" />
            <asp:BoundField DataField="CreateTime" HeaderText="创建时间" SortExpression="CreateTime" />
        </Columns>
            <HeaderStyle BackColor="#4889AE" Font-Size="Medium" ForeColor="White" HorizontalAlign="Left" />
            <SortedAscendingCellStyle CssClass="biao" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT File_.FileName, User_.Name, File_.CreateTime 
    FROM File_ INNER JOIN User_ ON File_.BelongUID = User_.UID
    Where File_.BelongItemId=@ItemId">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="ItemId" SessionField="ItemId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>

