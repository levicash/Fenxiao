<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="right.aspx.cs" Inherits="Web_Project.View.admin_.right" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>右侧模块</title>
    <link href="css/common.css" rel="stylesheet" type="text/css" />
    <link href="css/right.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div>
        <div class="mainindex">
            <div class="welinfo">
                <span>
                    <img src="images/sun.png" alt="天气" /></span> <b>
                        <asp:Literal ID="lterAdmin" runat="server"></asp:Literal>&nbsp;&nbsp;您好，欢迎使用网商信息管理系统</b>
                <a href="javascript:void(0)">帐号设置</a>
            </div>
            <div class="welinfo">
                <span>
                    <img src="images/time.png" alt="时间" /></span> <i>您上次登录的时间：<asp:Literal ID="Literal14"
                        runat="server"></asp:Literal></i> （不是您登录的？<a href="editpwd.aspx">请点这里</a>）
            </div>
            <div class="xline">
            </div>
            <div class="box">
            </div>
            <div>
                <%--<div class="boxfl">
                    <ul class="infolist">
                        <li><span>会员升级审核：</span>已审核：<font><asp:Literal ID="Literal14" runat="server"></asp:Literal></font>已审核：<font><asp:Literal
                            ID="Literal15" runat="server"></asp:Literal></font></li>
                    </ul>
                </div>--%>
                <div class="boxfr">
                    <ul class="infolist">
                        <li><span>会员总数：</span><font><asp:Literal ID="Literal5" runat="server"></asp:Literal></font></li>
                        <li><span>今天新增会员数：</span><font><asp:Literal ID="Literal6" runat="server"></asp:Literal></font></li>
<%--                        <li><span>联合创始人总数：</span><font><asp:Literal ID="Literal8" runat="server"></asp:Literal></font></li>
                        <li><span>总代理总数：</span><font><asp:Literal ID="Literal9" runat="server"></asp:Literal></font></li>
                        <li><span>省级代理总数：</span><font><asp:Literal ID="Literal10" runat="server"></asp:Literal></font></li>
                        <li><span>市级代理总数：</span><font><asp:Literal ID="Literal11" runat="server"></asp:Literal></font></li>
                        <li><span>特约代理总数：</span><font><asp:Literal ID="Literal12" runat="server"></asp:Literal></font></li>
                        <li><span>零售商总数：</span><font><asp:Literal ID="Literal13" runat="server"></asp:Literal></font></li>--%>
                    </ul>
                </div>
            </div>
            <div class="xline">
            </div>
            <div class="welinfo">
                <span>
                    <img src="images/dp.png" alt="提醒" /></span> <b>管理系统配置说明</b>
            </div>
            <ul class="infolist">
                <li><span>服务器名：</span><asp:Literal ID="lterFuWuQi" runat="server"></asp:Literal></li>
                <li><span>服务器IP：</span><asp:Literal ID="lterIP" runat="server"></asp:Literal></li>
                <li><span>服务器系统：</span><asp:Literal ID="Literal1" runat="server"></asp:Literal></li>
                <li><span>.NET版本：</span><asp:Literal ID="Literal2" runat="server"></asp:Literal></li>
                <li><span>IIS版本：</span><asp:Literal ID="Literal3" runat="server"></asp:Literal></li>
                <li><span>程序占用空间大小：</span><asp:Literal ID="Literal4" runat="server"></asp:Literal></li>
            </ul>
            <div class="xline">
            </div>
        </div>
    </div>
</body>
</html>
