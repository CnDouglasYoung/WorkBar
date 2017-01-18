<%@ Page Title="" Language="C#" MasterPageFile="~/master/dynamic.master" AutoEventWireup="true" CodeFile="letter.aspx.cs" Inherits="dynamics_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css" >
         .MyLetter{
             margin-left: 250px;
             background-color:white;
         }
         .Letter{margin-left:5px;
             background-color:#F29503;
         }
         .hh {margin-left:0px;
              margin-top:0px;
         }
        
         .auto-style1 {
             width: 200px;
             border-right:dashed;
             border-right-color:gray;
         }
         .auto-style2 {
             width: 500px;
             height: 420px;
             
         }
        
         .TextArea1 {
             height: 134px;
             width: 503px;
         }
        
      </style>

    <table style="width: 760px;display: table-cell; vertical-align: top; height: 595px;" >
        <tr>
            <td style="display: table-cell; vertical-align: top;" class="auto-style1" rowspan="2">
                
                    <asp:Panel ID="Panel3" runat="server" Height="600px" Width="240px" ScrollBars="Vertical">
                         <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                           
                            <table style="border-left: medium solid #F29503; padding: 10px; margin: 10px; width: 93%; background-color: #C0C0C0; border-right-color: #F29503; border-right-width: medium; border-top-color: #F29503; border-top-width: medium; border-bottom-color: #F29503; border-bottom-width: medium;">
                                <tr>
                                    <td rowspan="2" style="width: 40px">
                                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl='<%# Eval("HeadPhoto") %>'  Height="25" Width="25" />
                                        
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="NameLinkButton" runat="server" OnClick="NameLinkButton_Click" Text='<%# Eval("Name") %>' ValidationGroup='<%# ((DataListItem)Container).ItemIndex %>' ForeColor="#003366"></asp:LinkButton>
                                        <asp:Label ID="SendUIDLabel" runat="server" Text='<%# Eval("SendUID") %>' Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                &nbsp;<asp:Label ID="SendTimeLabel" runat="server" Text='<%# Eval("SendTime") %>' />
                                                <br />
                                                <br />
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                                
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT top 1 [SendTime] 
FROM [Letter] 
WHERE (([ReceiveUID] = @ReceiveUID) AND ([SendUID] = @SendUID)) 
ORDER BY [SendTime] DESC">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ReceiveUID" SessionField="UID" />
                                    <asp:ControlParameter ControlID="SendUIDLabel" Name="SendUID" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                        
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   User_.Name, letter1.SendUID,User_.HeadPhoto
FROM      letter1 INNER JOIN
                User_ ON letter1.SendUID = User_.UID
WHERE   (letter1.ReceiveUID = @UID) ">
                        <SelectParameters>
                            <asp:SessionParameter Name="UID" SessionField="UID" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </asp:Panel>
                <asp:Label ID="SendUID" runat="server" Text="1" Visible="False"></asp:Label>
            </td>
            <td style="display: table-cell; vertical-align: top;" class="auto-style2">
                <asp:Panel ID="Panel2" runat="server" Width="510px" ScrollBars="Vertical" CssClass="hh" Height="420px">
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="DataList3_ItemDataBound" Width="224px">
                        <ItemTemplate>
                            <asp:Table id="LetterTable" runat="server" cssclass="Letter" ForeColor="Black" Height="66px" Width="238px">
                                <asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                                        <asp:Label ID="SendUIDLabel" runat="server" Text='<%# Eval("SendUID") %>' Visible="False" />
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="DetailLabel" runat="server" Text='<%# Eval("Detail") %>' />
                                    </asp:TableCell></asp:TableRow><asp:TableRow>
                                    <asp:TableCell>
                                        <asp:Label ID="SendTimeLabel" runat="server" Text='<%# Eval("SendTime") %>' />
                                    </asp:TableCell></asp:TableRow></asp:Table><br /></ItemTemplate></asp:DataList><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="
SELECT   User_.Name, Letter.Detail, Letter.SendTime, Letter.SendUID
FROM      Letter INNER JOIN
                User_ ON Letter.SendUID = User_.UID
WHERE   (Letter.SendUID = @SendUID OR  Letter.SendUID = @ReceiveUID)
               AND (Letter.ReceiveUID = @SendUID OR Letter.ReceiveUID = @ReceiveUID)
                AND(Letter.Detail<>' ')
ORDER BY Letter.SendTime">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="SendUID" Name="SendUID" PropertyName="Text" />
                            <asp:SessionParameter Name="ReceiveUID" SessionField="UID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </td>
        </tr>
    <tr>
            <td style="width:500px;display: table-cell; vertical-align: top; text-align: right;">
                <textarea id="TextArea1" runat="server" name="S1" class="TextArea1"></textarea><br />
                <asp:Button ID="Button1" runat="server" Text="发送" OnClick="Button1_Click" CssClass="tijiao" /></td>
    </tr>
    </table>
</asp:Content>