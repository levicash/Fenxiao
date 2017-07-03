<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="ContactInfo.aspx.cs"
    Inherits="Web_Project.View.admin_.Contact.ContactInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>联系我们</title>
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../css/css.css" rel="stylesheet" type="text/css" />
    <script src="../kindeditor-4.1.10/kindeditor.js" type="text/javascript"></script>
    <script src="../kindeditor-4.1.10/kindeditor-min.js" type="text/javascript"></script>
    <script src="../kindeditor-4.1.10/lang/zh_CN.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            var editor;
            KindEditor.ready(function (K) {
                editor = K.create('textarea[name="Content"]', {
                    allowFileManager: true,
                    filterMode: false,
                    uploadJson: '../kindeditor-4.1.10/asp.net/upload_json.ashx'
                });
                editor = K.create('textarea[name="Desp"]', {
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
        <table class="table" cellspacing="1" cellpadding="10" width="99%" align="center"
            border="0">
            <tr>
                <th class="bg_tr" align="left" colspan="2" height="25">
                    联系我们
                </th>
            </tr>
            <tr class="bgWhite">
                <td class="td_bg" align="right" width="10%">
                    标题：
                </td>
                <td class="td_bg">
                    <asp:TextBox ID="txtTitle" runat="server" Width="482px"></asp:TextBox>
                </td>
            </tr>
            <tr class="bgWhite">
                <td class="td_bg" align="right">
                    内页左侧：
                </td>
                <td class="td_bg">
                    <textarea id="Desp" name="Desp" style="width: 700px; height: 200px; visibility: hidden;
                        display: block" runat="server"></textarea>
                </td>
            </tr>
            <tr class="bgWhite">
                <td class="td_bg" align="right">
                    详细内容：
                </td>
                <td class="td_bg">
                    <textarea id="Content" name="Content" style="width: 700px; height: 300px; visibility: hidden;
                        display: block" runat="server"></textarea>
                </td>
            </tr>
            <tr>
                <td class="td_bg" align="center" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" CssClass="btn_save2 btn btn82" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
