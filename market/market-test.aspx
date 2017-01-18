<%@ Page Language="C#" AutoEventWireup="true" CodeFile="market-test.aspx.cs" Inherits="market_market_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>项目集市</title>
<link href="../css/slide.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
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
    #toolbar{
        height:40px;
        line-height:40px;
        width:100%;
        color:white;
        background-color:#1e282c;
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
        padding:12px 24px;
        cursor:pointer;
    }
    #sousuo {
        
        height:40px;
        width:100%;
    }
    #xiangmutj{
        width:60%;
        min-height:500px;
        background-color:#ecf0f5;
        margin:10px;
    }
    #xiangmubq{
        width:30%;
        min-height:500px;
        background-color:#ecf0f5;
        margin:10px;
        margin-left:60px;
    }
    #rencaitj{
        width:60%;
        min-height:500px;
        background-color:#ecf0f5;
        margin:10px;
    }
    #rencaibq{
        width:30%;
        min-height:500px;
        background-color:#ecf0f5;
        margin:10px;
        margin-left:60px;
    }
    .xiangzuo {
        float:left;
    }
        .xiangzuo p {
            color:#F08200;
            font-size:medium;
            margin:10px;
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
    .auto-style8 {
        width: 100%;
        height: 40px;
    }
    .auto-style10 {
        width: 100px;
    }
    .auto-style11 {
        width: 550px;
    }
    .auto-style12 {
        width: 131px;
    }
    #xiangmu{
        display:block;
    }
    #rencai{
        display:none;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="contain">
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
        <div id="banner">
            <div class="slide" id="img-play">
	            <ul>
		            <li><a><img src="../img/1.png" width="960" height="320" /></a></li>
		            <li><a><img src="../img/2.png" width="960" height="320" /></a></li>
		            <li><a><img src="../img/3.png" width="960" height="320" /></a></li>

	            </ul>
	            <div class="bg"></div>
	            <div class="num"></div>
	            <a class="skip prev" title="上一张">上一张</a>
	            <a class="skip next" title="下一张">下一张</a>
            </div>
        </div>
        <div id="sousuo">

            <table cellpadding="0" cellspacing="0" class="auto-style8">
                <tr>
                    
                    <td id="hyperLink5" class="auto-style10" style="border-right-style: solid; border-right-color: #F08200">
                        <asp:HyperLink ID="HyperLink5" runat="server">项目集市</asp:HyperLink>
                    </td>
                    <td id="hyperLink6" class="auto-style10" style="border-right-style: solid; border-right-color: #F08200">
                        <asp:HyperLink ID="HyperLink6" runat="server">人才集市</asp:HyperLink>
                    </td>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBox1" runat="server" Width="130px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="搜索" BackColor="#F08200" BorderStyle="None" ForeColor="White" Height="22px" Width="52px" /></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div id="xiangmu">
            <div id="xiangmutj" class="xiangzuo">
            <p>项目推荐</p>
                <p>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" />
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("TagId", "user-tag.aspx?TagId={0}") %>' Text='<%# Eval("TagName") %>'></asp:HyperLink>                                          
                                </ItemTemplate>
                            </asp:DataList>

 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
     SELECT  [TagName]      
      ,[TagId],count(*) as c
        FROM [dbo].[User-Tag] 
  group by TagName,TagId
  order by c desc"></asp:SqlDataSource></p>
            </div>
            <div id="xiangmubq" class="xiangzuo">
            <p>热门标签</p>
            </div>
        </div>
        <div id="rencai">
            <div id="rencaitj" class="xiangzuo">
            <p>人才推荐</p>
            </div>
            <div id="rencaibq" class="xiangzuo">
            <p>门标签</p>
            </div>
        </div>
    </div>
</form>
</body>
<script type="text/javascript">
    (function (a) { a.fn.maiPlayer = function (c) { var b = { oPlay: null, speedSwitch: 3000, speedAnimate: 500, showPage: 0, playerWidth: 0, autoPlay: true, flipButton: true, pageButton: true, playerBg: true, numPage: false, imageTitle: false, imageContent: false, switchActionAuto: "roll", switchActionPage: "opacity", switchActionFlip: "roll", textDisplay: 0, textSpeed: 500 }; var c = a.extend(b, c); this.each(function () { var p = a(this); var n = ""; var h = 0; var i = 0; var j = null; var d = []; a(p).find("li img").parents("ul").addClass("ul-img").css("position", "relative"); h = a(p).find(".ul-img li").length; if (c.playerWidth) { i = c.playerWidth; a(p).css("width", i + "px"); a(p).find(".ul-img li").css("width", i + "px"); a(p).find("img").css("width", i + "px"); a(p).find(".bg:first").css("width", i + "px") } else { i = a(p).find(".ul-img li:first").width() } if (c.playerHeight) { iHeight = c.playerHeight; a(p).css("height", iHeight + "px"); a(p).find(".ul-img").css("height", iHeight + "px"); a(p).find(".ul-img li").css("height", iHeight + "px"); a(p).find("img").css("height", iHeight + "px") } a(p).find(".ul-img li").each(function () { var q = a(p).find(".ul-img li").index(this); d[q] = a(p).find(".ul-img img").eq(q).attr("title"); a(p).find(".ul-img img").eq(q).removeAttr("title") }); if (c.imageTitle || c.imageContent) { var k = a('<ul class="ul-text"></ul>'); a(k).insertAfter(a(p).find(".ul-img")); a(p).find(".ul-img li").each(function () { var s = a("<li></li>"); var q = a(p).find(".ul-img li").index(this); if (c.imageTitle) { var t = a("<h2></h2>"); a(t).text(d[q]); a(s).append(t) } if (c.imageContent) { var r = a("<p></p>"); var u = a(p).find(".ul-img img").eq(q).attr("alt"); a(r).text(u); a(s).append(r) } a(k).append(s) }); a(p).find(".ul-text").width(i * h); a(p).find(".ul-text").height(a(p).find(".bg:first").height()) } a(p).find(".ul-img").width(i * h); if (c.flipButton) { a(p).find(".next:first").click(function () { if (c.switchActionFlip == "roll") { l(a(p).find(".ul-img"), 1); if (c.imageTitle || c.imageContent) { l(a(p).find(".ul-text"), 0) } } else { if (c.switchActionFlip == "opacity") { if (c.showPage == h - 1) { c.showPage = 0 } else { c.showPage++ } f(a(p).find(".ul-img"), c.showPage); f(a(p).find(".ul-text"), c.showPage); e(a(p).find(".num span").eq(c.showPage), "on") } } }); a(p).find(".prev:first").click(function () { if (c.switchActionFlip == "roll") { l(a(p).find(".ul-img"), -1); if (c.imageTitle || c.imageContent) { l(a(p).find(".ul-text"), 0) } } else { if (c.switchActionFlip == "opacity") { if (c.showPage == 0) { c.showPage = h - 1 } else { c.showPage-- } f(a(p).find(".ul-img"), c.showPage); f(a(p).find(".ul-text"), c.showPage); e(a(p).find(".num span").eq(c.showPage), "on") } } }) } else { a(p).find(".next:first").css("display", "none"); a(p).find(".prev:first").css("display", "none") } if (c.showPage) { a(p).find(".ul-img").css("left", -i * c.showPage + "px"); a(p).find(".ul-text").css("left", -i * c.showPage + "px") } if (c.pageButton) { n = ""; a(p).find(".ul-img li").each(function () { n += "<span></span>" }); a(p).find(".num:first").html(n); a(p).find(".num span:first").addClass("on"); e(a(p).find(".num span").eq(c.showPage), "on"); a(p).find(".num span").click(function () { var q = a(p).find(".num span").index(this); if (c.switchActionPage == "roll") { c.showPage = 0; l(a(p).find(".ul-img"), q); l(a(p).find(".ul-text"), 0) } else { if (c.switchActionPage == "opacity") { c.showPage = q; f(a(p).find(".ul-img"), c.showPage); f(a(p).find(".ul-text"), c.showPage); e(a(p).find(".num span").eq(c.showPage), "on") } } if (c.numPage) { a(this).text(a(p).find(".num span").index(this) + 1) } }) } if (!c.playerBg) { a(p).find(".bg:first").css("display", "none") } function l(r, q) { if (r.is(":animated") == false) { c.showPage += q; if (c.showPage != -1 && c.showPage != h) { r.animate({ left: -c.showPage * i + "px" }, c.speedAnimate) } else { if (c.showPage == -1) { c.showPage = h - 1; r.css({ left: -(i * (c.showPage - 1)) + "px" }); r.animate({ left: -(i * c.showPage) + "px" }, c.speedAnimate) } else { if (c.showPage == c.showPage) { c.showPage = 0; r.css({ left: -i + "px" }); r.animate({ left: 0 + "px" }, c.speedAnimate) } } } e(a(p).find(".num span").eq(c.showPage), "on") } } function f(s, r) { var q = (s.css("left") != -r * i + "px"); if (q) { s.fadeOut(20, function () { s.css("left", -r * i + "px"); s.fadeIn(500) }) } } function m() { j = setInterval(function () { if (c.switchActionAuto == "roll") { l(a(p).find(".ul-img"), 1) } else { if (c.switchActionAuto == "opacity") { c.showPage++; if (c.showPage == h) { c.showPage = 0 } f(a(p).find(".ul-img"), c.showPage); e(a(p).find(".num span").eq(c.showPage), "on") } } if (c.imageTitle || c.imageContent) { l(a(p).find(".ul-text"), 0) } }, c.speedSwitch) } function o() { if (j) { clearInterval(j) } } a(p).hover(function () { o(); if (c.textDisplay == 1) { a(p).find(".bg:first").slideUp(c.textSpeed); a(p).find(".ul-text:first").slideUp(c.textSpeed) } else { if (c.textDisplay == 2) { a(p).find(".bg:first").slideDown(c.textSpeed); a(p).find(".ul-text:first").slideDown(c.textSpeed) } } }, function () { if (c.autoPlay) { m() } if (c.textDisplay == 1) { a(p).find(".bg:first").slideDown(c.textSpeed); a(p).find(".ul-text:first").slideDown(c.textSpeed) } else { if (c.textDisplay == 2) { a(p).find(".bg:first").slideUp(c.textSpeed); a(p).find(".ul-text:first").slideUp(c.textSpeed) } } }); if (c.autoPlay) { m() } function g(q, r) { } function e(r, q) { r = a(r) ? a(r) : r; r.addClass(q).siblings().removeClass(q) } }) } })(jQuery);
    $(document).ready(function () {
        $('#img-play').maiPlayer({ speedSwitch: 5000, playerWidth: 960 });
    });
    $(function () {
        $("#hyperLink5").click(function () {
            if ($("#xiangmu").css("display") == "block") {

            } else {
                $("#xiangmu").css("display", "block");
                $("#rencai").css("display", "none");
            }
            $(this).css("background-color", "#666666");
            $("#hyperLink6").css("background-color", "#FFF");
        });
        $("#hyperLink6").click(function () {
            if ($("#rencai").css("display") == "block") {

            } else {
                $("#rencai").css("display", "block");
                $("#xiangmu").css("display", "none");
            }
            $(this).css("background-color", "#666666");
            $("#hyperLink5").css("background-color", "#FFF");
        });
    });
</script>
</html>
