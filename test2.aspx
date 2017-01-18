<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test2.aspx.cs" Inherits="test2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                UID:
                <asp:Label ID="UIDLabel" runat="server" Text='<%# Eval("UID") %>' />
                <br />
                Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
                Password:
                <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                <br />
                Gender:
                <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("Gender") %>' />
                <br />
                HeadPhoto:
                <asp:Label ID="HeadPhotoLabel" runat="server" Text='<%# Eval("HeadPhoto") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                FirstUse:
                <asp:Label ID="FirstUseLabel" runat="server" Text='<%# Eval("FirstUse") %>' />
                <br />
                Intro:
                <asp:Label ID="IntroLabel" runat="server" Text='<%# Eval("Intro") %>' />
                <br />
                ResumeFile:
                <asp:Label ID="ResumeFileLabel" runat="server" Text='<%# Eval("ResumeFile") %>' />
                <br />
                Phone:
                <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT * FROM [User_] WHERE ([UID] = @UID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="UID" QueryStringField="UID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
