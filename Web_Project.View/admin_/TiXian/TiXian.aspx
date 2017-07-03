﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TiXian.aspx.cs" Inherits="Web_Project.View.admin_.TiXian.TiXian" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AspNetPager" TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/Operating.js" type="text/javascript"></script>
    <%--  弹出框 layer--%>
    <script src="../../layer/layer.js" type="text/javascript"></script>
    <script src="../Scripts/tixian.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Operating("ws_ChongZhiInfo");
        });
    </script>
    <title>提现记录审核</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <div class="tools">
            <div class="serdiv fl">
                <dl>
                    <dt>提现会员：</dt>
                    <dd>
                        <asp:TextBox ID="txtTitle" CssClass="sdfinput" ClientIDMode="Static" runat="server"></asp:TextBox></dd>
                </dl>
                <dl style="margin-left: 15px;">
                    <dt>提现姓名：</dt>
                    <dd>
                        <asp:TextBox ID="TextBox2" CssClass="sdfinput" ClientIDMode="Static" runat="server"></asp:TextBox></dd>
                </dl>
                <div class="fl">
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnSearch" runat="server" Text="查&nbsp;&nbsp;询" CssClass="btn" OnClick="BtnSearch_Click" />
                </div>
            </div>
        </div>
        <table class="tablelist">
            <thead>
                <tr>
                    <th width="3%">
                    </th>
                    <th width="4%">
                        编号
                    </th>
                    <th>
                        提现会员
                    </th>
                    <th width="5%">
                        姓名
                    </th>
                    <th width="5%">
                        开户人
                    </th>
                    <th width="10%">
                        卡号
                    </th>
                    <th width="13%">
                        开户行
                    </th>
                    <th width="6%">
                        提现金额
                    </th>
                    <th width="6%">
                        提现比例
                    </th>
                    <th width="6%">
                        最终金额
                    </th>
                    <th width="6%">
                        审核状态
                    </th>
                    <th width="12%">
                        审核时间
                    </th>
                    <th width="12%">
                        充值时间
                    </th>
                    <th width="4%">
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
                                <%#Eval("Id") %>
                            </td>
                            <td>
                                <%# Eval("Uname")%>
                            </td>
                            <td>
                                <%# Eval("buname")%>
                            </td>
                            <td>
                                <%# Eval("KaiHuRen")%>
                            </td>
                            <td>
                                <%# Eval("KaHao")%>
                            </td>
                            <td>
                                <%# Eval("KaiHuHang")%>
                            </td>
                            <td>
                                <%# Eval("JinEr")%>
                            </td>
                            <td>
                                <%# Eval("LiLv")%>
                            </td>
                            <td style="color: #ff0000;">
                                <%# Eval("HouMoney")%>
                            </td>
                            <td>
                                <%# Eval("ShenHe").ToString() == "2" ? "<a href='javascript:void(0)' zid=" + Eval("id") + " zname=" + Eval("Uname") + " zprice=" + Eval("JinEr") + " page=" + page + " class='shenhe' style='color: blue; text-decoration: underline;'>未审核</a>" : "<span style='color:red;'>已审核</span>"%>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, "ShTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <a href="javascript:void(0)" id="SingleDel" pid="<%#Eval("id") %>" class="tablelink">
                                    删除</a>
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
                    <img src="../images/delete_btn_bg.png" /></span>一键删除</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    </form>
</body>
</html>
