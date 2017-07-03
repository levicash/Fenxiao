<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductInfo.aspx.cs" Inherits="Web_Project.View.wap.ProductInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="target-densitydpi=device-dpi,width=640px, user-scalable=no" />
    <meta name="MobileOptimized" content="640" />
    <meta name="Iphone-content" content="640" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/TouchSlide.1.1.js" type="text/javascript"></script>
    <link href="css/ui.css" rel="stylesheet" type="text/css" />
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="js/scrolltopcontrol.js" type="text/javascript"></script>
    <script src="../layer/mobile/layer.js" type="text/javascript"></script>
    <script src="js/jquery.Spinner.js" type="text/javascript"></script>
    <script src="../layer/mobile/layer.js" type="text/javascript"></script>
    <script src="js/product.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#d").Spinner({ value: 1, min: 1, len: 4, max: 10000 });
        });
    </script>
</head>
<body class="item">
    <form id="form1" runat="server">
    <div class="header">
        <div class="" style="background: none">
        </div>
        <div class="toolbar statusbar-padding">
            <button class="bar-button back-button" onclick="history.go(-1);" dwz-event-on-click="click">
                <i class="icon icon-back-i"></i>
            </button>
            <div class="header-title">
                <div class="title">
                </div>
            </div>
        </div>
    </div>
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
    <section class="header" style="position: inherit">
	<div class="pro_1"><asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
	<div class="price ">
		<div class="current-price">
			<span class="current-price"><small>￥</small><asp:Literal ID="Literal2" runat="server"></asp:Literal></span>
		</div>
	</div>
</section>
    <section class="sku">
	<dl class="sku-group">
		<dt>已选: </dt>
		<dd>请选择</dd>
	</dl>
</section>
    <section class="content">
	<div class="nav">
		商品详细
	</div>
	<div class="desc">
		<asp:Literal ID="Literal3" runat="server"></asp:Literal>
	</div>

</section>
    <div style="height: 50px">
    </div>
    <footer class="footer t-line">
	<div class="aui-car-ear">
	    <div class=""><a href="javascript:void(0)" class="aui-car-lli">立即购买</a></div>
		<div class=""><a href="javascript:void(0)" class="aui-car-all">加入购物车</a></div>
	</div>
</footer>
    <div class="heian">
    </div>
    <div class="ptan">
        <div class="ptan_1">
            <div class="ptan_2">
                <div class="ptan_3">
                    <asp:Image ID="Image1" runat="server" />
                </div>
                <div class="ptan_4">
                    <div class="ptan_5">
                        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                    </div>
                    <div class="ptan_6">
                        ￥&nbsp;<span><asp:Literal ID="Literal5" runat="server"></asp:Literal></span>
                    </div>
                </div>
            </div>
            <div class="ptan_7">
                数量
            </div>
            <div class="ptan_8">
                <div id="d" class="Spinner">
                </div>
            </div>
            <div class="ptan_9">
                <a href="javascript:void(0)" class="a2 btn_gwc" pid="<%=prid %>">加入购物车</a> <a href="javascript:void(0)"
                    class="a1 btn_gwc" pid="<%=prid %>">立即购买</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
