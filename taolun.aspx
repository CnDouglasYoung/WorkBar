<%@ Page Language="C#" AutoEventWireup="true" CodeFile="taolun.aspx.cs" Inherits="taolun" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<style type="text/css">
   
    *{ margin:0px; padding:0px;font-family:'Microsoft YaHei UI';font-size:small}
/*上面部分*/
 #shanglan { background-color:#3c8dbc; width:960px; height:40px;}
 #logo {list-style:none;font-family:'Bauhaus 93';color:white;font-size:30px;position:absolute;
        top: 0px;
        left: 38px;
    }
 #sousuokuang {position:absolute;
        top: 5px;
        left: 550px;
        width: 165px;
        height: 25px;
    }
 #sousuo {position:absolute;
        top: 5px;
        left: 730px;
        height: 25px;
        width: 25px;
    }
 #tianjia {position:absolute;
              top: -28px;
        left: 804px;
    }
 #jishi {position:absolute;
            top: 10px;
        left: 860px;
    }
 #shezh {position:absolute;
             top:10px;
             left:900px;
    }
#tj{ width:165px; 
height:200px; margin:0; 
position:absolute;
             top:10px;
             left:795px;
             z-index:1000
    }
#tj ul{ list-style:none;}
#tj ul li{ width:40px; text-align:center; position:relative; float:left;height:37px;
        top: 0px;
        left: 0px;
    }
.c{ text-decoration:none; color:#ffffff; display:block; width:60px;}
.c:hover{ color:#FFF; background-color:#666666;}
#tj ul li ul li{ float:none;background-color:#3c8dbc;text-align:center;margin-top:2px; line-height:30px;width:60px} 
#tj ul li ul{background-color:#3c8dbc;
    width:60px; position:absolute;
        top: 28px;
        left: -9px;
       display:none;
}
#tjli:hover ul{display:block}
#shezhi {background-color:#3c8dbc;
width:100px;
height: 117px; 
position:absolute;
        top: 28px;
        right:-30px;
 /*-moz-border-radius: 15px; 
  -webkit-border-radius: 15px; 
  border-radius:15px;*/ 
 display:none;
    }
.arrow-up {
    width:0; 
    height:0; 
    border-left:10px solid transparent;
    border-right:10px solid transparent;
    border-bottom:10px solid #3c8dbc;
    position:absolute;
        top: 23px;
        left: 11px;
        display:none;
    }
#szli:hover #shezhi{display:block}
#szli:hover .arrow-up{display:block}

 #sz {height:46px;
         width:100px;
         padding:0px;
         margin:0px;
    } 

.d{ text-decoration:none; color:#ffffff; display:block; text-align:center;}
.d:hover{ color:#1e282c;}



div.icon 
{
width:60px;
height:60px;
display:block;
position: relative;
float:left;
padding: 0px;
margin:5px 20px;
background:#3c8dbc;
}
 
div.icon_head
{
width:60px;
height: 60px;
display:block;
position: relative;
float:left;
padding: 0px;
margin: 0px;
background: #bde9df;
border-radius:75px;
-webkit-border-radius:75px;
-moz-border-radius:75px;
-o-border-radius:75px;
-webkit-background-clip:padding; 
overflow:hidden;
}
 
a.trans_name
{
width:60px;
height: 60px;
display:block;
position: absolute;
left: 0px;
bottom: 0px;
padding: 0px;
margin: 0px;
z-index:1;
filter: Alpha(Opacity=0);
opacity:0; 
}
 
span.icon_translucent
{
width:60px;
height: 30px;
display:block;
position: absolute;
left: 0px;
bottom: 0px;
padding: 0px;
background: #000000;
z-index:2;
filter: Alpha(Opacity=50);
opacity:0.5;
        margin-left: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
    }
span.icon_name
{
width:60px;
height: 30px;
display:block;
position: absolute;
left: 0px;
bottom: 0px;
padding: 0px;
margin: 0px;
color: #ffffff;
font-size: 16px;
text-align: center;
line-height: 20px;
z-index:3;
}

 
a.trans_name:hover 
{
filter: Alpha(Opacity=100);
opacity:1; 
}

/*左边部分*/
#menu{ background-color:#1e282c; width:200px; height:640px; margin:0 ;}
#menu ul{ list-style:none;}
#menu ul li{ line-height:40px; text-align:center; position:relative;}
.b{ text-decoration:none; color:#ffffff; display:block; width:200px;}
.b:hover{ color:#FFF; background-color:#666666;}
#menu ul li ul li{ float:none;background-color:#1e282c; margin-top:2px;} 
#menu ul li ul{width:200px; position:absolute;
        top: -1px;
        left: 201px;
       display:none;
       z-index:1000
         }
#menu ul li:hover ul{display:block}
/*中间部分*/       
.back {background-color:#ecf0f5; width:760px; height:640px;position:absolute;
        top: 40px;
        left: 200px;
    }
    #zhezhao {
        filter: alpha(opacity=40);   
    background-color: rgba(0, 0, 0, 0.5);  
        position: absolute;
        top:0px;
        left:0px;
        height :680px;
        width:960px;
        z-index: 1000;
    }
 #liaotiankuang{
     height:563px;
     width:700px;
     position:absolute;
     top:80px;
     left:230px;
     background-color:#ecf0f5;

 }

    .auto-style1 {
        width: 100%;
        height: 100%;
    }

    .auto-style2 {
        width: 160px;
    }
    .auto-style3 {
        width: 160px;
        height: 46px;
    }
    .auto-style4 {
    }
#icon
{
width:100px;
height:100px;
display:block;
position: relative;
float:left;
padding: 0px;
margin:5px 30px;
background:  #1E282C;
}
#icon_head{
width:100px;
height: 100px;
display:block;
position: relative;
float:left;
padding: 0px;
margin: 0px;
background: #1E282C;
border-radius:75px;
-webkit-border-radius:75px;
-moz-border-radius:75px;
-o-border-radius:75px;
-webkit-background-clip:padding; 
overflow:hidden;
   }
#trans_name
{
width:100px;
height: 100px;
display:block;
position: absolute;
left: 0px;
bottom: 0px;
padding: 0px;
margin: 0px;
z-index:1;
filter: Alpha(Opacity=0);
opacity:0; 
}
 #icon_translucent
{
width:100px;
height: 40px;
display:block;
position: absolute;
left: 0px;
bottom: 0px;
padding: 0px;
background: #000000;
z-index:2;
filter: Alpha(Opacity=50);
opacity:0.5;
        margin-left: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
    }
#icon_name
{
width:100px;
height: 40px;
display:block;
position: absolute;
left: 0px;
bottom: 0px;
padding: 0px;
margin: 0px;
color: #ffffff;
font-size: 16px;
text-align: center;
line-height: 40px;
z-index:3;
}

 #trans_name:hover 
{
filter: Alpha(Opacity=100);
opacity:1; 
}
 #xiala{
     margin-top:0px;
 }

    .auto-style8 {
        width: 160px;
        height: 132px;
    }
    .auto-style10 {
        width: 346px;
    }
    #TextArea1 {
        width: 419px;
        height: 139px;
    }

    .auto-style11 {
        width: 58px;
    }

    .auto-style12 {
        width: 160px;
        height: 97px;
    }

</style>
</head>

<body>
<form id="form1" runat="server">

<div id="shanglan"> 
<p id="logo">workbar</p>

            <asp:TextBox ID="sousuokuang" runat="server" BorderStyle="None" Font-Underline="True"></asp:TextBox>
            <asp:ImageButton ID="sousuo" runat="server" ImageUrl="~/img/sousuo.png" />
           
</div>

<div runat="server" id="tj">  
<ul runat="server">
      <li runat="server" id="tjli">
          <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/添加.jpg" />
               <ul runat="server">
                  <li runat="server"> <asp:LinkButton ID="LinkButton1" runat="server" CssClass="c">项目</asp:LinkButton></li>
                  <li runat="server"> <asp:LinkButton ID="LinkButton2" runat="server" CssClass="c">任务</asp:LinkButton></li>
                  <li runat="server"> <asp:LinkButton ID="LinkButton3" runat="server" CssClass="c">文件</asp:LinkButton></li>
                  <li runat="server"> <asp:LinkButton ID="LinkButton4" runat="server" CssClass="c">日程</asp:LinkButton></li>
               </ul>
      </li>
      <li runat="server">
          <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img/集市.jpg" PostBackUrl="market/Default.aspx" />
      </li>       
      <li runat="server" id="szli">   
         <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/img/设置.jpg" />
  <div class="arrow-up">
     <!--向上的三角-->
          </div>      
<div runat="server" id="shezhi">   
        
   <div runat="server" class="icon">
    <div runat="server" class="icon_head">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/doge.jpg" Height="90px" Width="90px" />
    <a runat="server" class="trans_name">
      <span class="icon_translucent"></span>
        <span runat="server" class="icon_name">
            <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>
        </span>
    </a>   
   </div> 
  </div>
   
     <div id="sz">
       
        <asp:LinkButton ID="LinkButton16" runat="server" CssClass="d" Height="23px" Width="100px" Font-Size="X-Small">个人设置</asp:LinkButton>
        <asp:LinkButton ID="LinkButton17" runat="server" CssClass="d" Height="23px" Width="100px" Font-Size="X-Small" PostBackUrl="~/Login.aspx">退出登录</asp:LinkButton>
     
   </div>
   
</div>
      </li>
 

</ul> 
             

</div> 




<div runat="server" id="menu">
<ul runat="server">
 
  <li runat="server">
       <asp:LinkButton ID="LinkButton5" runat="server" CssClass="b" PostBackUrl="~/Default.aspx">首页</asp:LinkButton></li>
  <li runat="server">
       <asp:LinkButton ID="LinkButton6" runat="server" CssClass="b" PostBackUrl="~/item/item-list.aspx">项目</asp:LinkButton></li>
  <li runat="server">
       <asp:LinkButton ID="LinkButton7" runat="server" CssClass="b"  PostBackUrl="~/dynamics/letter.aspx">动态</asp:LinkButton>
    <ul runat="server">
      <li runat="server" >
           <asp:LinkButton ID="LinkButton8" runat="server" CssClass="b" PostBackUrl="~/dynamics/letter.aspx">站内信</asp:LinkButton></li>
      <li runat="server">
           <asp:LinkButton ID="LinkButton9" runat="server" CssClass="b">通知</asp:LinkButton></li>
      <li runat="server">
           <asp:LinkButton ID="LinkButton10" runat="server" CssClass="b">公告</asp:LinkButton></li>
    </ul>
  </li>
  <li runat="server">
    <asp:LinkButton ID="LinkButton11" runat="server" CssClass="b" PostBackUrl="~/mine/guanzhu.aspx">我的</asp:LinkButton>
    <ul runat="server">
    <li runat="server">
        <asp:LinkButton ID="LinkButton12" runat="server" CssClass="b" PostBackUrl="~/mine/guanzhu.aspx">任务</asp:LinkButton></li>
    <li runat="server">
         <asp:LinkButton ID="LinkButton13" runat="server" CssClass="b" PostBackUrl="~/mine/schedule.aspx">日程</asp:LinkButton></li>
    <li runat="server">
         <asp:LinkButton ID="LinkButton14" runat="server" CssClass="b" PostBackUrl="~/mine/cadlendars.aspx">日历</asp:LinkButton></li>
    </ul>
  </li>
  <li runat="server">
        <asp:LinkButton ID="LinkButton15" runat="server" CssClass="b">讨论</asp:LinkButton></li>
</ul>
</div> 
       <div  class="back">
         
        </div>
    <div id="zhezhao">
               
    
        <div id="liaotiankuang">

            <table class="auto-style1" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="auto-style12" style="background-color: #1E282C">   
                     <div runat="server" id="icon">
                      <div runat="server" id="icon_head">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/img/doge.jpg" Height="100px" Width="100px" />
                        <a runat="server" id="trans_name">
                        <span id="icon_translucent"></span>
                                  <span runat="server" id="icon_name">
                                  <asp:Label ID="Label2" runat="server" Text="用户名"></asp:Label>
                                  </span>
                       </a>   
                     </div> 
                    </div>

                    </td>
                    <td class="auto-style4" colspan="2" rowspan="3">
                        <asp:Panel ID="Panel1" runat="server" Height="402px">
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="background-color: #1E282C">   
                        <div id="xiala">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="40px" Width="160px" BackColor="#40444C" ForeColor="White">
                        </asp:DropDownList>
                            </div>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" style="background-color: #1E282C"></td>
                </tr>
                <tr>
                    <td class="auto-style2" style="background-color: #1E282C">&nbsp;</td>
                    <td class="auto-style10" style="padding-left:10px;">
                        <textarea id="TextArea1" name="S1"></textarea></td>
                    <td style="padding-left:10px;" class="auto-style11">
                        <asp:Button ID="Button1" runat="server"  Text="输 入" BackColor="#F29503" BorderStyle="None" ForeColor="White" Height="35px" Width="68px" />
                    </td>
                </tr>
            </table>

        </div>
    </div>
</form>
</body>
</html>
