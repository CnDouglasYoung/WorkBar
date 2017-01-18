<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="item-list.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .LB{
            background-image:url('../img/blue.png');
            position:absolute;
            top:17px;
            left: 90px;
            width: 471px;
        }
       
        .lasticon{
            
             position:absolute;
             top:20px;
             left:650px;
            height: 25px;
            width: 25px;
        }
       .ItemIcon{
           
           margin-right:10px;
       }
        .auto-style2 {
            position: relative;
            width: 656px;
            top: 23px;
            left: 2px;
            border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
        }
        #yuanjiao{
            border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../css/font.css" /> 
    <div style="margin:15px 15px 15px 5px; ;float:left; height: 621px;">
        <p class="biaoti">
            &nbsp;&nbsp;
            个人项目
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/item/item-add.aspx" style="position:absolute; top: 18px; left: 700px;" ToolTip="添加项目">
               <img src="../img/Icon/add.png" alt="" style="width: 25px; height: 25px; vertical-align: bottom;" /><span style="font-size:15px"></span>
           </asp:LinkButton>
        </p>
        <asp:Panel ID="Panel1" runat="server" Height="585px" ScrollBars="Vertical">
        <asp:DataList ID="DataList1" runat="server" CellSpacing="10" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" Width="660px">
            <ItemTemplate>
                <table id="yuanjiao" style="width: 702px; margin-right: 15px;">
                    <tr>
                        
                        <td style="background-color:#3c8dbc; text-align:left; vertical-align: top;padding:5px 20px 5px 5px; " class="auto-style2">
                                  &nbsp;&nbsp;
                                 <asp:Label ID="Label2" CssClass ="ItemIcon" runat="server" Text='<%# Eval("IconCode") %>' BorderStyle="None" ></asp:Label>
                                 <asp:LinkButton ID="youduba" runat="server" Text='<%# Eval("Name") %>'   Font-Size="X-Large"   ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>' OnClick="Button1_Click" ForeColor="White" BorderStyle="None"  />
                                 <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" Width="25px" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>'  OnClick="ImageButton1_Click" Visible="False" ImageUrl="~/img/Icon/setw.png" CssClass="lasticon" ToolTip="编辑项目"  />
                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemId") %>' Visible="False"></asp:Label>
                        </td>
                    </tr>    
                </table>

            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Item.ItemId, Item.Name,Item.IconCode,Item.CreateTime
FROM      Item INNER JOIN
                Item_User ON Item.ItemId = Item_User.ItemId
WHERE   (Item_User.UID = @UID) AND (Item_User.IsAccept = 1)
ORDER BY Item.CreateTime">
            <SelectParameters>
                <asp:SessionParameter Name="UID" SessionField="UID" />
            </SelectParameters>
        </asp:SqlDataSource>
            <asp:ImageButton ID="ImageButton2" runat="server"  Visible="false" ImageUrl="~/img/item.png" Width="730" PostBackUrl="~/market/Default.aspx" /> 

        </asp:Panel>
    </div>
</asp:Content>

