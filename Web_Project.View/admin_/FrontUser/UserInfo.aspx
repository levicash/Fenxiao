<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Web_Project.View.admin_.FrontUser.UserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>会员详细信息</title>
    <style>
        *
        {
            font-size: 9pt;
            border: 0;
            margin: 0;
            padding: 0;
            font-family: '微软雅黑';
        }
        .uinfo
        {
            padding: 20px;
        }
        .uinfo_1 span
        {
            color: #ff0000;
            font-weight: bold;
        }
        .uinfo_2
        {
            padding-top: 15px;
        }
        .uinfo_2 table
        {
            width: 100%;
            border-left: 1px solid #cde6ff;
            border-top: 1px solid #cde6ff;
        }
        .uinfo_2 table tr td
        {
            padding: 5px 5px;
            border-right: 1px solid #cde6ff;
            border-bottom: 1px solid #cde6ff;
        }
        .uinfo_2 table tr td.td1
        {
            text-align: right;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="uinfo">
        <div class="uinfo_1">
            会员：<span><asp:Literal ID="Literal1" runat="server"></asp:Literal></span>&nbsp;的详细信息
        </div>
        <div class="uinfo_2">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 20%;" class="td1">
                        会员号：
                    </td>
                    <td style="width: 30%;">
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                    </td>
                    <td style="width: 20%;" class="td1">
                        姓名：
                    </td>
                    <td>
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;" class="td1">
                        注册人：
                    </td>
                    <td style="width: 30%;">
                        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                    </td>
                    <td style="width: 20%;" class="td1">
                        推荐人：
                    </td>
                    <td>
                        <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;" class="td1">
                        身份证号：
                    </td>
                    <td style="width: 30%;" colspan="3">
                        <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;" class="td1">
                        所属区域：
                    </td>
                    <td style="width: 30%;" colspan="3">
                        <asp:Literal ID="Literal12" runat="server"></asp:Literal>--<asp:Literal ID="Literal13"
                            runat="server"></asp:Literal>--<asp:Literal ID="Literal14" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;" class="td1">
                        收货地址：
                    </td>
                    <td style="width: 30%;" colspan="3">
                        <asp:Literal ID="Literal15" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;" class="td1">
                        银行卡卡号：
                    </td>
                    <td style="width: 30%;">
                        <asp:Literal ID="Literal16" runat="server"></asp:Literal>
                    </td>
                    <td style="width: 20%;" class="td1">
                        银行卡开户行：
                    </td>
                    <td>
                        <asp:Literal ID="Literal17" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;" class="td1">
                        银行卡开户人：
                    </td>
                    <td style="width: 30%;" colspan="3">
                        <asp:Literal ID="Literal18" runat="server"></asp:Literal>
                    </td>
                </tr>
               <%-- <tr>
                    <td style="width: 20%;" class="td1">
                        奖金账户：
                    </td>
                    <td style="width: 30%;" colspan="3">
                        <asp:Literal ID="Literal21" runat="server"></asp:Literal>
                    </td>
                </tr>--%>
                <tr>
                    <td style="width: 20%;" class="td1">
                        注册时间：
                    </td>
                    <td style="width: 30%;" colspan="3">
                        <asp:Literal ID="Literal25" runat="server"></asp:Literal>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
