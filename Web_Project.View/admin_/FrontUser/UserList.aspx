<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Web_Project.View.admin_.FrontUser.UserList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Import Namespace="Web_Project.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>会员列表</title>
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="../css/jquery-webox.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-webox.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <script src="../Scripts/Operating.js" type="text/javascript"></script>
    <%--  激活--%>
    <script src="../Scripts/hyshenhe.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //iframe弹出层调用
            $('.outside').click(function () {
                $.webox({
                    height: 400,
                    width: 600,
                    bgvisibel: true,
                    title: '会员详细信息',
                    iframe: 'UserInfo.aspx?uid=' + $(this).attr("uid")
                });
            });
            Operating("ws_RegisterInfo");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <div class="tools">
            <div class="serdiv fl">
                <dl>
                    <dt>会员号：</dt>
                    <dd>
                        <asp:TextBox ID="txtTitle" CssClass="sdfinput" ClientIDMode="Static" runat="server"></asp:TextBox></dd>
                </dl>
                <dl style="margin-left: 15px;">
                    <dt>姓名：</dt>
                    <dd>
                        <asp:TextBox ID="TextBox1" CssClass="sdfinput" ClientIDMode="Static" runat="server"></asp:TextBox>
                    </dd>
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
                    <th width="5%">
                        编号
                    </th>
                    <th>
                        会员号
                    </th>
                    <th width="9%">
                        注册人
                    </th>
                    <th width="9%">
                        推荐人
                    </th>
                    <th width="6%">
                        姓名
                    </th>
                    <th width="7%">
                        奖金账户
                    </th>
                    <th width="7%">
                        余额账户
                    </th>
                    <th width="7%">
                        激活状态
                    </th>
                    <th width="12%">
                        激活时间
                    </th>
                    <th width="12%">
                        添加时间
                    </th>
                    <th width="9%">
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
                                <%#Eval("Id")%>
                            </td>
                            <td>
                                <a href='AddUserList.aspx?id=<%# Eval("Id") %>&page=<%=page %>' style="text-decoration: none;
                                    color: black;">
                                    <%# Eval("Rname")%></a>
                            </td>
                            <td>
                                <%# Eval("ZhuCeRen")%>
                            </td>
                            <td>
                                <%# Eval("TuiJianRen")%>
                            </td>
                            <td>
                                <%# Eval("Uname")%>
                            </td>
                            <td>
                                <%# Eval("Jiangjin")%>
                            </td>
                            <td>
                                <%# Eval("YuErMoney")%>
                            </td>
                            <td>
                                <%# Eval("IsJiHuo").ToString() == "1" ? "<a href='javascript:void(0)' class='cshenhe' cid='" + Eval("Id") + "' style='color:red;text-decoration:underline;'>未激活</a>" : (Eval("IsJiHuo").ToString() == "2" ? "<span style='color:#0f59a9;'>已激活</span>" : "")%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "JiHuoDate", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <a href='javascript:void(0)' class="tablelink outside" uid="<%#Eval("id") %>">详细</a>&nbsp;|&nbsp;<a
                                    href='AddUserList.aspx?id=<%# Eval("Id") %>&page=<%=page %>' class="tablelink">修改</a>&nbsp;|&nbsp;<a
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
                ShowPageIndexBox="Never" RecordCount="228" CurrentPageButtonClass="cpb">
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
