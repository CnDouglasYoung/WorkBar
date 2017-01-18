<%@ Page Title="" Language="C#" validateRequest="false" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="item-add.aspx.cs" Inherits="item_item_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .auto-style2{
            
            padding :10px;
          font-size:medium;
        }
        .auto-style3 {
            height: 48px;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="../css/font.css" /> 
    <link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.min.css"/>
    <div class="kuang">
        <p class="biaoti">
            添加项目
        </p>
        <asp:Panel ID="Panel2" runat="server" Height="600px" ScrollBars="Vertical">
        <table  style="width:100%">
            <tr>
                <td class="auto-style2" style="vertical-align: top">项目名</td>
                <td style="vertical-align: top" class="auto-style2"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top">项目简介</td>
                <td style="vertical-align: top" class="auto-style2"><asp:TextBox ID="TextBox3" runat="server" Height="19px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top">是否公开</td>
                <td style="vertical-align: top" class="auto-style2">
                    <asp:CheckBox ID="CheckBox1" runat="server"  onclick ="B()" Text="是" Checked="True" />
                    <asp:CheckBox ID="CheckBox2" runat="server"   onclick ="B()" Text="否"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top">项目预计人数</td>
                <td style="vertical-align: top" class="auto-style2"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top">项目图标</td>
                <td style="vertical-align: top">
                    <asp:Panel ID="Panel1" runat="server" Height="200px" ScrollBars="Auto">

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT IconCode FROM [Item_Icon]"></asp:SqlDataSource>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="9" RepeatDirection="Horizontal" Width="560px">
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
                <td  colspan="2" class="auto-style2" style="vertical-align: top" >
                    <span>项目详情</span></td>
            </tr>
            <tr>
                <td  colspan="2" class="auto-style3" >
                    
                    <textarea id="textarea1" runat="server" style="max-height:300px;height:300px">
    
                    </textarea>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="vertical-align: top; padding-left: 320px;" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="创建" OnClick="Button1_Click" CssClass="tijiao" />
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

