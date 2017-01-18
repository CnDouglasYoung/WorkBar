<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login - 副本 .aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 270px;
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
    </style>
    <link href="css/style.css" rel="stylesheet"/>
</head>
<body>
    <!--导航栏-->
    <div class="htmleaf-container">
	                <nav class="animenu"> 
	                  <button class="animenu__toggle">
		                <span class="animenu__toggle__bar"></span>
		                <span class="animenu__toggle__bar"></span>
		                <span class="animenu__toggle__bar"></span>
	                  </button>
	                  <ul class="animenu__nav">
		                <li>
		                  <a href="#">首页</a>
		                </li>
		                <li>
		                  <a href="#">功能简介</a>
		                  <ul class="animenu__nav__child">
			                <li><a href="">Sub Item 1</a></li>
			                <li><a href="">Sub Item 2</a></li>
			                <li><a href="">Sub Item 3</a></li>
		                  </ul>
		                </li>     
		                <li>
		                  <a href="#">Blog</a>
		                  <ul class="animenu__nav__child">
			                <li><a href="">Sub Item 1</a></li>
			                <li><a href="">Sub Item 2</a></li>
			                <li><a href="">Sub Item 3</a></li>
		                  </ul>
		                </li>
                        <li>
		                  <a href="market/Default.aspx">集市</a>
		                </li>
		                <li>
		                  <a href="#">关于我们</a>
		                </li>		                                
	                  </ul>
	                </nav>
                </div>
    <script type="text/javascript">
	                    (function(){
	                      var animenuToggle = document.querySelector('.animenu__toggle'),
		                      animenuNav    = document.querySelector('.animenu__nav'),
		                      hasClass = function( elem, className ) {
			                    return new RegExp( ' ' + className + ' ' ).test( ' ' + elem.className + ' ' );
		                      },
		                      toggleClass = function( elem, className ) {
			                    var newClass = ' ' + elem.className.replace( /[\t\r\n]/g, ' ' ) + ' ';
			                    if( hasClass(elem, className ) ) {
			                      while( newClass.indexOf( ' ' + className + ' ' ) >= 0 ) {
				                    newClass = newClass.replace( ' ' + className + ' ' , ' ' );
			                      }
			                      elem.className = newClass.replace( /^\s+|\s+$/g, '' );
			                    } else {
			                      elem.className += ' ' + className;
			                    }
		                      },           
		                      animenuToggleNav =  function (){        
			                    toggleClass(animenuToggle, "animenu__toggle--active");
			                    toggleClass(animenuNav, "animenu__nav--open");        
		                      }

	                      if (!animenuToggle.addEventListener) {
		                      animenuToggle.attachEvent("onclick", animenuToggleNav);
	                      }
	                      else {
		                      animenuToggle.addEventListener('click', animenuToggleNav);
	                      }
	                    })()
                    </script>
    <table class="auto-style2" style=" width:100%; height: 90vh; background-image:url(vi/index_bg3.jpg); ;background-attachment:fixed;background-repeat:no-repeat;background-size:cover;-moz-background-size:cover;-webkit-background-size:cover;">
       <tr style="height: 90vh;">
            <!--logo-->
            <td colspan="4" style="width:80vw;">
                <div style="padding:  10%">
                    <img alt="logo" src="vi/logo3.svg" style="padding: 10% 0;" />                    
                </div>
            </td>
            <!--  登录控件  -->
            <td style="width:19vw;margin:0;padding:0;">
                <form id="form1" runat="server">
                
                <div style="margin:5px; background-color: #eeeeee;">    
                    <table class="auto-style1" style="padding:10px;">
                        <tr>
                            <td colspan="2" class="title" style="border-style: none none outset none; padding: 5px; margin: 0px; font-family: 'Microsoft YaHei UI Light'; border-top-color: 314362; border-right-color: 314362; border-bottom-color: 314362; border-left-color: 314362;">登&nbsp;录</td>
                        </tr>                        
                        <tr>
                            <td colspan="2" class="t1" style="padding: 10px 5px 0px 5px">用户名：</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 5px">
                                <asp:TextBox ID="TextBox1" runat="server" Width="230px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="t1" style="padding: 10px 5px 0px 5px">密码：</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 5px">
                                <asp:TextBox ID="TextBox2" runat="server" Width="230px" TextMode="Password" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 5px">
                                <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Smaller">&nbsp</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td  style="padding: 5px;text-align: center;">
                                <asp:Button ID="Button1" runat="server" Text="注册"  Font-Size="Medium" Height="25px" Width="80px" OnClick="Button1_Click" Font-Names="Microsoft YaHei UI Light"/>
                            </td>
                            <td  style="padding: 5px;text-align: center;">
                                <asp:Button ID="Button2" runat="server" Text="登录"  OnClick="Button2_Click" Font-Size="Medium" Height="25px" Width="80px" Font-Names="Microsoft YaHei UI Light" />
                            </td>
                        </tr>
                    </table>
                </div>
                </form>
            </td>
        </tr>
    </table>

</body>
</html>
