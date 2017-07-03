<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="Web_Project.View.admin_.WapJiaoDian.Info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%--调用带删除图片功能的JS--%>
    <script src="../Scripts/OperatingImg.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Operating("ws_WapJiaoDian");
        });
    </script>
    <title>手机版焦点图</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <div class="tools">
            <div class="serdiv_2 fl">
                <a href="../JiaoDian/Info.aspx" target="rightMain">电脑版</a><a href="Info.aspx"
                    target="rightMain">手机版</a>
            </div>
            <ul class="toolbar">
                <li class="click"><a href="AddInfo.aspx"><span>
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
                    <th width="18%">
                        图片
                    </th>
                    <th width="5%">
                        推荐
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
                                <a href='AddInfo.aspx?id=<%# Eval("Id") %>' style="text-decoration: none; color: black;">
                                    <%# Eval("Title") %></a>
                            </td>
                            <td>
                                <a href='AddInfo.aspx?id=<%# Eval("Id") %>'>
                                    <img src="<%#Eval("ImgName").ToString()==""?"../Images/no_pic.gif":("../Images/proImg/"+Eval("ImgName").ToString()) %>"
                                        width="160px" height="60px" />
                                </a>
                            </td>
                            <td>
                                <%# Eval("IsOr").ToString() == "2" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                            </td>
                            <td>
                                <input type="text" class="inp_order" id='<%# Eval("Id")%>' val='<%# Eval("Orders")%>'
                                    value='<%# Eval("Orders")%>' />
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
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
                    <img src="../images/delete_btn_bg.png" /></span>一键删除</a> <a class="button" id="BtnUpOrder"
                        href="javascript:void(0)"><span>
                            <img src="../images/floor_btn_bg.png" /></span>更新顺序</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    <%--<div>
        <div style="width: 100%; height: 30px; margin-bottom: 10px; margin-top: 10px;">
            <a href="Info.aspx" target="mainFrame" style="display: block; width: 50px; height: 30px;
                background: #e4f2ff none repeat scroll 0 0; border: 1px solid #cde6ff; text-align: center;
                line-height: 30px; float: left; margin-left: 10px;">电脑版</a><a href="../WapJiaoDian/Info.aspx"
                    target="mainFrame" style="display: block; width: 50px; height: 30px; background: #e4f2ff none repeat scroll 0 0;
                    border: 1px solid #cde6ff; text-align: center; line-height: 30px; float: left;
                    margin-left: 10px;">手机版</a>
        </div>
        <table class="table" cellspacing="0" cellpadding="5" width="99%" align="center" border="0">
            <tr>
                <th class="bg_tr" align="left" colspan="2" height="25">
                    焦点图
                </th>
            </tr>
            <tr align="center">
                <td class="td_bg">
                    <div class="pagetit">
                        <table width="99%" cellspacing="0" cellpadding="0" align="center" border="0" height="30">
                            <tbody>
                                <tr>
                                    <td height="30">
                                        标题：
                                        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                                        <asp:Button ID="Button3" runat="server" Text="搜索" CssClass="button button_search"
                                            OnClick="Button3_Click" />
                                    </td>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="Button1" runat="server" Text="添&nbsp;加" CssClass="button button_add"
                                            OnClick="Button1_Click" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    <table border="0" cellspacing="0" cellpadding="4" width="100%" align="center">
                        <tr>
                            <td class="td_bg biaoti" style="border-bottom: 1px solid #cde6ff; border-left: 1px solid #ddd;"
                                width="8%">
                                <a href="javascript:void(0)" onclick="select_all();">全选</a>/<a href="javascript:void(0)"
                                    onclick="reverse_select_all();">反选</a>
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="5%">
                                序号
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;">
                                标题
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="20%">
                                图片
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="7%">
                                推荐到首页
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="7%">
                                顺序
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="15%">
                                添加时间
                            </td>
                            <td class="td_bg biaoti center" style="border: 1px solid #cde6ff;" width="7%">
                                操作
                            </td>
                        </tr>
                        <asp:Repeater ID="repProInfo" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="td_bg" style="border-bottom: 1px solid #cde6ff; border-left: 1px solid #ddd;">
                                        <input type='checkbox' name='checkbox' id="<%#Eval("id") %>" />
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;"
                                        width="5%">
                                        <%# Container.ItemIndex+1%>
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;"
                                        title="<%# Eval("Title") %>">
                                        <a href='AddInfo.aspx?pid=<%# Eval("Id") %>' style="text-decoration: none; color: black;">
                                            <%# Eval("Title") %></a>
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;">
                                        <img src="<%#Eval("ImgName").ToString()==""?"../Images/no_pic.gif":("../Images/proImg/"+Eval("ImgName").ToString()) %>"
                                            width="160px" height="120px" />
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;">
                                        <%# Eval("IsOr").ToString() == "2" ? "否" : "是"%>
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;">
                                        <input type="text" class="inp_order" id='<%# Eval("Id")%>' val='<%# Eval("Orders")%>'
                                            value='<%# Eval("Orders")%>' style="width: 30px; text-align: center;" />
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;">
                                        <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                                    </td>
                                    <td class="td_bg center" style="border: 1px solid #cde6ff; border-top: none;">
                                        <a href='AddInfo.aspx?pid=<%# Eval("Id") %>'>修改</a>&nbsp;|&nbsp;<a href="javascript:void(0)"
                                            id="SingleDel" pid="<%#Eval("id") %>">删除</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="td_bg" colspan="3">
                    <div class="pager" runat="server" id="hidediv">
                        <webdiyer:AspNetPager ID="AspNetPager1" UrlPaging="true" runat="server" CssClass="anpager"
                            FirstPageText="首页" LastPageText="尾页" NextPageText="&gt;" PrevPageText="&lt;"
                            ShowPageIndexBox="Never" RecordCount="228" CurrentPageButtonClass="cpb" OnPageChanged="AspNetPager1_PageChanged">
                        </webdiyer:AspNetPager>
                        <span>共<asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>条数据&nbsp;第</span>
                        <input type="text" class="page_txt" id="pagecurrent" runat="server" value="1" readonly />
                        <span>页</span>
                    </div>
                </td>
            </tr>
            <tr align="center">
                <td class="td_bg pt0">
                    <div class="pagetit">
                        <table width="99%" cellspacing="0" cellpadding="0" align="center" border="0" height="30">
                            <tbody>
                                <tr>
                                    <td height="30" width="5%">
                                        <asp:HiddenField ID="hidTopId" runat="server" ClientIDMode="Static" />
                                        <a href="javascript:void(0)" id="checkAll">全选</a>/<a href="javascript:void(0)" id="checkAllBack">反选</a>
                                    </td>
                                    <td>
                                        <input type="button" value="一键删除" id="BtnDeleteAll" class="button button_delete" />
                                        <input type="button" value="更新顺序" id="BtnUpOrder" class="button button_edit" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>--%>
    </form>
</body>
</html>
