<%@ Page Title="" Language="C#" MasterPageFile="~/master/mine.master" AutoEventWireup="true" CodeFile="schedule.aspx.cs" Inherits="main_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .IB{
            position:absolute;
            top:2px;
            left: 450px;
        }
       .auto-style2 {
            position: relative;
        }
       .biaoti-icon{
           position :absolute;
           width:25px;
           height:25px;
           top:60px;
           left:700px;
              
       }
    </style>
    <div class ="kuang">
        <p class="biaoti" style="margin-bottom: 10px">
            我的日程
         
           <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/mine/sch-add.aspx" style="position:absolute; top: 59px; left: 700px;" CssClass="LB" ToolTip="添加日程">
               <img src="../img/Icon/add.png" alt="" style="width: 25px; height: 25px; vertical-align: bottom;" /><span style="font-size:15px"></span>
           </asp:LinkButton> 
        </p>
        <asp:Panel ID="Panel1" runat="server" Height="533px" ScrollBars="Vertical">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <table style="margin-top:10px; border-style: none; width: 702px; background-color: #DED9FF;">
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
                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="IB" ImageUrl="~/img/Icon/set.png" Height="25px" Width="25px" />
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
WHERE   (Schedule.UID = @UID)">
        <SelectParameters>
            <asp:SessionParameter Name="UID" SessionField="UID" />
        </SelectParameters>
    </asp:SqlDataSource>
        </asp:Panel>
            </div>
</asp:Content>

