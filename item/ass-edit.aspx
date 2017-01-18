<%@ Page Title="" Language="C#" MasterPageFile="~/master/item.master" AutoEventWireup="true" CodeFile="ass-edit.aspx.cs" Inherits="item_ass_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
         td{
             padding-right:15px;
             padding-top:15px;
         }
         span{
             font-size:medium;
         }
         .xuanze{
             border-right-style:solid;
             border-right-color:#4889AE;
         }
         
     </style>
    <link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.min.css"/>
<script type="text/javascript" src="../js/Calendar.js"></script> 

    <table style="width: 100%; height: 600px">
        <tr>
            <td style="width: 94px">
                &nbsp;</td>
            <td rowspan="6" style="vertical-align: top">
             
          <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
              <asp:View ID="View1" runat="server">
                 <p class="biaoti">
                 基本属性
                 </p>
                  <table>  
                 <tr><td>
                 <span> 任务名</span><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                 </td></tr>
                 <tr><td>
                 <!--开始时间-->
                 <span>开始时间</span><asp:TextBox ID="TextBox2" runat="server"   onclick="SelectDate(this)"></asp:TextBox>
                </td></tr>
                 <tr><td>
                <!--结束时间-->
                <span>结束时间</span><asp:TextBox ID="TextBox3" runat="server"  onclick="SelectDate(this)"></asp:TextBox>
                </td></tr>
                 <tr><td>
                 <asp:CheckBox ID="CheckBox1" runat="server" Text="是否为重要任务" />
                 </td></tr>
                 <tr><td>
                 <span>任务详情</span>
                <br />
                <textarea id="TextArea1" runat="server" name="S1" style="height: 200px; width: 237px"></textarea>
                 </td></tr>
                 <tr><td>
                  <asp:Button ID="Button4" runat="server" Text="修改" OnClick="Button4_Click" CssClass="tijiao" />
              </td></tr>
                      </table>
                     </asp:View>
              <asp:View ID="View2" runat="server">
                  <p class="biaoti">
                 添加/删除参与人
                 </p>
                  <table>
                  <tr><td>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT   Item_User.UID, User_.Name
FROM      Item_User INNER JOIN
                User_ ON Item_User.UID = User_.UID INNER JOIN
                Assignment ON Item_User.ItemId = Assignment.BelongItem
WHERE   (Item_User.IsAccept = 1) AND (Assignment.AssId = @AssId)" >
           
            <SelectParameters>
                <asp:QueryStringParameter Name="AssId" QueryStringField="AssId" />
            </SelectParameters>
        </asp:SqlDataSource>
                  <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" OnItemDataBound="DataList1_ItemDataBound" RepeatColumns="5">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server"  Text='<%# Eval("Name") %>'/>                
                        <asp:HiddenField ID="HiddenField1" runat="server"  Value='<%# Eval("UID") %>'/>&nbsp;&nbsp;&nbsp;&nbsp;
                    </ItemTemplate>
        </asp:DataList>
                  </td></tr>
                  <tr><td>
                  <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="修改" CssClass="tijiao" />
                  </td></tr>
                      </table>
                      </asp:View>
              <asp:View ID="View3" runat="server">
                  <asp:HiddenField ID="HiddenField1" runat="server" />
                 <p class="biaoti">
                 添加/删除标签
                 </p>
                  <table>
                     <tr><td>
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div  style="background-color:#8775a7; padding :2px 5px;margin-right:5px">
                    <asp:Label ID="TagNameLabel" runat="server" Text='<%# Eval("TagName") %>' ForeColor="White" />
                    <asp:ImageButton ID="ImageButton1" runat="server" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %> ' OnClick="ImageButton1_Click" ImageUrl="~/img/Icon/close_w.png" Height="10" Width="10" />
                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("TagId") %>' />
                </div>
            </ItemTemplate>
        </asp:DataList>
                    </td></tr>
                     <tr><td>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Tag.TagName,Tag.TagId
FROM      Tag INNER JOIN
                Ass_Tag ON Tag.TagId = Ass_Tag.TagId
WHERE   (Ass_Tag.AssId = @AssId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="AssId" QueryStringField="AssId" />
            </SelectParameters>
        </asp:SqlDataSource>
                    </td></tr>
                     <tr><td>
        <asp:TextBox ID="TextBox4" runat="server" Text="请输入标签名"
            OnFocus="javascript:if(this.value=='请输入标签名') {this.value=''}"
            OnBlur="javascript:if(this.value==''){this.value='请输入标签名'}">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </asp:TextBox>
                         <asp:Button ID="Button5" runat="server" CssClass="tijiao" OnClick="Button5_Click" Text="添加" />
                     </td></tr>
                     <tr><td>
                         &nbsp;</td></tr>
                      </table>
                         </asp:View>
              <asp:View ID="View4" runat="server">
                    <p class="biaoti">
                  转让负责人权限
                 </p>
                  <table>
                      <tr>
                          <td>
                              <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellPadding="0" CellSpacing="0" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="UID" RepeatColumns="5" RepeatDirection="Horizontal" Visible="True" Width="500px">
                              </asp:RadioButtonList>
                              <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   User_.Name,User_.UID
FROM      Assignment INNER JOIN
                Item_User ON Assignment.BelongItem = Item_User.ItemId INNER JOIN
                User_ ON Item_User.UID = User_.UID
WHERE   (Assignment.AssId = @AssId) and (User_.UID&lt;&gt;@UID)">
                                  <SelectParameters>
                                      <asp:QueryStringParameter Name="AssId" QueryStringField="AssId" />
                                      <asp:SessionParameter Name="UID" SessionField="UID" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <asp:Button ID="Button7" runat="server" CssClass="tijiao" OnClick="Button7_Click" Text="点击修改" />
                          </td>
                      </tr>
                    </table>
                             </asp:View>
          </asp:MultiView>
            </td>
        </tr>
        <tr>
            <td style="width: 94px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="基本属性" BackColor="#DED9FF" BorderStyle="None" ForeColor="Black" Height="40px" Width="130px" CssClass="xuanze" />
            </td>
        </tr>
        <tr>
            <td style="width: 94px">
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="添加/删除参与人" BackColor="#DED9FF" BorderStyle="None" ForeColor="Black" Height="40px" Width="130px" />
            </td>
        </tr>
        <tr>
            <td style="width: 94px">
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="添加/删除标签" BackColor="#DED9FF" BorderStyle="None" ForeColor="Black" Height="40px" Width="130px" />
            </td>
        </tr>
        <tr>
            <td style="width: 94px">
                <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="转让负责人权限" BackColor="#DED9FF" BorderStyle="None" ForeColor="Black" Height="40px" Width="130px" />
            </td>
        </tr>
        <tr>
            <td style="width: 94px;height:400px">&nbsp;</td>
        </tr>
    </table>
<script type="text/javascript" src="../dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../dist/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('ContentPlaceHolder1_ContentPlaceHolder1_TextArea1');
    editor.create();
</script>
</asp:Content>

