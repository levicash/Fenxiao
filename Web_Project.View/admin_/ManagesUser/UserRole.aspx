<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRole.aspx.cs" Inherits="Web_Project.View.admin_.ManagesUser.UserRole" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台用户角色列表</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <script src="../Scripts/Operating.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Operating("ws_BackUserRole");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="rightinfo">
            <div class="tools">
                <ul class="toolbar">
                    <li class="click"><a href="AddUserRole.aspx"><span>
                        <img src="../images/t01.png" /></span>添加</a></li>
                </ul>
            </div>
            <table class="tablelist">
                <thead>
                    <tr>
                        <th width="3%">
                        </th>
                        <th width="7%">
                            编号
                        </th>
                        <th>
                            角色名称
                        </th>
                        <th width="5%">
                            顺序
                        </th>
                        <th width="15%">
                            添加时间
                        </th>
                        <th width="7%">
                            操作
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <input type='checkbox' name='checkbox' id="<%#Eval("id") %>" />
                                </td>
                                <td>
                                    <%#Eval("id") %>
                                </td>
                                <td>
                                    <a href='AddUserRole.aspx?pid=<%# Eval("Id") %>' style="text-decoration: none; color: black;">
                                        <%# Eval("Title") %></a>
                                </td>
                                <td>
                                    <input type="text" class="inp_order" id='<%# Eval("Id")%>' val='<%# Eval("Orders")%>'
                                        value='<%# Eval("Orders")%>' />
                                </td>
                                <td>
                                    <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                                </td>
                                <td>
                                    <a href='AddUserRole.aspx?pid=<%# Eval("Id") %>' class="tablelink">修改</a>&nbsp;|&nbsp;<a
                                        href="javascript:void(0)" id="SingleDel" pid="<%#Eval("id") %>" class="tablelink">删除</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <div class="pagetit">
                <div class="pagetit_1 fl">
                    <asp:HiddenField ID="hidTopId" runat="server" ClientIDMode="Static" />
                    <a href="javascript:void(0)" id="checkAll">全选</a>&nbsp;/&nbsp;<a href="javascript:void(0)"
                        id="checkAllBack">反选</a>
                </div>
                <div class="pagetit_2 fl">
                    <a class="button" id="BtnDeleteAll" href="javascript:void(0)"><span>
                        <img src="../images/delete_btn_bg.png" /></span>一键删除</a> <a class="button" id="BtnUpOrder"
                            href="javascript:void(0)"><span>
                                <img src="../images/floor_btn_bg.png" /></span>更新顺序</a>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $('.tablelist tbody tr:odd').addClass('odd');
        </script>
    </div>
    </form>
</body>
</html>
