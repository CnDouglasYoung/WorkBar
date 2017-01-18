<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserList.aspx.cs" Inherits="UserList" %>

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
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("UID", "main/主页.aspx?UID={0}") %>' Text='<%# Eval("Name") %>'></asp:HyperLink>
<br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:默认 %>" SelectCommand="SELECT [Name], [UID] FROM [User_]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
