<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Web_Project.View.admin_.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>网站管理系统</title>
    <link href="css/common.css" rel="stylesheet" type="text/css" />
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <!--退出-->
    <script src="Scripts/backout.js" type="text/javascript"></script>
    <!--获取位置信息-->
    <script src="Scripts/location.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(".nav li a").click(function () {
                $(".nav li a.selected").removeClass("selected");
                $(this).addClass("selected");
            });
            $(".sideMenu li").click(function () {
                $(".sideMenu li.active").removeClass("active");
                $(this).addClass("active");
            });
            $(".sideMenu .title").click(function () {
                var itid = $(this).attr("items");
                var temp = $(".sideMenu ul#items" + itid + "").is(":hidden");
                if (temp == true) {
                    $(".sideMenu ul").hide();
                    $(".sideMenu ul#items" + itid + "").show();
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="top">
        <div id="top_t">
            <div class="topleft">
                <a href="http://www.cn539.com" target="_blank">
                    <img src="images/logo.png" title="系统首页" /></a>
            </div>
            <ul class="nav">
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <li><a href="<%#Eval("Url") %>" target="rightMain">
                            <img src="<%#Eval("ImgName").ToString()==""?"Images/no_pic.gif":("Images/proImg/"+Eval("ImgName").ToString()) %>"
                                width="45px" height="45px" title="<%#Eval("Title") %>" />
                            <h2>
                                <%#Eval("Title") %></h2>
                        </a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div class="topright">
                <div id="photo" class="fl">
                    <img src="images/a.png" alt="" width="60" height="60">
                </div>
                <div class="topright1 fr">
                    <ul>
                        <li><a href="/Index.aspx" target="_blank">前台首页</a></li>
                        <li><a href="editpwd.aspx" target="rightMain">修改密码</a></li>
                        <li><a href="javascript:void(0)" id="backout">退出</a></li>
                    </ul>
                    <div class="user">
                        <span>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal></span> <i>消息</i> <b>0</b>
                    </div>
                </div>
            </div>
        </div>
        <div id="side_here">
            <div id="side_here_l" class="fl">
                <span></span>导航菜单
            </div>
            <div id="here_area" class="fl">
                <span>位置：</span>
                <ul class="placeul fl">
                    <li><a href="right.aspx" target="rightMain">首页</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="side">
        <div class="sideMenu" style="margin: 0 auto">
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound1">
                <ItemTemplate>
                    <h3 id="dis_a" class="title" runat="server" items='<%#Eval("Id") %>' visible="false">
                        <span>
                            <img src="images/leftico01.png" /></span><%#Eval("Title")%></h3>
                    <asp:Label ID="lbl" Text='<%#Eval("Id") %>' runat="server" Visible="false"></asp:Label>
                    <ul id="items<%#Eval("Id") %>">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
                                <asp:Label ID="lbl2" Text='<%#Eval("Id") %>' runat="server" Visible="false"></asp:Label>
                                <li id="dis_b" runat="server" visible="false"><cite></cite><a href="<%# Eval("Url") %>"
                                    lid="<%#Eval("Id") %>" target="rightMain">
                                    <%#Eval("Title")%></a><i></i></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="main">
        <iframe name="rightMain" id="rightMain" src="right.aspx" frameborder="no" scrolling="auto"
            width="100%" allowtransparency="true"></iframe>
    </div>
    <div id="dt" style="position: absolute; width: 320px; height: 140px; padding: 60px 0 0 30px;
        right: 20px; bottom: 0; z-index: 10; background-color: #ff0000; font-size: 24px;
        color: #fff; display: none;">
        友情提示：<br />
        您有未发货订单，请尽快处理
        <div style="position: absolute; width: 20px; height: 19px; top: 0; right: 0;">
            <img src="Images/timg.png" id="guanbi" style="width: 20px; cursor: pointer;" />
        </div>
    </div>
    <script>
        setInterval("asd()", 5000);
        function asd() {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod/Info.aspx/IsYouFahuo",
                data: "",
                dataType: "json",
                success: function (result) {
                    if (result.d[0] == "1") {
                        $("#dt").show();
                    }
                    if (result.d[0] == "2") {
                        $("#dt").hide();
                    }
                },
                error: function () {
                }
            });
        }
        $(function () {
            $("#guanbi").click(function () {
                $("#dt").hide();
            });
        });
    </script>
    </form>
</body>
</html>
