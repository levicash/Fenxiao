<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Project.View.Login" %>

<%@ Register Src="~/Contrl/Foot.ascx" TagName="Foot" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="Styles/common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/index.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--loading加载中  样式--%>
    <link href="Styles/sweetalert.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/sweetalert.min.js" type="text/javascript"></script>
    <%--登录--%>
    <script src="Scripts/login.js" type="text/javascript"></script>
</head>
<body>
    <div class="reg_logo">
        <a href="Index.aspx">
            <img src="images/logo2.png" /></a>
    </div>
    <div class="denglu_bg">
        <div class="denglu_box">
            <div class="denglu_1">
                <span class="zhanghao"></span>
                <br />
                <input class="ren" type="button" />
                <input class="zh" type="text" id="txtLoginName" placeholder="请输入用户名" />
                <div class="clearfix">
                </div>
                <input class="lmima" type="button" />
                <input class="mm" type="password" id="txtLoginPwd" placeholder="请输入密码" />
                <div class="clearfix">
                </div>
                <input class="dl" id="btn_login" type="button" />
                <div class="clearfix">
                </div>
                <%--<div class="lzhuce">
                    还没有账号？&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Reg.aspx">立即注册</a></div>
                <div class="clearfix">
                </div>--%>
            </div>
        </div>
    </div>
    <uc1:Foot ID="Foot1" runat="server" />
</body>
</html>
