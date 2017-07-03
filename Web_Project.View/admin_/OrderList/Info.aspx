<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="Web_Project.View.admin_.OrderList.Info" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%--调用带删除功能的JS--%>
    <script src="../Scripts/OperatingOrder.js" type="text/javascript"></script>
    <script src="../../layer/layer.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Operating("ws_OrderList");
            $(".orderId").click(function () {
                var oid = $.trim($(this).attr("oid"));
                layer.open({
                    type: 2,
                    title: '订单详情',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['80%', '500px'],
                    content: 'OrderInfo.aspx?oid=' + oid //iframe的url
                });
            });
        });
    </script>
    <title>订单管理列表</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <div class="tools">
            <div class="serdiv fl">
                <dl>
                    <dt>订单号：</dt>
                    <dd>
                        <asp:TextBox ID="TextBox1" CssClass="sdfinput" ClientIDMode="Static" runat="server"></asp:TextBox></dd>
                </dl>
                <dl style="margin-left: 15px;">
                    <dt>会员号：</dt>
                    <dd>
                        <asp:TextBox ID="txtTitle" CssClass="sdfinput" ClientIDMode="Static" runat="server"></asp:TextBox></dd>
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
                        订单号
                    </th>
                    <th width="10%">
                        会员号
                    </th>
                    <th width="8%">
                        金额
                    </th>
                    <th width="12%">
                        发货时间
                    </th>
                    <th width="12%">
                        快递单号
                    </th>
                    <th width="12%">
                        快递公司
                    </th>
                    <th width="6%">
                        发货状态
                    </th>
                    <th width="12%">
                        添加时间
                    </th>
                    <th width="4%">
                        操作
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr class="tr<%#Eval("id") %>">
                            <td>
                                <input type='checkbox' name='checkbox' id="<%#Eval("id") %>" />
                            </td>
                            <td>
                                <%#Eval("id") %>
                            </td>
                            <td>
                                <a href='javascript:void(0)' class="tablelink orderId" oid="<%# Eval("OrderId")%>">
                                    <%# Eval("OrderId")%></a>
                            </td>
                            <td>
                                <%# Eval("Rname")%>
                            </td>
                            <td>
                                <%# Eval("Zjiage")%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "FaTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <%# Eval("KdDanhao")%>
                            </td>
                            <td>
                                <%# Eval("KdGongsi")%>
                            </td>
                            <td>
                                <%#Eval("IsFaHuo").ToString() == "2" ? "<a style='color:Blue; text-decoration: underline;cursor: pointer;' class='fahuo'  fid=" + Eval("Id") + " page="+page+">未发货</a>" : (Eval("IsFaHuo").ToString() == "1" ? "<span style='color:red;'>已发货</span>" : "")%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <a href="javascript:void(0)" id="SingleDel" pid="<%#Eval("id") %>" oid="<%# Eval("OrderId")%>"
                                    class="tablelink">删除</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <div class="clear">
        </div>
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
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
        $(document).ready(function () {
            //点击发货
            $(".fahuo").click(function () {
                var fid = $.trim($(this).attr("fid"));
                var page = $.trim($(this).attr("page"));
                layer.open({
                    type: 2,
                    title: '填写发货信息',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['50%', '500px'],
                    content: "AddWl.aspx?fid=" + fid + "&page=" + page + "" //iframe的url
                });
            });
        });

        function saveus(para1, para2, para3, para4) {
            layer.load(0, { shade: [0.1, '#000'] });
            var href = window.location.href;
            var href1 = "";
            if (href.indexOf("page") > 0) {
                href1 = href.substring(0, href.lastIndexOf("?"));
            } else {
                href1 = href;
            }
            var query = "{fid:" + para1 + ",danhao:'" + para2 + "',gongsi:'" + para3 + "'}";
            layer.confirm('确认发货？', { title: '提示信息',
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "../StaticMethod/Info.aspx/IsFaHuoMethod",
                    data: query,
                    dataType: "json",
                    success: function (result) {
                        layer.closeAll('loading');
                        if (result.d) {
                            layer.msg('发货成功', { icon: 1 });
                            window.location.href = href1 + "?page=" + para4;
                        }
                        else {
                            layer.msg('转货失败，请刷新重试', { icon: 2 });
                        }
                    },
                    error: function () {
                        layer.closeAll('loading');
                    }
                });
            }, function () {
                layer.closeAll('loading');
            });
        }
    </script>
    </form>
</body>
</html>
