<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Web_Project.View.wap.Member" %>

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
    <script src="js/IsLogin.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="scroll-content">
        <div class="">
            <div class="my-info">
                <div class="my-info-background">
                </div>
                <div class="my-avatar">
                    <img src="../images/touxing.png">
                </div>
                <div class="name">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
                <div class="my-vip" style="background: none; display: none;">
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal></div>
            </div>
            <!-- 个人中心 begin-->
            <div class="aui-list-cells">
                <a href="MyOrder.aspx" class="aui-list-cell">
                    <div class="aui-list-cell-fl">
                        <img src="images/me-3.png"></div>
                    <div class="aui-list-cell-cn">
                        我的订单</div>
                    <div class="aui-list-cell-fr">
                        查看全部订单</div>
                </a>
                <div class="my-car-shortcut">
                    <div class="layout-column b-line" style="padding: 10px 0">
                        <a class="col" rel="test" href="MyOrder.aspx?oid=2"><span class="img-icon ">
                            <img class="img-icon-home" src="images/me-1.png" />
                        </span><span class="img-icon-name">待发货</span> </a><a class="col" rel="test" href="MyOrder.aspx?oid=1">
                            <span class="img-icon ">
                                <img class="img-icon-home" src="images/me-2.png" />
                            </span><span class="img-icon-name">已发货</span> </a><a class="col" href="MyOrder.aspx"
                                rel="test"><span class="img-icon ">
                                    <img class="img-icon-home" src="images/me-6.png" />
                                </span><span class="img-icon-name">全部订单</span> </a>
                    </div>
                </div>
                <a href="FaHuo.aspx" class="aui-list-cell">
                    <div class="aui-list-cell-fl">
                        <img src="images/me-3.png"></div>
                    <div class="aui-list-cell-cn">
                        分销订单</div>
                    <div class="aui-list-cell-fr">
                        查看全部订单</div>
                </a>
                <div class="my-car-shortcut">
                    <div class="layout-column b-line" style="padding: 10px 0">
                        <a class="col" rel="test" href="FaHuo.aspx?oid=2"><span class="img-icon ">
                            <img class="img-icon-home" src="images/me-1.png" />
                        </span><span class="img-icon-name">待发货</span> </a><a class="col" rel="test" href="FaHuo.aspx?oid=1">
                            <span class="img-icon ">
                                <img class="img-icon-home" src="images/me-2.png" />
                            </span><span class="img-icon-name">已发货</span> </a><a class="col" href="FaHuo.aspx"
                                rel="test"><span class="img-icon ">
                                    <img class="img-icon-home" src="images/me-6.png" />
                                </span><span class="img-icon-name">全部订单</span> </a>
                    </div>
                </div>
                <a href="Reg.aspx" class="aui-list-cell">
                    <div class="aui-list-cell-fl">
                        <img src="images/me-10.png"></div>
                    <div class="aui-list-cell-cn">
                        会员注册</div>
                    <div class="aui-list-cell-fr">
                    </div>
                </a><a href="javascript:void(0)" class="aui-list-cell">
                    <div class="aui-list-cell-fl">
                        <img src="images/me-4.png"></div>
                    <div class="aui-list-cell-cn">
                        我的奖金</div>
                    <div class="aui-list-cell-fr">
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal></div>
                </a><a href="javascript:void(0)" class="aui-list-cell">
                    <div class="aui-list-cell-fl">
                        <img src="images/me-7.png"></div>
                    <div class="aui-list-cell-cn">
                        提现比例</div>
                    <div class="aui-list-cell-fr">
                        <asp:Literal ID="Literal5" runat="server"></asp:Literal>&nbsp;%
                    </div>
                </a><a href="TxList.aspx" class="aui-list-cell">
                    <div class="aui-list-cell-fl">
                        <img src="images/me-5.png"></div>
                    <div class="aui-list-cell-cn">
                        我要提现</div>
                    <div class="aui-list-cell-fr">
                    </div>
                </a><a href="javascript:void(0)" class="aui-list-cell">
                    <div class="aui-list-cell-fl">
                        <img src="images/me-9.png"></div>
                    <div class="aui-list-cell-cn">
                        代理数量</div>
                    <div class="aui-list-cell-fr">
                        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                    </div>
                </a>
                <div class="devider b-line">
                </div>
                <a href="javascript:void(0)" id="aquit" class="aui-list-cell">
                    <div class="aui-list-cell-fl">
                        <img src="images/me-11.png"></div>
                    <div class="aui-list-cell-cn">
                        退出账号</div>
                    <div class="aui-list-cell-fr">
                    </div>
                </a>
            </div>
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
    </form>
</body>
</html>
