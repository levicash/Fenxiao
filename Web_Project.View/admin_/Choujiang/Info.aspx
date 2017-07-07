<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="Web_Project.View.admin_.Choujiang.Info" %>

<%@ Register Assembly="AspNetPager" TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>奖品管理</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%--调用带删除图片功能的JS--%>
    <script src="../Scripts/Operating.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Operating("ws_Prize");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="rightinfo">
            <div class="tools">
                <ul class="toolbar">
                    <li class="click"><a href="AddInfo.aspx"><span>
                        <img src="../images/t01.png" /></span>添加</a></li>
                </ul>
            </div>
            <table class="tablelist">
                <thead>
                    <tr>
                        <th width="3%"></th>
                        <th width="7%">编号
                        </th>
                        <th>奖品名称
                        </th>
                        <th width="5%">奖品价格
                        </th>
                        <th width="5%">奖品数量
                        </th>
                        <th width="15%">奖品描述
                        </th>
                        <th width="15%">是否显示
                        </th>
                        <th width="15%">奖品图片
                        </th>
                        <th width="7%">操作
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
                                    <%# Eval("PNO") %>
                                </td>

                                <td>
                                    <a href='AddInfo.aspx?id=<%# Eval("Id") %>' style="text-decoration: none; color: black;">
                                        <%# Eval("PName") %></a>
                                </td>
                                <td>
                                    <%# Eval("Price")%>
                                </td>
                                <td>
                                    <%# Eval("Psize")%>
                                </td>
                                <td>
                                    <%# Eval("PComment")%>
                                </td>
                                <td>
                                    <%# Eval("IsShow").ToString() == "0" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                                </td>
                                <td>
                                    <a href='AddInfo.aspx?id=<%# Eval("Id") %>'>
                                        <img src="<%#Eval("ImageUrll").ToString()==""?"../Images/no_pic.gif":("../Images/proImg/"+Eval("ImageUrll").ToString()) %>"
                                            width="160px" height="60px" />
                                    </a>
                                </td>
                                <td>
                                    <a href='AddInfo.aspx?id=<%# Eval("Id") %>' class="tablelink">修改</a>&nbsp;|&nbsp;<a
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
                        <img src="../images/delete_btn_bg.png" /></span>一键删除</a><%-- <a class="button" id="BtnUpOrder"
                            href="javascript:void(0)"><span>
                                <img src="../images/floor_btn_bg.png" /></span>更新顺序</a>
                </div>--%>
                </div>
            </div>
            <script type="text/javascript">
                $('.tablelist tbody tr:odd').addClass('odd');
            </script>
    </form>
</body>
</html>
