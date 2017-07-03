<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Project.View.wap.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="target-densitydpi=device-dpi,width=640px, user-scalable=no" />
    <meta name="MobileOptimized" content="640" />
    <meta name="Iphone-content" content="640" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="css/ui.css" rel="stylesheet" type="text/css" />
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="../layer/mobile/layer.js" type="text/javascript"></script>
    <script src="js/login.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header">
        <div class="" style="background: none">
        </div>
        <div class="toolbar statusbar-padding">
            <button class="bar-button back-button" style="left: -10px" onclick="history.go(-1);"
                dwz-event-on-click="click">
                <i class="icon icon-back-s"></i>
            </button>
            <a href="Index.aspx" class="icon-zhuye"></a>
        </div>
    </div>
    <div class="aui-login-ba" style="position: relative; overflow: hidden">
        <span class="aui-login-logo">
            <img src="images/aui-logo.png"></span>
        <canvas id="waves" class="waves" style="position: absolute; bottom: -60px; left: -210px;"></canvas>
    </div>
    <div class="aui-logon-con">
        <div class="b-line">
            <input type="text" id="txtLoginName" placeholder="登录账号">
        </div>
        <div class="b-line">
            <input type="password" id="txtLoginPwd" placeholder="登录密码">
        </div>
        <div class="aui-login-l">
            <a href="javascript:void(0)">登录</a>
        </div>
        <%--<div class="aui-login-wen">
            <div>
                <a href="Reg.aspx">免费注册</a>
            </div>
        </div>--%>
    </div>
    <div id="loading" style="display: none;">
        <img src="images/loading.gif" />
    </div>
    <script src="js/css3/49f8daee.vendors.js"></script>
    <script src="js/css3/26f2fc0d.index.js"></script>
    </form>
</body>
</html>
