﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUserCompe.aspx.cs" Inherits="Web_Project.View.admin_.ManagesUser.AddUserCompe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台用户权限</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="../css/select.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/select-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".select2").uedSelect({
                width: 167
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>添加用户权限</span></div>
        <table class="table" cellspacing="1" cellpadding="10" width="99%" border="0">
            <tr>
                <td class="td_bg" width="10%">
                    权限名称
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="dfinput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    选择一级权限
                </td>
                <td class="td_bg">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select2">
                    </asp:DropDownList>
                </td>
                <td class="td_bg">
                    本身是一级权限的，就不用选择了！！
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    链接地址
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="txtUrl" runat="server" CssClass="dfinput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    上传图标
                </td>
                <td class="td_bg" style="width: 10%;">
                    <asp:FileUpload ID="filePic" runat="server" />
                </td>
                <td class="td_bg">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/admin_/Images/no_pic.gif" Width="50"
                        Height="50" />
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    顶部展示
                </td>
                <td class="td_bg" colspan="2">
                    <asp:CheckBox ID="CheckBox4" runat="server" />&nbsp;打勾表示允许展示，否则不允许展示！！
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
                    备注
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="txtDes" runat="server" TextMode="MultiLine" CssClass="textinput"></asp:TextBox>
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
