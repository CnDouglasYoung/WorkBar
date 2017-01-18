﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>日期时间选择器：datetimepicker</title>
<meta name="keywords" content="datetimepicker, jquery插件" />
<meta name="description" content="Helloweba演示平台，演示XHTML、CSS、jquery、PHP案例和示例" />
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
<style type="text/css">
a{color:#007bc4/*#424242*/; text-decoration:none;}
a:hover{text-decoration:underline}
ol,ul{list-style:none}
body{height:100%; font:12px/18px Tahoma, Helvetica, Arial, Verdana, "\5b8b\4f53", sans-serif; color:#51555C;}
img{border:none}
.demo{width:500px; margin:20px auto}
.demo h4{height:32px; line-height:32px; font-size:14px}
.demo h4 span{font-weight:500; font-size:12px}
.demo p{line-height:28px;}
input{width:200px; height:20px; line-height:20px; padding:2px; border:1px solid #d3d3d3}
pre{padding:6px 0 0 0; color:#666; line-height:20px; background:#f7f7f7}

.ui-timepicker-div .ui-widget-header { margin-bottom: 8px;}
.ui-timepicker-div dl { text-align: left; }
.ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
.ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
.ui-timepicker-div td { font-size: 90%; }
.ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
.ui_tpicker_hour_label,.ui_tpicker_minute_label,.ui_tpicker_second_label,.ui_tpicker_millisec_label,.ui_tpicker_time_label{padding-left:20px}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery-ui-slide.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">
    $(function () {
        $('#example_1').datetimepicker();
        $('#example_2').timepicker({});
        $('#example_3').datetimepicker({
            showSecond: true,
            showMillisec: true,
            timeFormat: 'hh:mm:ss:l'
        });
        $('#example_4').timepicker({
            ampm: true,
            hourMin: 8,
            hourMax: 16
        });
        $('#example_5').datetimepicker({
            hour: 13,
            minute: 15
        });
        $('#example_6').datetimepicker({
            numberOfMonths: 2,
            minDate: 0,
            maxDate: 30
        });
        $('#example_7').timepicker({
            hourGrid: 4,
            minuteGrid: 10
        });


        var ex8 = $('#example_8');

        ex8.datetimepicker();

        $('#example_8_set_btn').click(function () {
            ex8.datetimepicker('setDate', (new Date()));
        });

        $('#example_8_get_btn').click(function () {
            alert(ex8.datetimepicker('getDate'));
        });
    });
</script>
</head>

<body>

    <form id="form1" runat="server">

<div >
 <div >      
      <p><input type="text" id="example_1" /><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
      </p>
   </div>
   
</div>
        <asp:Panel ID="Panel1" CssClass="contain" runat="server" Height="150" Width="150" ScrollBars="Auto"  OnLoad="theone">
            <div style="margin:200px"> 1</div>
        </asp:Panel>
        <asp:Button ID="Button2" runat="server" Text="2" />
        <asp:Button ID="Button3" runat="server" Text="3" />
        <script type="text/javascript">                
                var div = document.getElementById('Panel1');
                div.scrollTop = div.scrollHeight;

</script>

    </form>


</body>
</html>
