<%@ Page Title="" Language="C#" MasterPageFile="~/master/mine.master" AutoEventWireup="true" CodeFile="calendars.aspx.cs" Inherits="main_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .calendar {
            padding: 5px;
            padding-left:10px;
            padding-right:10px;
        }
        .calendar1 {
            margin:0 auto;
        }
    </style>
    <div style="margin-top: 10px">
    <asp:Calendar ID="C1" CssClass="calendar1" runat="server" BackColor="White" BorderColor="Black"  DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="217px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="664px" OnSelectionChanged="Calendar1_SelectionChanged" BorderStyle="None" OnDataBinding="C1_DataBinding">
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
        <DayStyle Width="14%" />
        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
        <SelectorStyle BackColor="#555555" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
        <TodayDayStyle BackColor="#CCCC99" />
        <NextPrevStyle  CssClass="calendar"/>
    </asp:Calendar>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
    <asp:Panel runat="server" Height="360px" ScrollBars="Vertical" Style="padding:10px">
    <p style="font-size:larger">任务</p>
    <hr />
                 <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" OnItemDataBound="DataList3_ItemDataBound" DataKeyField="BelongItem" OnLoad="DataList3_Load">
                                                    <ItemTemplate>
                                                        <table class="" style="margin: 10px; border-style: none; width: 702px; background-color: #DED9FF;">
                                                            <tr>
                                                                <td rowspan="4" id="isimportent" runat="server" cssclass="notimportent">&nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="Label2" runat="server" Text="任务;"></asp:Label>
                                                                    <asp:LinkButton ID="AssName" runat="server" OnClick="LinkButton19_Click" Text='<%# Eval("Name") %>' ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>'>LinkButton</asp:LinkButton>
                                                                </td>
                                                                <td>负责人：
                                                                    <asp:Label ID="Name1Label" runat="server" Text='<%# Eval("Name1") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="IsImportantLabel" runat="server" Text='<%# Eval("IsImportant") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">Remark:
                                                                    <asp:Label ID="RemarkLabel" runat="server" Text='<%# Eval("Remark") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>From:
                                                                    <asp:Label ID="BeginTimeLabel" runat="server" Text='<%# Eval("BeginTime") %>' />
                                                                </td>
                                                                <td>To:
                                                                    <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Eval("EndTime") %>' />
                                                                </td>
                                                                <td>&nbsp;<asp:Label ID="AssIdLabel" runat="server" Text='<%# Eval("AssId") %>' Visible="False" />
                                                                    <asp:Label ID="BelongItemLabel" runat="server" Text='<%# Eval("BelongItem") %>' Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" class="auto-style1">
                                                                    所属项目：  <asp:LinkButton ID="ItemName" runat="server"  Text='<%# Eval("ItemName") %>' NavigateUrl = "~/item/item.aspx" OnClick="ItemName_Click" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>'>LinkButton</asp:LinkButton>
                                                                </td>                                                                
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:DataList>
              <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT Assignment.AssId, Assignment.Name, Assignment.Remark, Assignment.BeginTime, Assignment.EndTime, Assignment.IsImportant, User_.Name AS Name1, Assignment.BelongItem, Item.Name AS ItemName
FROM Assignment INNER JOIN User_ ON Assignment.ResponsibleUID = User_.UID INNER JOIN Ass_User ON Assignment.AssId = Ass_User.AssId INNER JOIN Item ON Assignment.BelongItem = Item.ItemId 
WHERE (Ass_User.UID = @UID) and (Assignment.EndTime=@EndTime)
ORDER BY Assignment.EndTime">
                                                    <SelectParameters>
                                                        <asp:ControlParameter Name="EndTime" ControlID="HiddenField1" />
                                                        <asp:SessionParameter Name="UID" SessionField="UID" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
    
    <asp:Label ID="Label1" runat="server" Text="暂无当日结束的任务" Visible="False"></asp:Label>
    <p style="font-size:larger">日程</p>
    <hr />
     <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <table style="margin: 10px; border-style: none; width: 702px; background-color: #DED9FF;">
                <tr style="border-bottom-style: solid; border-bottom-color: #4889AE">
                    <td style="width: 219px">
                        &nbsp;<asp:Label ID="BeginTimeLabel0" runat="server" Font-Size="Large" Text='<%# Eval("BeginTime") %>' />
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="日程："></asp:Label>
                        <asp:Label ID="Sch_NameLabel" runat="server" Font-Size="Large" Text='<%# Eval("Sch_Name") %>' />
                        <asp:Label ID="AssIdLabel" runat="server" Text='<%# Eval("AssId") %>' Visible="False" />
                        <asp:Label ID="ScheduleIdLabel" runat="server" Text='<%# Eval("ScheduleId") %>' Visible="False" />
                        <asp:Label ID="PriorityLabel" runat="server" Text='<%# Eval("Priority") %>' Visible="False" />
                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="IB" ImageUrl="~/img/Icon/edit.png" Height="20" Width="20" />
                    </td>
                </tr>
                <caption>
                   
                    <tr>
                        <td colspan="2" style="height: 23px">
                            <hr />
                            <asp:Label ID="Label3" runat="server" Text="备注："></asp:Label>
                            <asp:Label ID="RemarkLabel" runat="server" Text='<%# Eval("Remark") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">关联任务:
                            <asp:LinkButton ID="Ass_Name" runat="server" OnClick="Ass_Name_Click" Text='<%# Eval("Ass_Name") %>' ValidationGroup="<%# ((DataListItem)Container).ItemIndex %>">Ass_Name</asp:LinkButton>
                            <asp:Label ID="BelongItemLabel" runat="server" Text='<%# Eval("BelongItem") %>' Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 219px">开始时间： 
                            <asp:Label ID="BeginTimeLabel" runat="server" Text='<%# Eval("BeginTime") %>' />
                        </td>
                        <td>结束时间 
                            <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Eval("EndTime") %>' />
                        </td>
                    </tr>
                </caption>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Assignment.Name AS Ass_Name, Schedule.Name AS Sch_Name, Schedule.Remark, Schedule.BeginTime, 
                Schedule.EndTime, Schedule.Priority, Schedule.AssId, Assignment.BelongItem,Schedule.ScheduleId
FROM      Schedule left JOIN
                Assignment ON Schedule.AssId = Assignment.AssId
WHERE   (Schedule.UID = @UID) and (Convert(varchar(10),Schedule.EndTime,111)=@EndTime)">
        <SelectParameters>
            <asp:SessionParameter Name="UID" SessionField="UID" />
            <asp:ControlParameter Name="EndTime" ControlID="HiddenField1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="Label4" runat="server" Text="暂无当日结束的日程" Visible="False"></asp:Label>
    </asp:Panel>
</asp:Content>

