<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AddInfo.aspx.cs"
    Inherits="Web_Project.View.admin_.AgentLevel.AddInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>代理级别</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>添加代理级别</span></div>
        <table class="table" cellspacing="1" cellpadding="10" width="99%" border="0">
            <tr>
                <td class="td_bg" width="7%">
                    标题
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="dfinput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    代理金额：
                </td>
                <td class="td_bg" style="width: 10%;">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="prinput" Text="0"></asp:TextBox>
                </td>
                <td class="td_bg">
                    *&nbsp;价格最多保留两位小数
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    等级ID
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="dfinput" Text="0"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    &nbsp;
                </td>
                <td class="td_bg" colspan="3">
                    <asp:Button ID="Button1" runat="server" Text="确认保存" CssClass="btn" OnClick="Button1_Click" />
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="返回" CssClass="btn_res" OnClick="Button2_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
