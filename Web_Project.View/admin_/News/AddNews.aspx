<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs"
    Inherits="Web_Project.View.admin_.News.AddNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加新闻详细信息</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="../css/select.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/select-ui.min.js" type="text/javascript"></script>
    <script src="../../Scripts/lhgcore.min.js" type="text/javascript"></script>
    <script src="../../Scripts/lhgcalendar.min.js" type="text/javascript"></script>
    <%--百度编辑器--%>
    <script src="../ueditor/ueditor.config.js" type="text/javascript"></script>
    <script src="../ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script src="../ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $(".select2").uedSelect({
                width: 167
            });
            J('#TextBox1').calendar({ format: 'yyyy-MM-dd HH:mm:ss' });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>添加新闻</span></div>
        <table class="table" cellspacing="1" cellpadding="10" width="99%" align="center"
            border="0">
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
                    类型
                </td>
                <td class="td_bg" colspan="2">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select2">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    来源
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="dfinput"></asp:TextBox>
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
                    内容
                </td>
                <td class="td_bg" colspan="2">
                    <textarea id="Description" name="Description" runat="server" style="width: 1000px;"></textarea>
                    <script type="text/javascript">
                        UE.getEditor('Description');
                    </script>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    推荐选项
                </td>
                <td class="td_bg" colspan="2">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="置顶" />
                    <asp:CheckBox ID="CheckBox2" runat="server" Text="推荐" />
                    <asp:CheckBox ID="CheckBox3" runat="server" Text="发布" />
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    发布时间
                </td>
                <td class="td_bg" colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="dfinput"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    &nbsp;
                </td>
                <td class="td_bg" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="提交" OnClick="Button1_Click" CssClass="btn" />
                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" CssClass="btn_res" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
