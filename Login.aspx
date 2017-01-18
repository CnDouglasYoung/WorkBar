<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 310px;
        }
        .title{
            font-weight: bold; 
            font-size: large; 
            color: #314362;             
            text-align: center;
            border: 1px dotted black;
            width: 50%;
            font-family: 'Microsoft YaHei UI Light'
        }
        .t1{
            font-family: 'Microsoft YaHei UI Light'
        }
        .button{
            height:20px;
            width:60px;
            margin:0 auto;
        }
        .auto-style2 {
            width: 100%;
        }
        .ab {
            background-image:url(doge.jpg)
        }
   *{ margin:0px; padding:0px;font-family:'Microsoft YaHei UI';font-size:small}
/*上面部分*/
 #shangbian { background-color:#1e282c; width:960px; height:40px;filter:alpha(opacity=50);  
      -moz-opacity:0.5;  
      -khtml-opacity: 0.5;  
      opacity: 0.5; z-index:3;
      position:absolute;
        top: 0px;
        left: 0px;
    }
 #logo {list-style:none;font-family:'Bauhaus 93';color:white;font-size:30px;position:absolute;
        top: 0px;
        left: 38px;
        
       }
    #banquan {width:960px;
              height:100px;
              background-color:#1e282c;
              position:absolute;
              top:537px;
              left:0px;
              
             
    }
    .xia {float:left;
          margin:20px 40px;
    
    }
    #ha {position:absolute;
        top: 13px;
        left: 760px;
    }
    
    ul {
        list-style:none
    }
    .xia ul li {margin:3px 3px 3px 7px
    }
    #ha ul li {margin: 3px 3px 3px 7px;
    }
    a {text-decoration:none;
       color :#808080
    }
    a:hover {text-decoration:none;color:white

    }
    #zuobian {position:absolute;
              right:0px;
        top: 0px;
        width: 786px;
      
        height: 40px;
    }
        #zuobian ul {height:40px;list-style:none
        }
        #zuobian ul li {width:50px; float:left;height:20px;color :white;padding:15px 10px 5px ;
        }
        #zuobian ul li:hover {color:#FFF; background-color:#666666;
            }
    #sps {margin-left:435px;
    }
    #sp {position:absolute;
        top: 15px;
        left: 664px;
        width: 53px;
    }
   
    #banquanye {width:960px;
              height:43px;
              background-color:black;
              position:absolute;
              top:637px;
              left:0px;
    }
    #bq{color:white;
        text-align:center;
        margin:10px
    }
    .auto-style1 {
        height: 35px;
    }
        .dlk {z-index:1000;
              position:absolute;
              top:145px;
              left:315px;
            filter: alpha(opacity=40);  
    background-color: rgb(255, 255, 255);  
      
    background-color: rgba(255, 255, 255, 0.2);  

      
        }
         .dlk2 {z-index:1000;
              position:absolute;
              top:245px;
              left:315px;
            filter: alpha(opacity=40);  
    background-color: rgb(255, 255, 255);  
      
    background-color: rgba(255, 255, 255, 0.2);  

      
        }
</style>
</head>
<body>
<form id="form2" runat="server">

<div id="beijing">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/fc6268ae3f56b5680c987a07f1fdfc7e44f80eb54fa75-uLyKaF_fw658.jpg" Height="537px" Width="960px" />
     <div style="margin:5px; background-color: #eeeeee;">    
          
     </div>
            <!--  登录控件  -->
    

                
                <div id="dlk" class="dlk"  style="margin:5px; width: 312px;" runat="server">
                   
                    <table id="t1" class="auto-style1" style="padding:10px;" runat="server">
                        <tr>
                            <td colspan="2" class="title" style="border-color: #F29503; border-style: none none outset none; padding: 5px; margin: 0px; font-family: 'Microsoft YaHei UI Light'; color: #FFFFFF; font-size: large; word-spacing:8px; letter-spacing: 10px;">workbar</td>
                        </tr>                        
                        <tr>
                            <td colspan="2" class="t1" style="padding: 10px 5px 0px 5px; color: #FFFFFF;">用户名：</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 5px">
                                <asp:TextBox ID="TextBox1" runat="server" Width="270px" OnTextChanged="TextBox1_TextChanged" BorderStyle="None" BackColor="White"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="t1" style="padding: 10px 5px 0px 5px; color: #FFFFFF;">密码：</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 5px">
                                <asp:TextBox ID="TextBox2" runat="server" Width="270px" TextMode="Password" OnTextChanged="TextBox2_TextChanged" BorderStyle="None" BackColor="White"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 5px">
                                <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Smaller">&nbsp</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td  style="padding: 5px;text-align: center;">
                                <asp:Button ID="Button2" runat="server" Text="登录"  OnClick="Button2_Click" Font-Size="Medium" Height="25px" Width="80px" Font-Names="Microsoft YaHei UI Light" BackColor="#F29503" BorderStyle="None" ForeColor="White" />
                            </td>
                            <td  style="padding: 5px;text-align: center;">
                                <asp:Button ID="Button1" runat="server" Text="注册"  Font-Size="Medium" Height="25px" Width="80px" OnClick="Button1_Click" Font-Names="Microsoft YaHei UI Light" BackColor="#F29503" BorderStyle="None" ForeColor="White"/>
                            </td>
                            
                        </tr>
                    </table>
                    </div>
    <div id="Div1" class="dlk2"  style="margin:5px; width: 312px;" runat="server" visible="false">
<asp:Button ID="Button3" Font-Size="Medium" Height="40px" Width="312px" runat="server" Text="点击进入工作板" Font-Names="Microsoft YaHei UI Light" BackColor="#F29503" BorderStyle="None" ForeColor="White" PostBackUrl="~/item/item-list.aspx" Visible="False" />
 </div>
<div id="shangbian">        
<p id="logo">workbar</p>
    <div id="zuobian">
        <ul>
    <li><asp:HyperLink ID="HyperLink2" runat="server" ForeColor="White" NavigateUrl="~/Login.aspx">首页</asp:HyperLink></li>  
            <li> <a href="#" style="color: #FFFFFF">功能</a></li> 
            <li> <a href="#" style="color: #FFFFFF">Blog</a></li> 
    <li><asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" NavigateUrl="~/market/Default.aspx">集市</asp:HyperLink></li> 
   
    <li id ="sps"><asp:Label ID="Label2" runat="server" Text="用户名" ForeColor="White"></asp:Label></li> 
         </ul> 
        <p id="sp" style="color: #FFFFFF">欢迎您：</p>
     </div> 
    
         
</div> 
 <div id="banquan">
     <div class="xia">
     <ul>
<li><a href="#">workbar首页</a></li>
<li><a href="#">官方博客</a></li>

</ul>  
         </div> 
        <div class="xia">
     <ul>
<li><a href="#">联系与合作</a></li>

<li><a href="#">用户反馈</a></li>

</ul>  
         </div> 

        <div class="xia">
     <ul>
<li><a href="#">关于我们</a></li>
<li><a href="#">开源代码</a></li>
<li><a href="#">隐私条款</a></li>

</ul>  
         </div> 


       <div id="ha">
     <ul>
<li><a href="#">关注我们</a></li>
<li><a href="#">新浪微博：@workbar</a></li>
<li><a href="#">官方 QQ：741696455</a></li>
<li><a href="#">官方微信：</a></li>
</ul>  
         </div> 
    
</div>  
    <div id="banquanye">
        <p id="bq">Copyright © 2013-2016 workbar苏ICP备11014111号-2</p>
        </div>









</form>
</body>
</html>
