<%@ Page Title="" Language="C#" MasterPageFile="~/master/dynamic.master" AutoEventWireup="true" CodeFile="attention.aspx.cs" Inherits="dynamics_attention" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <style type="text/css">
        td{
            padding :5px;
        }
        </style>
    
    <div class ="kuang ">
        <p class="biaoti">
            通知
        </p>
        <asp:Panel ID="Panel1" runat="server" Height="560px" ScrollBars="Vertical">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
<table style="width: 230%; background-color: #DED9FF;">
            <tr><td>
            <asp:Label ID="Label1" runat="server" Text="通知：" Font-Size="Medium"></asp:Label>
            <asp:Label ID="UIDLabel" runat="server" Text='<%# Eval("UID") %>' Visible="False"/>   
            <asp:Label ID="ToUIDLabel" runat="server" Text='<%# Eval("ToUID") %>' Visible="False"/>
            <asp:Label ID="OperateLabel" runat="server" Text='<%# Eval("Operate") %>' Visible="False"/>
            <asp:Label ID="DetailLabel" runat="server" Text='<%# Eval("Detail") %>' Visible="False"/>
            <asp:Label ID="ToIdLabel" runat="server" Text='<%# Eval("ToId") %>' Visible="False"/>
            <asp:Label ID="CreateTimeLabel" runat="server" Text='<%# Eval("CreateTime") %>' Visible="False"/>
            <asp:Label ID="IsReadLabel" runat="server" Text='<%# Eval("IsRead") %>' Visible="False"/>
            <asp:Label ID="FeedbackLabel" runat="server" Text='<%# Eval("Feedback") %>' Visible="False"/>
            <asp:Label ID="AttIdLabel" runat="server" Text='<%# Eval("AttId") %>' Visible="False"/>            
            </td></tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="Small"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Label" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:LinkButton ID="LinkButton1" runat="server"  OnClick="LinkButton1_Click" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>'><img src="../img/Icon/selected.png" alt=""  style="width:20px;height:20px"/><span style="font-size:18px;vertical-align:top">&nbsp;接受</span></asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>'><img src="../img/Icon/wrong.png" alt=""  style="width:20px;height:20px"/><span style="font-size:18px;vertical-align:top">&nbsp;拒绝</span></asp:LinkButton>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server" Visible="false">
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </td>
                </tr>
                
            </table>
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
        SELECT * FROM [Attention] 
        WHERE ([ToUID] = @ToUID) 
        ORDER BY [Feedback] ASC ,[CreateTime] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="ToUID" SessionField="UID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
        </asp:Panel>
            </div>
</asp:Content>

