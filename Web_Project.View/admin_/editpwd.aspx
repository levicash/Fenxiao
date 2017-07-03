<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editpwd.aspx.cs" Inherits="Web_Project.View.admin_.editpwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/common.css" rel="stylesheet" type="text/css" />
    <link href="css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <script src="Scripts/editpass.js" type="text/javascript"></script>
    <title>修改密码</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>修改密码</span></div>
        <ul class="forminfo">
            <li>
                <label>
                    登录名</label>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal></li>
            <li>
                <label>
                    新密码</label>
                <input type="password" id="txtPwd" class="dfinput" /></li>
            <li>
                <label>
                    确认密码</label>
                <input type="password" id="txtTwicePwd" class="dfinput" /></li>
            <li>
                <label>
                    &nbsp;</label>
                <input type="button" value="确认保存" id="edit_pwd" class="btn" />
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
