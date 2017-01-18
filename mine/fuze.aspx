<%@ Page Title="" Language="C#" MasterPageFile="~/master/mine.master" AutoEventWireup="true" CodeFile="fuze.aspx.cs" Inherits="母版页_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css" style="margin: 40px">
        #rwcd {background-color:#eee; width:760px; height:30px; margin:0 auto;}
         .f { text-decoration:none; color:#000; display:block; float:left;text-align:center;height:30px;width:80px;
        }
        .f:hover {color :white;background-color:#666;}
        .auto-style1 {
            width: 100%;
        }
        </style>
    <div runat="server" id="rwcd" style="border-color: #ECA027; margin-top: 15px; border-top-style: solid;" >
                     <asp:LinkButton runat="server" CssClass="f" PostBackUrl="~/mine/guanzhu.aspx" >我关注的</asp:LinkButton> 
                     <asp:LinkButton ID="LinkButton2" runat="server" CssClass="f" BackColor="#F29503" PostBackUrl="~/mine/fuze.aspx">我负责的</asp:LinkButton> 
                     <asp:LinkButton ID="LinkButton3" runat="server" CssClass="f" PostBackUrl="~/mine/canyu.aspx">我参与的</asp:LinkButton>
    </div> <br /><br /><br />
    <asp:Panel ID="Panel1" runat="server" Height="400px" ScrollBars="Vertical">
         <div  style="padding:10px">
                <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" OnItemDataBound="DataList3_ItemDataBound" DataKeyField="BelongItem" OnItemCommand="DataList3_ItemCommand">
                                                    <ItemTemplate>
                                                        <table class="" style="border-style: none; background-color: #DED9FF; width: 702px;">
                                                            <tr>
                                                                <td rowspan="4" id="isimportent" runat="server" cssclass="notimportent">&nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="Label2" runat="server" Text="任务："></asp:Label>
                                                                    <asp:LinkButton ID="AssName" runat="server" OnClick="LinkButton19_Click" Text='<%# Eval("Name") %>'  ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>'>LinkButton</asp:LinkButton>
                                                                </td>
                                                                <td>负责人：
                                                                    <asp:Label ID="Name1Label" runat="server" Text='<%# Eval("Name1") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="IsImportantLabel" runat="server" Text='<%# Eval("IsImportant") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3">任务详情:
                                                                    <asp:Label ID="RemarkLabel" runat="server" Text='<%# Eval("Remark") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>开始时间:
                                                                    <asp:Label ID="BeginTimeLabel" runat="server" Text='<%# Eval("BeginTime") %>' />
                                                                </td>
                                                                <td>结束时间:
                                                                    <asp:Label ID="EndTimeLabel" runat="server" Text='<%# Eval("EndTime") %>' />
                                                                </td>
                                                                <td>&nbsp;<asp:Label ID="AssIdLabel" runat="server" Text='<%# Eval("AssId") %>' Visible="False" />
                                                                    <asp:Label ID="BelongItemLabel" runat="server" Text='<%# Eval("BelongItem") %>' Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" class="auto-style1">
                                                                    所属项目：  <asp:LinkButton ID="ItemName" runat="server"  Text='<%# Eval("ItemName") %>'  OnClick="ItemName_Click" CommandName="ItemId" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>'>LinkButton</asp:LinkButton>
                                                                </td>                                                                
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:DataList>
                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   Assignment.AssId, Assignment.Name, Assignment.Remark, Assignment.BeginTime, Assignment.EndTime, 
                Assignment.IsImportant, User_.Name AS Name1, Assignment.BelongItem, Item.Name AS ItemName
FROM      Assignment INNER JOIN
                User_ ON Assignment.ResponsibleUID = User_.UID INNER JOIN
                Item ON Assignment.BelongItem = Item.ItemId
WHERE   (Assignment.ResponsibleUID = @UID)
ORDER BY Assignment.EndTime">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="UID" SessionField="UID" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
        </div>
    </asp:Panel>

</asp:Content>

