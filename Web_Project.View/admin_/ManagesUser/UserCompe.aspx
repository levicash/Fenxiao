<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCompe.aspx.cs" Inherits="Web_Project.View.admin_.ManagesUser.UserCompe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>后台权限列表</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.tinyTips.js" type="text/javascript"></script>
    <link href="../css/tinyTips.css" rel="stylesheet" type="text/css" />
    <%--删除--%>
    <script src="../Scripts/UserCompe.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('a.tTip').tinyTips('title');
            $('img.imgTip').tinyTips('title');
            $('img.tTip').tinyTips('title');
            $('h1.tagline').tinyTips('tinyTips are totally awesome!');
            Operating("ws_BackUserCompetence");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <div class="tools">
            <ul class="toolbar">
                <li class="click"><a href="AddUserCompe.aspx"><span>
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
                        权限名称
                    </th>
                    <th width="10%">
                        顶部展示
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
                <asp:Repeater ID="repProInfo" runat="server" OnItemDataBound="Repeater1_ItemDataBound1">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <input type='checkbox' name='checkbox' id="<%#Eval("id") %>" />
                            </td>
                            <td>
                                <%#Eval("id") %>
                            </td>
                            <td>
                                <a href='AddUserCompe.aspx?pid=<%# Eval("Id") %>' style="text-decoration: none; color: black;">
                                    <%# Eval("Title") %></a>&nbsp;
                                <%#Eval("ImgName").ToString() == "" ? "" : "<img src='../Images/image_s.gif' title='../Images/proImg/" + Eval("ImgName").ToString() + "' class='imgTip' style=' vertical-align:middle;' />"%>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <input type="text" class="inp_order" id='<%# Eval("Id")%>' val='<%# Eval("Orders")%>'
                                    value='<%# Eval("Orders")%>' style="width: 30px; text-align: center;" />
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%#Eval("Id") %>' />
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td style="padding-left: 20px;">
                                        <a href='AddUserCompe.aspx?pid=<%# Eval("Id") %>' style="text-decoration: none; color: black;">
                                            <%# Eval("Title") %></a>
                                    </td>
                                    <td>
                                        <%# Eval("IsDingBu").ToString() == "" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                                    </td>
                                    <td>
                                        <input type="text" class="inp_order" id='<%# Eval("Id")%>' val='<%# Eval("Orders")%>'
                                            value='<%# Eval("Orders")%>' style="width: 30px; text-align: center;" />
                                    </td>
                                    <td>
                                        <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0)" id="DiErSingleDel" comperid="<%#Eval("id") %>" class="tablelink">
                                            删除</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
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
    </form>
</body>
</html>
