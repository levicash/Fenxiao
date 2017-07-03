<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FaHuo.aspx.cs" Inherits="Web_Project.View.wap.FaHuo" %>

<%@ Import Namespace="Web_Project.Core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="target-densitydpi=device-dpi,width=640px, user-scalable=no" />
    <meta name="MobileOptimized" content="640" />
    <meta name="Iphone-content" content="640" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/scrolltopcontrol.js" type="text/javascript"></script>
    <link href="css/ui.css" rel="stylesheet" type="text/css" />
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="../layer/mobile/layer.js" type="text/javascript"></script>
    <script src="js/fahuo.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            var pid = getQueryString("oid");
            if (pid == "1") {
                $(".aui-b-border li.aui-hit").removeClass("aui-hit");
                $(".aui-b-border li").eq(2).addClass("aui-hit");
            }
            if (pid == "2") {
                $(".aui-b-border li.aui-hit").removeClass("aui-hit");
                $(".aui-b-border li").eq(1).addClass("aui-hit");
            }

        });
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            if (r != null) return unescape(decodeURI(r[2])); return null;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="aui-container">
        <div class="aui-page">
            <div class="header">
                <div class="header-background">
                </div>
                <div class="toolbar statusbar-padding">
                    <button class="bar-button back-button" onclick="history.go(-1);" dwz-event-on-click="click">
                        <i class="icon icon-back"></i>
                    </button>
                    <div class="header-title">
                        <div class="title">
                            分销订单</div>
                    </div>
                </div>
            </div>
            <div style="height: 70px">
            </div>
            <div class="aui-t-content">
                <div class="aui-tab ">
                    <ul class="aui-b-border">
                        <li class="aui-hit"><a href="FaHuo.aspx">全部订单</a></li>
                        <li class=""><a href="FaHuo.aspx?oid=2">待发货</a></li>
                        <li class=""><a href="FaHuo.aspx?oid=1">已发货</a></li>
                    </ul>
                    <div class="aui-panes">
                        <div class="aui-pane">
                            <div class="main_con" style="margin-bottom: 10px;">
                                <div class="main_con_goods">
                                    <% foreach (OrderListCore orderList in OrderList())
                                       {
                                    %>
                                    <div class="order_1">
                                        <div class="order_2">
                                            订单号：<%=orderList.OrderId%>
                                        </div>
                                        <div class="order_3">
                                            <%=(orderList.IsFaHuo).ToString() == "1" ? "已发货" : "<a href='javascript:void(0)' class='fahuo' jhid='" + orderList.Id + "' uname='" + orderList.Rname + "' zprice='" + orderList.Zjiage + "'>点击发货</a>"%>
                                        </div>
                                    </div>
                                    <ul>
                                        <% foreach (BuyListViewCore buyListView in BuyListViewMethod(orderList.OrderId))
                                           {
                                        %>
                                        <li style="margin-bottom: 0;">
                                            <div class="auicrl_1">
                                                <div class="aui-crl">
                                                    <img src="<%=buyListView.ImgName.ToString()==""?"../admin_/Images/no_pic.gif":("../admin_/Images/proImg/"+buyListView.ImgName) %>" />
                                                </div>
                                                <div class="aui-crl1">
                                                    <h2>
                                                        <%=buyListView.Title%></h2>
                                                    <p class="money">
                                                        <em class="aui-redd">￥<span><%=buyListView.DanJia%></span></em> <em class="emnum"
                                                            style="color: #999; font-size: 1.2rem">x<span><%=buyListView.Num%></span></em>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                        <%} %>
                                    </ul>
                                    <div class="aui-qux">
                                        <p style="color: #888; font-size: 1.3rem" class="b-line">
                                            一共<%=orderList.Znum%>件商品 共计:￥<%=orderList.Zjiage%></p>
                                    </div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--内容信息 end-->
        </div>
    </div>
    <div style="height: 120px">
    </div>
    <div class="tab-bar tab-bottom">
        <a class="tab-button" href="Index.aspx"><i class="tab-button-icon icon icon-home"></i>
            <span class="tab-button-txt">首页</span></a> <a class="tab-button cached" href="ProType.aspx">
                <i class="tab-button-icon icon
    icon-service"></i><span class="tab-button-txt">分类</span></a> <a class="tab-button
    cached" href="ShopCart.aspx"><i class="tab-button-icon icon icon-car"></i><span class="tab-button-txt">
        购物车</span></a> <a class="tab-button active" href="Member.aspx"><i class="tab-button-icon icon icon-my">
        </i><span class="tab-button-txt">我的</span></a>
    </div>
    <input id="Hidden1" type="hidden" />
    <input id="Hidden2" type="hidden" />
    <input id="Hidden3" type="hidden" />
    <div class="heian">
    </div>
    <div class="ptan">
        <div class="ptan_1">
            <div class="ptan_10">
                填写发货信息
            </div>
            <div class="ptan_7">
                <input type="text" name="name" id="name" placeholder="快递单号" autocomplete="off" class="input_yh" />
                <input type="text" name="pass" id="pass" placeholder="快递公司" autocomplete="off" class="input_mm" />
            </div>
            <div class="ptan_9">
                <a href="javascript:void(0)" class="a2 btn_gwc btn_queding" pid="">提交</a> <a href="javascript:void(0)"
                    class="a1 btn_gwc btn_back" pid="">返回</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
