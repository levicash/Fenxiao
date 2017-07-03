<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AddInfo.aspx.cs"
    Inherits="Web_Project.View.admin_.SinglePage.AddInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>单篇文章</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="../css/select.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/select-ui.min.js" type="text/javascript"></script>
    <%--tab切换--%>
    <script src="../Scripts/jquery.idTabs.min.js" type="text/javascript"></script>
    <%--百度编辑器--%>
    <script src="../ueditor/ueditor.config.js" type="text/javascript"></script>
    <script src="../ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script src="../ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $(".select2").uedSelect({
                width: 190
            });
            $("#usual1 ul").idTabs(); //绑定tab切换
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div id="usual1" class="usual">
            <div class="itab">
                <ul>
                    <li><a href="#tab1" class="selected">通用信息</a></li>
                    <li><a href="#tab2">详细描述</a></li>
                </ul>
            </div>
            <div id="tab1" class="tabson">
                <table class="table" cellspacing="1" cellpadding="10" width="99%" border="0">
                    <tr>
                        <td class="td_bg" width="7%">
                            <strong>标题</strong>
                        </td>
                        <td class="td_bg">
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="dfinput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg">
                            <strong>类型</strong>
                        </td>
                        <td class="td_bg">
                            <asp:DropDownList ID="ddlType" runat="server" CssClass="select2">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg">
                            是否显示
                        </td>
                        <td class="td_bg">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="2">否</asp:ListItem>
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                            </asp:RadioButtonList>
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
                </table>
            </div>
            <div id="tab2" class="tabson">
                <textarea id="Textarea1" name="Textarea1" runat="server" style="width: 1000px;"></textarea>
                <script type="text/javascript">
                    UE.getEditor('Textarea1');
                </script>
            </div>
        </div>
        <div class="btn_div">
            <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" CssClass="btn" />
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" CssClass="btn_res" />
        </div>
    </div>
    </form>
</body>
</html>
