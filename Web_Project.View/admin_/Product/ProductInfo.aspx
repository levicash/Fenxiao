<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductInfo.aspx.cs" Inherits="Web_Project.View.admin_.Product.ProductInfo" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.tinyTips.js" type="text/javascript"></script>
    <link href="../css/tinyTips.css" rel="stylesheet" type="text/css" />
    <%--  下拉框--%>
    <link href="../css/select.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/select-ui.min.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%--调用带删除图片功能的JS--%>
    <script src="../Scripts/OperatingImg.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".select").uedSelect({
                width: 120
            });
            $('a.tTip').tinyTips('title');
            $('img.imgTip').tinyTips('title');
            $('img.tTip').tinyTips('title');
            $('h1.tagline').tinyTips('tinyTips are totally awesome!');
            Operating("ws_ProductInfo");
        });
    </script>
    <title>产品详细信息</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <div class="tools">
            <div class="serdiv fl">
                <dl>
                    <dt>标题：</dt>
                    <dd>
                        <asp:TextBox ID="txtTitle" CssClass="sdfinput" ClientIDMode="Static" runat="server"></asp:TextBox></dd>
                </dl>
                <dl style="margin-left: 15px;">
                    <dt>类型：</dt>
                    <dd>
                        <asp:DropDownList ID="ddlType" CssClass="select" runat="server">
                        </asp:DropDownList>
                    </dd>
                </dl>
                <div class="fl">
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnSearch" runat="server" Text="查&nbsp;&nbsp;询" CssClass="btn" OnClick="BtnSearch_Click" />
                </div>
            </div>
            <ul class="toolbar">
                <li class="click"><a href="AddInfo.aspx"><span>
                    <img src="../images/t01.png" /></span>添加</a></li>
            </ul>
        </div>
        <table class="tablelist">
            <thead>
                <tr>
                    <th width="2%">
                    </th>
                    <th width="5%">
                        编号
                    </th>
                    <th>
                        标题
                    </th>
                    <th width="8%">
                        产品分类
                    </th>
                    <th width="9%">
                        商品编号
                    </th>
                    <th width="5%">
                        商品规格
                    </th>
                    <th width="3%">
                        上架
                    </th>
                    <th width="3%">
                        精品
                    </th>
                    <th width="3%">
                        新品
                    </th>
                    <th width="3%">
                        热销
                    </th>
                    <th width="4%">
                        顺序
                    </th>
                    <th width="11%">
                        添加时间
                    </th>
                    <th width="12%">
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
                                <a href='AddInfo.aspx?id=<%# Eval("Id") %>&page=<%=page %>' style="text-decoration: none;
                                    color: black;">
                                    <%# Eval("Title") %></a>&nbsp;
                                <%#Eval("ImgName").ToString() == "" ? "" : "<img src='../Images/image_s.gif' title='../Images/proImg/" + Eval("ImgName").ToString() + "' class='imgTip' style=' vertical-align:middle;' />"%>
                            </td>
                            <td>
                                <%# Eval("btitle")%>
                            </td>
                            <td>
                                <%# Eval("BianHao")%>
                            </td>
                            <td>
                                <%# Eval("GuiGe")%>
                            </td>
                            <td>
                                <%# Eval("ShangJia").ToString() == "" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                            </td>
                            <td>
                                <%# Eval("JingPin").ToString() == "" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                            </td>
                            <td>
                                <%# Eval("XinPin").ToString() == "" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                            </td>
                            <td>
                                <%# Eval("ReXiao").ToString() == "" ? "<img src='../Images/no.gif' />" : "<img src='../Images/yes.gif' />"%>
                            </td>
                            <td>
                                <input type="text" class="inp_order" id='<%# Eval("Id")%>' val='<%# Eval("Orders")%>'
                                    value='<%# Eval("Orders")%>' />
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <a href='MoreImg.aspx?id=<%# Eval("Id") %>' class="tablelink">多图查看(<span style="color: red;"><%#MoreImgCount(Convert.ToInt32(Eval("Id")))%></span>)</a>&nbsp;|&nbsp;<a
                                    href='AddInfo.aspx?id=<%# Eval("Id") %>&page=<%=page %>' class="tablelink">修改</a>&nbsp;|&nbsp;<a
                                        href="javascript:void(0)" id="SingleDel" pid="<%#Eval("id") %>" class="tablelink">删除</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <div class="pager clearfix" runat="server" id="hidediv">
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="anpager" OnPageChanged="AspNetPager1_PageChanged"
                FirstPageText="首页" LastPageText="尾页" NextPageText="&gt;" PrevPageText="&lt;"
                ShowPageIndexBox="Never" RecordCount="228" UrlPaging="True" CurrentPageButtonClass="cpb">
            </webdiyer:AspNetPager>
            <div class="pxi">
                <span>共<asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>条数据&nbsp;第</span>
                <input type="text" class="page_txt" id="pagecurrent" runat="server" value="" onkeydown="javascript:enter(this,$('*[id$=Button1]'))" />
                <span>页</span>
                <asp:Button ID="Button1" runat="server" Text="确&nbsp;定" CssClass="btn_page" OnClick="Button1_Click" /></div>
        </div>
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
