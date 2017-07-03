<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Profiles.aspx.cs"
    Inherits="Web_Project.View.admin_.Website.Profiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站配置</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--百度编辑器--%>
    <script src="../ueditor/ueditor.config.js" type="text/javascript"></script>
    <script src="../ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script src="../ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>网站配置</span></div>
        <ul class="forminfo">
            <li>
                <label>
                    网站名称</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="dfinput"></asp:TextBox></li>
            <li>
                <label>
                    关键字</label>
                <asp:TextBox ID="txtKey" runat="server" CssClass="cdfinput"></asp:TextBox>
            </li>
            <li>
                <label>
                    网站描述</label>
                <asp:TextBox ID="txtDes" runat="server" TextMode="MultiLine" CssClass="textinput"></asp:TextBox>
            </li>
            <li>
                <label>
                    网站底部</label>
                <div class="fl">
                    <textarea id="Description" name="Description" runat="server" style="width: 1000px;"></textarea>
                    <script type="text/javascript">
                        UE.getEditor('Description');
                    </script>
                </div>
            </li>
            <li>
                <label>
                    &nbsp;</label>
                <asp:Button ID="Button1" runat="server" Text="确认保存" OnClick="Button1_Click" CssClass="btn" />
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
