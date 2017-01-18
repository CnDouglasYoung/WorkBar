<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="user-install.aspx.cs" Inherits="user_install" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style type="text/css">
          .p1{
            position:fixed;
            left:40%; 
top:40%; 
z-index:200;
            width:400px; height:250px; 
            margin:-100px 0px 0px -250px; 
            background-color:rgba(0,0,0,0.7); 
        }
        .t{
            position:fixed;
            left:50%; top:50%; z-index:200;
            width:400px;height:300px;
            margin:-150px 0px 0px -200px; 
        }
        .b2{
            margin:10px 200px;
            width:100px;height:30px
        }
          .auto-style1 {
              width: 100%;
          }
           td{
           padding :10px;
          font-size:medium;
       }
          .auto-style2 {
              width: 250px;
          }
          .auto-style3 {
              width: 265px;
          }
    </style>
    <div class="kuang">
        <p class="biaoti">
            个人设置
        </p>
        <table>
       <tr><td>
      用户名：<asp:Label ID="Label2" runat="server" Text="Label" Font-Size="Medium"></asp:Label>
      </td></tr>
       <tr><td> 
      密码：<asp:Button ID="Button1" runat="server" Text="点击修改密码" OnClick="Button1_Click" Width="117px" BackColor="#ECF0F5" BorderStyle="None" Font-Size="Medium" Height="22px" />
    </td></tr>
       <tr>
              <td style="vertical-align: top">E-Mail：
              <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True"  Width="312px"></asp:TextBox>
                  
              </td>
          </tr>
          <tr>
              <td style="vertical-align: top">个人简介：
              <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Width="300px"></asp:TextBox>
             &nbsp;
    <asp:Button ID="Button3" runat="server" Text="保存" OnClick="Button3_Click" CssClass="tijiao" />
       </td></tr>
       <tr><td> 
    头像：</br>
    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="T"  /><img alt="" src="img/T1.png" />
    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="T"  /><img alt="" src="img/T2.png" />
    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="T"  /><img alt="" src="img/T3.png" />
    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="T"  /><img alt="" src="img/T4.png" />
 
           <asp:Button ID="ButtonTX" Text ="保存" runat="server" OnClick="ButtonTX_Click" CssClass="tijiao" />
    </td></tr>
    </table>
          
    <hr /><span style ="font-size:medium">个人标签：</span>
         <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div  style="background-color:#44B6AE; padding :2px 5px;margin-right:5px">
                    <asp:Label ID="TagNameLabel" runat="server" Text='<%# Eval("TagName") %>' ForeColor="White" />
                    <asp:ImageButton ID="ImageButton1" runat="server" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %> ' OnClick="ImageButton1_Click" ImageUrl="~/img/Icon/close_w.png" Height="10" Width="10" />
                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("TagId") %>' />
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Tag.TagName,Tag.TagId
FROM      Tag INNER JOIN
                User_Tag ON Tag.TagId = User_Tag.TagId
WHERE   (User_Tag.UID = @UID)">
            <SelectParameters>
                <asp:SessionParameter Name="UID" SessionField="UID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" Text="请输入标签名"
            OnFocus="javascript:if(this.value=='请输入标签名') {this.value=''}"
            OnBlur="javascript:if(this.value==''){this.value='请输入标签名'}">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </asp:TextBox>
        <asp:Button ID="Button5" runat="server" Text="添加" OnClick="Button5_Click" CssClass="tijiao" /><br />
    
        <asp:Panel ID="Panel1" runat="server" CssClass="p1" Visible="False">
        <div style="margin:10px 0">
        <span style="margin-top:20px;margin-left:150px;margin-right:120px;width:100px;text-align:center;font-size:24px; color: #FFFFFF;">修改密码</span>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="20" Width="20" ImageUrl="~/img/Icon/close_w.png"  OnClick="ImageButton2_Click"/>
        </div>
            <table class="auto-style1">
                <tr>
                    <td style="font-size: medium; color: #FFFFFF; padding-left: 70px;" class="auto-style3">原密码：<asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="font-size: medium; color: #FFFFFF; padding-left: 70px;" class="auto-style3">新密码：<asp:TextBox ID="TextBox5" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="font-size: medium; color: #FFFFFF; padding-left: 70px;" class="auto-style3">确认新密码：<asp:TextBox ID="TextBox6" runat="server" TextMode="Password" Width="117px"></asp:TextBox></td>
                <tr><td style="padding-left: 150px" >
                    
        <asp:Button ID="Button2" runat="server" Text="修改" CssClass ="tijiao" OnClick="Button2_Click"/>
    </td></tr>
            </table></asp:Panel>
        </div>
</asp:Content>

