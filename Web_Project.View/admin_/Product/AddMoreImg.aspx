<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMoreImg.aspx.cs" Inherits="Web_Project.View.admin_.Product.AddMoreImg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加产品更多图片</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script>
        var i = 1;
        function addFile() {
            var str = '<BR> <input type="file" name="File" runat="server" style="width: 300px"/>';
            document.getElementById('MyFile').insertAdjacentHTML("beforeEnd", str);
            i++;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="tools">
            <div class="serdiv fl">
                正在为产品：<span style="color: red; font-weight: bold;"><asp:Literal ID="Literal2" runat="server"></asp:Literal></span>&nbsp;添加更多图片
            </div>
        </div>
        <table class="table" cellspacing="1" cellpadding="10" width="99%" border="0">
            <tr>
                <td class="td_bg" width="7%">
                    上传图片
                </td>
                <td class="td_bg">
                    <p id="MyFile" />
                    <input onclick="addFile()" type="button" class="ibtn" value="增加图片" /><br />
                    <input type="file" name="File" style="width: 300px" />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    &nbsp;
                </td>
                <td class="td_bg" colspan="3">
                    <asp:Button ID="Button1" runat="server" Text="确认保存" CssClass="btn" OnClick="btnUpload_Click" />
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="返回" CssClass="btn_res" OnClick="Button2_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
