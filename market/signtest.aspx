<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signtest.aspx.cs" Inherits="登陆_signtest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登陆</title>
<style type="text/css">
    *{ 
        margin:0px; 
        padding:0px;
        font-family:'Microsoft YaHei UI';
        font-size:small;
    }
    #contain {
        width:960px;
        margin-left:auto;
        margin-right:auto;
    }
    #beijing {
        width:100%;
        background-image:url(../img/fc6268ae3f56b5680c987a07f1fdfc7e44f80eb54fa75-uLyKaF_fw658.jpg);
        height:537px;
        background-size:cover;        
    }
    #toolbar{
        height:40px;
        line-height:40px;
        width:100%;
        color:white;
        background-color:#1e282c;
        filter:alpha(opacity=50);  
        -moz-opacity:0.5;  
        -khtml-opacity: 0.5;  
        opacity: 0.5;
        z-index:3;
    }
    
    .logo {
        font-family:'Bauhaus 93';
        font-size:30px;
        width: 119px;
    }
    tr{
        text-align:center;
        font-size:15px;
    }
    tr a:hover{
        color:#FFF; 
        background-color:#666666;
        padding:12px 18px;
        cursor:pointer;
    }
    .lj {
        width:25%;
        height:100px;
        float:left;
        text-align:center;

    }
    #lianjie {
        width:960px;
        height:100px;
        background-color:#1e282c;
    }
        #lianjie a:hover{
            color:white;
        }
    .lj ul li{
        list-style:none;
        text-align:center;
        padding-top:7px;
        
    }
    .lj a{
        text-decoration:none;
        color :#808080;
    }
    #banquan{
        height:43px;
        background-color:black;
        color:white;
        text-align:center;
        padding-top:17px;
    }
    
    .auto-style1 {
        width: 960px;
        height: 40px;
    }
    .auto-style2 {
        width: 34px;
    }
    .auto-style3 {
        width: 86px;
    }
    .auto-style4 {
        width: 80px;
    }
    .auto-style5 {
        width: 299px;
    }
    .auto-style6 {
        width: 63px;
    }
    .auto-style7 {
        width: 45px;
    }



</style>
</head>
<body>
<form id="form1" runat="server">
    <div id="contain">
        <div id="beijing">           
            <div id="toolbar">
                <table cellpadding="0" cellspacing="0" class="auto-style1">
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3"><p class="logo">workbar</p></td>
                        <td>&nbsp;</td>
                        <td class="auto-style4">
                            <asp:HyperLink ID="HyperLink1" runat="server">首页</asp:HyperLink>
                        </td>
                        <td class="auto-style4">
                            <asp:HyperLink ID="HyperLink2" runat="server">功能</asp:HyperLink>
                        </td>
                        <td class="auto-style4">
                            <asp:HyperLink ID="HyperLink3" runat="server">Blog</asp:HyperLink>
                        </td>
                        <td class="auto-style4">
                            <asp:HyperLink ID="HyperLink4" runat="server">集市</asp:HyperLink>
                        </td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style7"><p>欢迎您:</p></td>
                        <td class="auto-style6">
                            <asp:Label ID="Label1" runat="server" Text="用户名"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>        
         <div id="footer">
           <div id="lianjie">
              <div class="lj">
              <ul>
                 <li></li>
                 <li><a href="#">workbar首页</a></li>
                 <li><a href="#">官方博客</a></li>
                 <li></li>
              </ul>
              </div>
              <div class="lj">    
              <ul>
                 <li></li>
                 <li><a href="#">联系与合作</a></li>
                 <li><a href="#">用户反馈</a></li>
                 <li></li>
              </ul>
              </div>
              <div class="lj">  
              <ul>
                  <li></li>
                  <li><a href="#">关于我们</a></li>
                  <li><a href="#">开源代码</a></li>
                  <li><a href="#">隐私条款</a></li>
              </ul>
              </div> 
              <div class="lj"> 
              <ul>
                  <li><a href="#">关注我们</a></li>
                  <li><a href="#">新浪微博：@workbar</a></li>
                  <li><a href="#">官方 QQ：741696455</a></li>
                  <li><a href="#">官方微信：</a></li>
             </ul>
             </div>  
           </div> 
           <div id="banquan">
               Copyright © 2013-2016 workbar苏ICP备11014111号-2
           </div>
         </div>
    </div>
</form>
</body>
</html>
