<%@ Page Title="" Language="C#" MasterPageFile="~/master/mine.master" AutoEventWireup="true" CodeFile="sch-add.aspx.cs" Inherits="mine_sch_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <style type="text/css">
       td{
           padding :10px;
          font-size:medium;
       }
    </style>

    <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css" /> 
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.js"></script>
<script type="text/javascript" src="../js/jquery-ui-slide.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">
            
    
   
    $(function () {
       $('.unLinked').datetimepicker();
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
        var st = parseInt(document.getElementById("ContentPlaceHolder1_ContentPlaceHolder1_Hidden1").value);
        var et = parseInt(document.getElementById("ContentPlaceHolder1_ContentPlaceHolder1_Hidden2").value);
        $('.Linked').datetimepicker({
            numberOfMonths: 1,
            minDate: st,
            maxDate: et
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
    <div class="kuang">
        <p class="biaoti">
            添加日程
        </p>
        <asp:Panel ID="Panel1" runat="server" Height="545px" ScrollBars="Vertical">
        <table >
            <tr>
                <td>
         日程名： <asp:TextBox ID="rcm" runat="server" /><br />
                    </td>
                </tr>
                    <tr>
                <td>
         日程详情： <asp:TextBox ID="xq" runat="server" />
        <br />
                    </td>
                </tr>
            <tr>
                <td>
        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="a" Text="一般" />
        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="a" Text="紧急" />
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="a" Text="非常紧急" />
        <br />
                </td>
                </tr>
            <tr>
                <td>
        <asp:CheckBox ID="CheckBox1" runat="server" text="链接到任务" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged"/><br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Expr1" DataValueField="AssId" AutoPostBack="True" Visible="False" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"></asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT    DISTINCT '任务：'+Assignment.Name+'——项目：'+Item.Name AS Expr1,Assignment.AssId
FROM     Assignment INNER JOIN
                Item ON Assignment.BelongItem = Item.ItemId INNER JOIN
                Ass_User ON Assignment.AssId = Ass_User.AssId
WHERE   (Ass_User.UID=@UID) or (Assignment.ResponsibleUID=@UID)">
            <SelectParameters>
                <asp:SessionParameter Name="UID" SessionField="UID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
                    </td>
                </tr>
            <tr>
                <td>
         开始时间： <asp:TextBox id="st" runat="server"  onclick="SelectDate(this)" Width="190px" CssClass="unLinked" /><br />
        </td>
                </tr>
            <tr>
                <td>
                     结束时间：
        <asp:TextBox id="et" runat="server" onclick="SelectDate(this)" Width="190px" CssClass="unLinked"/>
        <br />
                    </td>
                </tr>
            <tr>
                <td>
        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" CssClass="tijiao" />
        &nbsp;<input id="Hidden1" type="hidden" runat="server"/><input id="Hidden2" type="hidden" runat="server" />
    </td>
                </tr>
    </table>        
    </asp:Panel>
    </div>
</asp:Content>

