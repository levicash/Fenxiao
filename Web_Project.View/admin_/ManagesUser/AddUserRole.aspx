<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUserRole.aspx.cs" Inherits="Web_Project.View.admin_.ManagesUser.AddUserRole" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台用户角色</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>添加用户角色</span></div>
        <ul class="forminfo">
            <li>
                <label>
                    角色名称</label><asp:TextBox ID="txtTitle" runat="server" CssClass="dfinput"></asp:TextBox></li>
            <li>
                <label>
                    顺序</label>
                <asp:TextBox ID="txtOrder" runat="server" CssClass="dfinput" Text="99"></asp:TextBox><i>顺序为正整数</i></li>
            <li>
                <label>
                    备注</label>
                <asp:TextBox ID="txtDes" runat="server" TextMode="MultiLine" CssClass="textinput"></asp:TextBox>
            </li>
            <li>
                <label>
                    &nbsp;</label>
                <asp:Button ID="Button1" runat="server" Text="确认保存" OnClick="Button1_Click" CssClass="btn" />
                <asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" CssClass="btn_res" />
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
