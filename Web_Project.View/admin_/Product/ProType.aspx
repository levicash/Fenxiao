<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProType.aspx.cs" Inherits="Web_Project.View.admin_.Product.ProType" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>产品大类列表显示</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.tinyTips.js" type="text/javascript"></script>
    <link href="../css/tinyTips.css" rel="stylesheet" type="text/css" />
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%--调用带删除图片功能的JS--%>
    <script src="../Scripts/OperatingImg.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('a.tTip').tinyTips('title');
            $('img.imgTip').tinyTips('title');
            $('img.tTip').tinyTips('title');
            $('h1.tagline').tinyTips('tinyTips are totally awesome!');
            Operating("ws_ProType");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="rightinfo">
            <div class="tools">
                <ul class="toolbar">
                    <li class="click"><a href="AddType.aspx"><span>
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
                            标题
                        </th>
                        <th width="8%">
                            导航栏
                        </th>
                        <th width="8%">
                            是否显示
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
                    <asp:Repeater ID="repProduct" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <input type='checkbox' name='checkbox' id="<%#Eval("id") %>" />
                                </td>
                                <td>
                                    <%#Eval("id") %>
                                </td>
                                <td>
                                    <a href='AddType.aspx?id=<%# Eval("Id") %>' style="text-decoration: none; color: black;">
                                        <%# Eval("Title") %></a>&nbsp;
                                    <%#Eval("ImgName").ToString() == "" ? "" : "<img src='../Images/image_s.gif' title='../Images/proImg/" + Eval("ImgName").ToString() + "' class='imgTip' style=' vertical-align:middle;' />"%>
                                </td>
                                <td>
                                    <%# Eval("IsDaoHang").ToString() == "2" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                                </td>
                                <td>
                                    <%# Eval("IsXianShi").ToString() == "2" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                                </td>
                                <td>
                                    <input type="text" class="inp_order" id='<%# Eval("Id")%>' val='<%# Eval("Orders")%>'
                                        value='<%# Eval("Orders")%>' />
                                </td>
                                <td>
                                    <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                                </td>
                                <td>
                                    <a href='AddType.aspx?id=<%# Eval("Id") %>' class="tablelink">修改</a>&nbsp;|&nbsp;<a
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
