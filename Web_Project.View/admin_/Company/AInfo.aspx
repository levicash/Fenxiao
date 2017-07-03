<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AInfo.aspx.cs" Inherits="Web_Project.View.admin_.Company.AInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加公司信息</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>公司账号信息</span></div>
        <table class="table" cellspacing="1" cellpadding="10" width="99%" border="0">
            <tr>
                <td class="td_bg" width="10%">
                    <strong>会员号</strong>
                </td>
                <td class="td_bg">
                    <asp:TextBox ID="TextBox8" runat="server" CssClass="dfinput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    <strong>登录密码</strong>
                </td>
                <td class="td_bg">
                    <asp:TextBox ID="txtPassWord" TextMode="Password" runat="server" CssClass="dfinput"></asp:TextBox>&nbsp;&nbsp;<span
                        style="color: red">注：如果不修改密码，就为空</span>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    <strong>二级密码</strong>
                </td>
                <td class="td_bg">
                    <asp:TextBox ID="TextBox1" TextMode="Password" runat="server" CssClass="dfinput"></asp:TextBox>&nbsp;&nbsp;<span
                        style="color: red">注：如果不修改密码，就为空</span>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    &nbsp;
                </td>
                <td class="td_bg" colspan="3">
                    <asp:Button ID="Button1" runat="server" Text="确认保存" CssClass="btn" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
