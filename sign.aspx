<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sign.aspx.cs" Inherits="sign" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>
<style type="text/css">
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
</style>
</head>
<body>
<form id="form1" runat="server">

<div id="beijing">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/img/fc6268ae3f56b5680c987a07f1fdfc7e44f80eb54fa75-uLyKaF_fw658.jpg" Height="537px" Width="960px" />
     <div style="margin:5px; background-color: #eeeeee;">    
          
     </div>
   
    
<div id="shangbian">        
<p id="logo">workbar</p>
    <div id="zuobian">
        <ul>
    <li><asp:HyperLink ID="HyperLink2" runat="server" ForeColor="White">首页</asp:HyperLink></li>  
            <li> <a href="#" style="color: #FFFFFF">功能</a></li> 
            <li> <a href="#" style="color: #FFFFFF">Blog</a></li> 
    <li><asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White">集市</asp:HyperLink></li> 
   
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
</div>








</form>
</body>
</html>
