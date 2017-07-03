<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUserList.aspx.cs" Inherits="Web_Project.View.admin_.ManagesUser.AddUserList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台用户名</title>
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
            <span>添加用户名</span></div>
        <ul class="forminfo">
            <li>
                <label>
                    用户名</label><asp:TextBox ID="txtTitle" runat="server" CssClass="dfinput"></asp:TextBox></li>
            <li>
                <label>
                    所属角色</label>
                <div class="vocation">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select2">
                    </asp:DropDownList>
                </div>
            </li>
            <li>
                <label>
                    密码</label>
                <asp:TextBox ID="txtPwd" TextMode="Password" runat="server" CssClass="dfinput"></asp:TextBox><i>密码框为空，则密码不修改</i></li>
            <li>
                <label>
                    顺序</label>
                <asp:TextBox ID="txtOrder" runat="server" CssClass="dfinput" Text="99"></asp:TextBox><i>顺序为正整数</i></li>
            <li>
                <label>
                    备注</label>
                <asp:TextBox ID="txtDes" runat="server" TextMode="MultiLine" CssClass="textinput"></asp:TextBox>
            </li>
            <li>
                <label>
                    &nbsp;</label>
                <asp:Button ID="Button1" runat="server" Text="确认保存" OnClick="Button1_Click" CssClass="btn" />
                <asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" CssClass="btn_res" />
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
