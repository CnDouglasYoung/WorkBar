<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <link rel="stylesheet" type="text/css" href="../css/font.css" /> 
    UID=<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div>

        <table style="width: 200px">
            <tr style="vertical-align:top">
                <td style="background-color:#00A2E8;width: 100px" ><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >
                    <div style="padding:10px;text-align:center;">
                    <asp:Label ID="Label2" runat="server" Text="a" CssClass="ItemIcon"></asp:Label><br />
                    <asp:Label ID="Label3" runat="server" Text="b"></asp:Label><asp:HiddenField ID="HiddenField1" runat="server" />
                    </div>
                    </asp:LinkButton></td>
                <td style="background-color:#00A2E8;width: 100px"><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" >
                    <div style="padding:10px;text-align:center;">
                    <asp:Label ID="Label4" runat="server" Text="a" CssClass="ItemIcon"></asp:Label><br />
                    <asp:Label ID="Label5" runat="server" Text="b"></asp:Label><asp:HiddenField ID="HiddenField2" runat="server" />
                    </div></asp:LinkButton></td>
            </tr>            
        </table>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>
</asp:Content>

