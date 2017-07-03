<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCompeEdit.aspx.cs"
    Inherits="Web_Project.View.admin_.ManagesUser.UserCompeEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>编辑用户权限</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/UserCompeEdit.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formbody">
        <div class="formtitle">
            <span>用户管理列表</span></div>
        <table class="table" cellspacing="0" cellpadding="5" width="99%" align="center" border="0">
            <tr>
                <td class="td_bg">
                    正在为用户&nbsp;<span style="color: red; font-weight: bold;"><asp:Literal ID="lterAdmin"
                        runat="server"></asp:Literal></span>&nbsp;分配权限
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    <table border="0" cellspacing="0" cellpadding="4" width="95%" align="center">
                        <tr>
                            <td style="border-bottom: 1px solid #DDD; border-top: 1px solid #DDD; border-left: 1px solid #ddd;"
                                width="5%">
                                <strong>序号</strong>
                            </td>
                            <td style="border: 1px solid #DDD; border-top: 1px solid #DDD; border-right: 0px;"
                                width="15%">
                                <strong>一级权限</strong>
                            </td>
                            <td style="border: 1px solid #DDD; border-top: 1px solid #DDD;">
                                <strong>二级权限</strong>
                            </td>
                        </tr>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound1">
                            <ItemTemplate>
                                <tr>
                                    <td style="border-bottom: 1px solid #DDD; border-left: 1px solid #ddd;" width="5%">
                                        <%# Container.ItemIndex+1%>
                                    </td>
                                    <td style="border: 1px solid #DDD; border-top: none; border-right: 0px;">
                                        <input type="checkbox" name="linkcheckboxYi" class="leftCheck" id="check<%#Eval("Id") %>"
                                            value='<%#Eval("Id") %>' />
                                        <%#Eval("Title")%>
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Id") %>' />
                                    </td>
                                    <td id='div<%#Eval("Id") %>' style="border: 1px solid #DDD; border-top: none;">
                                        <asp:Repeater ID="Repeater2" runat="server">
                                            <ItemTemplate>
                                                <input type="checkbox" name="linkcheckboxEr" id='check<%#Eval("Id") %>' value='<%#Eval("Id") %>'
                                                    disabled="disabled">
                                                <%#Eval("Title")%>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
            <tr align="center">
                <td style="padding-top: 15px;">
                    <input type="button" name="button" id="btn_save" class="btn" value="确认保存">
                    <input type="button" name="button" id="btn_back" class="btn_res" value="返回">
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
