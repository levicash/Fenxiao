<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Web_Project.View.admin_.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/admin.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <script src="Scripts/admin_login.js" type="text/javascript"></script>
    <title>后台管理系统登录页面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 220px;
            width: 681px;">
            <tr>
                <td width="681px">
                    <table width="400px" height="106" border="0" cellpadding="2" cellspacing="0">
                        <tr>
                            <td height="40" colspan="2" align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td width="140" height="35px" align="right">
                                登陆名称：
                            </td>
                            <td>
                                <input type="text" id="txtUserName" style="border: solid 1px #27B3FE; width: 120px;
                                    height: 20px; background-color: #FFFFFF" />
                            </td>
                        </tr>
                        <tr>
                            <td height="35" align="right">
                                登陆密码：
                            </td>
                            <td>
                                <input type="password" id="txtPassword" style="border: solid 1px #27B3FE; width: 120px;
                                    height: 20px; background-color: #FFFFFF" />
                            </td>
                        </tr>
                        <tr>
                            <td height="35" align="right">
                                验 证 码：
                            </td>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <input type="text" id="txtCode" style="border: solid 1px #27B3FE; width: 50px; height: 20px;
                                                background-color: #FFFFFF;" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="CheckCodeImg" runat="server" Style="width: 60px;" ImageUrl="Code.ashx"
                                                ClientIDMode="Static" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-left: 80px;" colspan="2">
                                <input type="button" id="btn_login" class="btn_login" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
