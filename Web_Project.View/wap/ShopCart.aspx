<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="Web_Project.View.wap.ShopCart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="target-densitydpi=device-dpi,width=640px, user-scalable=no" />
    <meta name="MobileOptimized" content="640" />
    <meta name="Iphone-content" content="640" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="css/ui.css" rel="stylesheet" type="text/css" />
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="../layer/mobile/layer.js" type="text/javascript"></script>
    <script src="js/shopcart.js" type="text/javascript"></script>
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
                            购物车</div>
                    </div>
                </div>
            </div>
            <div style="height: 60px">
            </div>
            <div class="you_goods">
                <div class="main_con">
                    <div class="main_con_goods">
                        <ul>
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <div class="auicrl_1">
                                            <div class="aui-crl">
                                                <img src="<%#Eval("ImgName").ToString()==""?"../admin_/Images/no_pic.gif":("../admin_/Images/proImg/"+Eval("ImgName").ToString()) %>" />
                                            </div>
                                            <div class="aui-crl1">
                                                <h2>
                                                    <%#Eval("Title")%></h2>
                                                <p class="money">
                                                    <em class="aui-redd">￥<span><%#ProXinPinPrice(Eval("Pid").ToString())%></span></em>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="auicrl_2">
                                            <div class="auicrl_3">
                                                <input class="add" type="button" value="" jhid="<%#Eval("Id") %>" />
                                                <input class="num shuliang" type="text" id="sl<%#Eval("Id") %>" jhid="<%#Eval("Id") %>" num="<%#Eval("Num")%>"
                                                    value="<%#Eval("Num")%>" />
                                                <input class="del" type="button" value="" jhid="<%#Eval("Id") %>" />
                                            </div>
                                            <div class="auicrl_4">
                                                <a href="javascript:void(0)" class="SingleDel" jhid="<%#Eval("Id") %>"></a>
                                            </div>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <!--内容信息 end-->
                <!--结算信息 start-->
                <div class="settlement t-line">
                    <div class="settlement_left">
                        <font class="zongji">总计：</font><font class="money">￥<span>0</span></font><br />
                        （共<span class="sp1">0</span>件，不含运费）
                    </div>
                    <div class="settlement_right">
                        <a href="Settle.aspx">去结算</a>
                    </div>
                </div>
                <!--结算信息 end-->
            </div>
            <!--无商品页面 start-->
            <div class="no_goods">
                <img src="images/icon8.png" />
                <p>
                    购物车里没有东西哦~<br />
                    快去商城逛逛吧！</p>
                <a href="Product.aspx">即刻添置</a>
            </div>
            <!--无商品页面 end-->
        </div>
    </div>
    </form>
</body>
</html>
