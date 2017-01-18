<%@ Page Title="" Language="C#" MasterPageFile="~/master/zhuye.master" AutoEventWireup="true" CodeFile="letter-send.aspx.cs" Inherits="dynamics_letter_send" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
       td{
           padding :10px;
          font-size:medium;
       }
        .auto-style1 {
            height: 66px;
        }
     </style>
    <link rel="stylesheet" type="text/css" href="../dist/css/wangEditor.min.css"/>
    <div class ="kuang ">
      <table><tr><td class="auto-style1" style="border-width: thin; border-color: #808080; border-top-style: dashed; border-right-style: dashed; border-left-style: dashed;"> <p class="biaoti">
            发送站内信&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        
            
                <asp:Image ID="Image2" runat="server" Height="30px" ImageUrl="~/img/Icon/bussiness-man.png" Width="30px" />
    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Medium"></asp:Label>
    </p> </td></tr><tr><td style="border-width: thin; border-color: #808080; border-right-style: dashed; border-left-style: dashed;">
    <textarea id="TextArea1" runat="server" name="S1" style="height: 116px; width: 391px"></textarea><br />
    </td></tr><tr><td style="border-width: thin; border-color: #808080; padding-left: 300px; border-right-style: dashed; border-bottom-style: dashed; border-left-style: dashed;">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发送" CssClass="tijiao" />
      </td></tr></table></div>
    <script type="text/javascript" src="../dist/js/lib/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../dist/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('ContentPlaceHolder1_TextArea1');
    editor.create();
</script>
    </asp:Content>

