<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Info.aspx.cs"
    Inherits="Web_Project.View.admin_.Message.Info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>在线留言信息</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../kindeditor-4.1.10/kindeditor.js" type="text/javascript"></script>
    <script src="../kindeditor-4.1.10/kindeditor-min.js" type="text/javascript"></script>
    <script src="../kindeditor-4.1.10/lang/zh_CN.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            var editor;
            KindEditor.ready(function (K) {
                editor = K.create('textarea[name="Textarea1"]', {
                    allowFileManager: true,
                    filterMode: false,
                    uploadJson: '../kindeditor-4.1.10/asp.net/upload_json.ashx'
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="table" cellspacing="0" cellpadding="5" width="99%" align="center" border="0">
            <tr>
                <th class="bg_tr" align="left" colspan="2" height="25">
                    留言信息
                </th>
            </tr>
            <tr>
                <td class="td_bg">
                    <table border="0" cellspacing="0" cellpadding="4" width="95%" align="center">
                        <tr>
                            <td class="td_bg" style="border-bottom: 1px solid #DDD; text-align: right">
                                你的问题：
                            </td>
                            <td class="td_bg" style="border: 1px solid #DDD; border-top: none;">
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_bg" style="border-bottom: 1px solid #DDD; text-align: right">
                                留言内容：
                            </td>
                            <td class="td_bg" style="border: 1px solid #DDD; border-top: none;">
                                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_bg" style="border-bottom: 1px solid #DDD; text-align: right">
                                姓名：
                            </td>
                            <td class="td_bg" style="border: 1px solid #DDD; border-top: none;">
                                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_bg" style="border-bottom: 1px solid #DDD; text-align: right">
                                电话号码：
                            </td>
                            <td class="td_bg" style="border: 1px solid #DDD; border-top: none;">
                                <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_bg" style="border-bottom: 1px solid #DDD; text-align: right">
                                留言时间：
                            </td>
                            <td class="td_bg" style="border: 1px solid #DDD; border-top: none;">
                                <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_bg" style="border-bottom: 1px solid #DDD; text-align: right">
                                回复状态：
                            </td>
                            <td class="td_bg" style="border: 1px solid #DDD; border-top: none;">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="1">未回复</asp:ListItem>
                                    <asp:ListItem Value="2">已回复</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_bg" style="border-bottom: 1px solid #DDD; text-align: right">
                                回复内容：
                            </td>
                            <td class="td_bg" style="border: 1px solid #DDD; border-top: none;">
                                <textarea id="Textarea1" name="Textarea1" style="width: 700px; height: 300px; visibility: hidden;
                                    display: block" runat="server"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_bg" style="border-bottom: 1px solid #DDD; text-align: right">
                                回复时间：
                            </td>
                            <td class="td_bg" style="border: 1px solid #DDD; border-top: none;">
                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr align="center">
                <td class="td_bg">
                    <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" CssClass="btn_save2 btn btn82" />
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="返回" OnClick="Button3_Click" CssClass="btn_save2 btn btn82" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
