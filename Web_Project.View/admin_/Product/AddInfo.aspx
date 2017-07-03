<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AddInfo.aspx.cs"
    Inherits="Web_Project.View.admin_.Product.AddInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加产品详细信息</title>
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
                        <td class="td_bg" width="10%">
                            <strong>标题</strong>
                        </td>
                        <td class="td_bg" colspan="2">
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="dfinput"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg">
                            <strong>类型</strong>
                        </td>
                        <td class="td_bg" colspan="2">
                            <asp:DropDownList ID="ddlType" runat="server" CssClass="select2">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg" width="7%">
                            <strong>产品原价</strong>
                        </td>
                        <td class="td_bg" style="width: 10%;">
                            <asp:TextBox ID="TxtPrice1" runat="server" CssClass="prinput" Text="0"></asp:TextBox>
                        </td>
                        <td class="td_bg">
                            *&nbsp;价格最多保留两位小数
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg" width="7%">
                            <strong>产品现价</strong>
                        </td>
                        <td class="td_bg" style="width: 10%;">
                            <asp:TextBox ID="TxtPrice2" runat="server" CssClass="prinput" Text="0"></asp:TextBox>
                        </td>
                        <td class="td_bg">
                            *&nbsp;价格最多保留两位小数
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg" width="7%">
                            <strong>商品编号</strong>
                        </td>
                        <td class="td_bg" style="width: 10%;">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="prinput" Text=""></asp:TextBox>
                        </td>
                        <td class="td_bg">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg" width="7%">
                            <strong>商品规格</strong>
                        </td>
                        <td class="td_bg" style="width: 10%;">
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="prinput" Text=""></asp:TextBox>
                        </td>
                        <td class="td_bg">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg">
                            <strong>上传图片</strong>
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
                            <strong>加入推荐</strong>
                        </td>
                        <td class="td_bg" colspan="2">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="精品" />&nbsp;&nbsp;
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="新品" />&nbsp;&nbsp;
                            <asp:CheckBox ID="CheckBox3" runat="server" Text="热销" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg">
                            <strong>上架</strong>
                        </td>
                        <td class="td_bg" colspan="2">
                            <asp:CheckBox ID="CheckBox4" runat="server" />&nbsp;打勾表示允许销售，否则不允许销售
                        </td>
                    </tr>
                    <tr>
                        <td class="td_bg">
                            <strong>顺序</strong>
                        </td>
                        <td class="td_bg" colspan="2">
                            <asp:TextBox ID="txtOrder" runat="server" CssClass="dfinput" Text="99"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tab2" class="tabson">
                <textarea id="Description" name="Description" runat="server" style="width: 1000px;"></textarea>
                <script type="text/javascript">
                    UE.getEditor('Description');
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
