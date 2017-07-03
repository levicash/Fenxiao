<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AddInfo.aspx.cs"
    Inherits="Web_Project.View.admin_.JiaoDian.AddInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>焦点图</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>添加焦点图</span></div>
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
                    上传图片
                </td>
                <td class="td_bg" style="width: 10%;">
                    <asp:FileUpload ID="filePic" runat="server" />
                </td>
                <td class="td_bg">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/admin_/Images/no_pic.gif" Width="120"
                        Height="90" />
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    链接地址：
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="dfinput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    顺序
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="txtOrder" runat="server" CssClass="dfinput" Text="99"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    加入推荐：
                </td>
                <td class="td_bg" colspan="2">
                    <asp:RadioButtonList ID="radiotuijian" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="2">否</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    </asp:RadioButtonList>
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
