<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web_Project.View.wap.Index" %>

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
    <script src="js/TouchSlide.1.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="bodycenter">
        <div class="aui-container">
            <div class="aui-page">
                <!-- 头部 begin-->
                <div class="header">
                    <div class="header_1">
                        <div class="header_2">
                            <input type="text" placeholder="秋季新品"></div>
                        <div class="header_3">
                            <a href="news.html" class="aui-icon-mag"></a>
                        </div>
                    </div>
                </div>
                <div style="height: 70px">
                </div>
                <!-- 头部 End-->
                <!-- 首页轮播 begin -->
                <div class="aui-banner-content">
                    <div id="focus" class="focus">
                        <div class="bd">
                            <div class="tempWrap" style="overflow: hidden; position: relative;">
                                <ul id="Gallery" class="gallery" style="width: 2250px; position: relative; overflow: hidden;
                                    padding: 0px; margin: 0px; transition-duration: 200ms; transform: translate(-1125px, 0px) translateZ(0px);">
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <li style="display: table-cell; vertical-align: top; width: 375px;"><a href="#">
                                                <img src="<%#Eval("ImgName").ToString()==""?"../admin_/Images/no_pic.gif":("../admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"></a>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                        <div class="hd">
                            <ul>
                            </ul>
                        </div>
                    </div>
                    <script>
                        /*banner首页轮播*/
                        TouchSlide({
                            slideCell: "#focus",
                            titCell: ".hd ul", // 开启自动分页 autoPage:true ，此时设置 titCell 为导航元素包裹层
                            mainCell: ".bd ul",
                            effect: "leftLoop",
                            autoPlay: true, // 自动播放
                            autoPage: true, // 自动分页
                            delayTime: 200, // 毫秒；切换效果持续时间（执行一次效果用多少毫秒）
                            interTime: 5000, // 毫秒；自动运行间隔（隔多少毫秒后执行下一个效果）
                            switchLoad: "_src" // 切换加载，真实图片路径为"_src"
                        });
</script>
                </div>
                <!-- 首页轮播 end -->
                <!-- 分类切换 begin -->
                <div class="" id="container">
                    <div id="main">
                        <div id="scroller">
                            <div class="swiper-container swiper-container2 swiper-container-horizontal">
                                <div class="swiper-slide1 swiper-slide-duplicate ">
                                    <ul class="icon-list">
                                        <li class="iconl"><a href="bag.html"><span class="icon-circle">
                                            <img src="images/icon1.jpg"></span> <span class="icon-desc">我的订单</span> </a>
                                        </li>
                                        <li class="iconl"><a href="ProType.aspx"><span class="icon-circle">
                                            <img src="images/icon2.jpg"></span> <span class="icon-desc">全部分类</span> </a>
                                        </li>
                                        <li class="iconl"><a href="new-pd.html"><span class="icon-circle">
                                            <img src="images/icon3.jpg"></span> <span class="icon-desc">购物车</span> </a></li>
                                        <li class="iconl"><a href="#"><span class="icon-circle">
                                            <img src="images/icon4.jpg"></span> <span class="icon-desc">个人中心</span> </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 分类切换 end -->
                <div class="devider t-line">
                </div>
                <div class="b-line" style="position: relative">
                </div>
                <div class="txtScroll-top">
                    <div class="bd">
                        <ul class="infoList">
                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <li><a href="NewsInfo.aspx?id=<%#Eval("Id") %>&tid=<%#Eval("Type") %>">
                                        <%#Eval("Title") %>
                                    </a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
                <script id="jsID" type="text/javascript">
                    jQuery(".txtScroll-top").slide({ mainCell: ".bd ul", autoPage: true, effect: "top", autoPlay: true, vis: 1 });
                </script>
                <div class="my-car-thumbnail">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
                <div class="aui-title-h">
                    大牌热卖
                </div>
                <div class="repro">
                    <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <div class="repro_1">
                                <div class="repro_2">
                                    <a href="ProductInfo.aspx?id=<%#Eval("Id") %>&tid=<%#Eval("Type") %>">
                                        <img src="<%#Eval("ImgName").ToString()==""?"../admin_/Images/no_pic.gif":("../admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                                            alt="<%#Eval("Title") %>" title="<%#Eval("Title") %>" /></a>
                                </div>
                                <div class="repro_3">
                                    <a href="ProductInfo.aspx?id=<%#Eval("Id") %>&tid=<%#Eval("Type") %>" class="aui-flex-box">
                                        <%#Eval("Title").ToString() %></a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="aui-title-h">
                    新品上架
                </div>
                <div class="indexpro">
                    <asp:Repeater ID="Repeater4" runat="server">
                        <ItemTemplate>
                            <div class="indexpro_1">
                                <div class="indexpro_2">
                                    <a href="ProductInfo.aspx?id=<%#Eval("Id") %>&tid=<%#Eval("Type") %>">
                                        <img src="<%#Eval("ImgName").ToString()==""?"../admin_/Images/no_pic.gif":("../admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                                            alt="<%#Eval("Title") %>" title="<%#Eval("Title") %>" /></a>
                                </div>
                                <div class="indexpro_3">
                                    <a href="ProductInfo.aspx?id=<%#Eval("Id") %>&tid=<%#Eval("Type") %>">
                                        <%#Eval("Title").ToString() %>
                                    </a>
                                </div>
                                <div class="indexpro_4">
                                    ￥<%#ProXinPinPrice(Eval("Id").ToString())%>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div style="height: 120px">
                </div>
                <div class="tab-bar tab-bottom">
                    <a class="tab-button active" href="Index.aspx"><i class="tab-button-icon icon icon-home">
                    </i><span class="tab-button-txt">首页</span></a> <a class="tab-button cached" href="ProType.aspx">
                        <i class="tab-button-icon icon icon-service"></i><span class="tab-button-txt">分类</span></a>
                    <a class="tab-button cached" href="ShopCart.aspx"><i class="tab-button-icon icon icon-car">
                    </i><span class="tab-button-txt">购物车</span></a> <a class="tab-button cached" href="Member.aspx">
                        <i class="tab-button-icon icon icon-my"></i><span class="tab-button-txt">我的</span></a>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
