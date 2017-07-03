<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWl.aspx.cs" Inherits="Web_Project.View.admin_.OrderList.AddWl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../layer/layer.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <table class="table" cellspacing="1" cellpadding="10" width="99%" border="0">
            <tr>
                <td class="td_bg" width="10%">
                    <strong>物流单号</strong>
                </td>
                <td class="td_bg">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="dfinput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    <strong>物流公司</strong>
                </td>
                <td class="td_bg">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="dfinput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    &nbsp;
                </td>
                <td class="td_bg" colspan="3">
                    <input type="button" id="Button1" value="确认保存" class="btn" />
                </td>
            </tr>
        </table>
    </div>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () {
                var fid = getUrlParam('fid');
                var page = getUrlParam('page');
                var danhao = $.trim($("#TextBox1").val());
                var gongsi = $.trim($("#TextBox2").val());
                if (danhao == "") {
                    layer.msg('请填写物流单号');
                    return false;
                }
                if (gongsi == "") {
                    layer.msg('请填写物流公司名称');
                    return false;
                }
                var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                parent.saveus(fid, danhao, gongsi, page);
                parent.layer.close(index);
            });
        });
        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
    </script>
    </form>
</body>
</html>
