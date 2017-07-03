<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web_Project.View.Index1" %>

<%@ Register Src="~/Contrl/Foot.ascx" TagName="Foot" TagPrefix="uc1" %>
<%@ Register Src="~/Contrl/Top.ascx" TagName="Top" TagPrefix="uc2" %>
<%@ Import Namespace="Web_Project.Core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="shortcut icon" href="/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link href="Styles/common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/index.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="Scripts/IsLogin.js" type="text/javascript"></script>
    <script src="Scripts/IndexLogin.js" type="text/javascript"></script>
    <script src="Scripts/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
    <!--banner引用-->
    <link href="Styles/nivo-slider.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery.nivo.slider.pack.js" type="text/javascript"></script>
    <!--返回top-->
    <script src="Scripts/scrolltopcontrol.js" type="text/javascript"></script>
    <!--首页JS-->
    <script src="Scripts/index.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#slider").nivoSlider(); //banner调用
        });
</script>
</head>
<body>
    <uc2:Top ID="Top1" runat="server" />
    <div class="banner_box">
        <div class="left_nav">
            <ul id="nav">
                <% foreach (ProTypeCore typeCore in ProType())
                   {
                %>
                <li class="mainCate">
                    <h3>
                        <a href="Product_<%=typeCore.Id %>.aspx">
                            <%=typeCore.Title %></a></h3>
                    <div class="subCate">
                        <% foreach (ProTypeCore typeCore1 in ProType1(typeCore.Id))
                           {
                        %>
                        <ul id="sub-ul-1">
                            <h4>
                                <a href="Product_<%=typeCore1.Id %>.aspx">
                                    <%=typeCore1.Title %></a></h4>
                            <li><span>
                                <% foreach (ProductInfoCore infoCore in ProductInfoMethod(typeCore1.Id))
                                   {
                                %>
                                <a href="ProductInfo_<%=infoCore.Id %>_<%=infoCore.Type %>.aspx">
                                    <%=infoCore.Title%></a>
                                <%} %>
                            </span></li>
                        </ul>
                        <%} %>
                    </div>
                </li>
                <%} %>
            </ul>
            <script type="text/javascript">
                jQuery("#nav").slide({
                    type: "menu", //效果类型
                    titCell: ".mainCate", // 鼠标触发对象
                    targetCell: ".subCate", // 效果对象，必须被titCell包含
                    delayTime: 0, // 效果时间
                    triggerTime: 0, //鼠标延迟触发时间
                    defaultPlay: false, //默认执行
                    returnDefault: true//返回默认
                });
            </script>
        </div>
        <div class="banner">
            <div class="banner1">
                <div class="slide-box">
                    <div class="slider">
                        <div class="theme-default">
                            <div id="slider" class="nivoSlider">
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <a href="javascript:void(0)">
                                            <img src="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                                                data-thumb="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                                                alt="" /></a>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="banner2">
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
            </div>
        </div>
        <div class="banner_right">
            <div class="denglu">
            </div>
            <div class="home_1">
                <a href="javascript:void(0)" class="a1 se">公告信息</a> <a href="javascript:void(0)"
                    class="a2">促销活动</a>
            </div>
            <ul class="news" style="display: block;">
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <li><a href="NewsInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">·&nbsp;<%#Eval("Title") %>
                        </a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <ul class="news">
                <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                        <li><a href="NewsInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">·&nbsp;<%#Eval("Title") %>
                        </a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <div class="xinpin">
        <img class="xinpin_top" src="images/biaoti.png">
        <div class="xinpin_1">
            <div class="xinpin_2">
                <asp:Repeater ID="Repeater4" runat="server">
                    <ItemTemplate>
                        <div class="xinpin_tu">
                            <div class="xt_1">
                                <a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                                    <img src="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                                        alt="<%#Eval("Title") %>" title="<%#Eval("Title") %>" /></a>
                            </div>
                            <div class="xt_2">
                                <a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                                    <%#Eval("Title").ToString()%></a></div>
                            <div class="xt_3">
                                <div class="xt_4 fl">
                                    ￥
                                    <%#Eval("XPrice").ToString()%></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div class="guanggao">
        <asp:Literal ID="Literal3" runat="server"></asp:Literal>
    </div>
    <% foreach (ProTypeCore typeCore in ProTypeYiJiMethod())
       {
    %>
    <div class="cont_pro_box" id="box<%=typeCore.Num %>" bxid="<%=typeCore.Num %>">
        <div class="pro_biaoti">
            <div class="pb_1 fl">
                <dl>
                    <dt>
                        <%=typeCore.Num %>F</dt>
                    <dd>
                        <%=typeCore.Title %></dd>
                </dl>
            </div>
            <div class="pb_2 fl">
                <% foreach (ProTypeCore typeCore1 in ProTypeErJiMethod(typeCore.Id))
                   {
                %>
                <a href="javascript:void(0)" tid="<%=typeCore.Id %>" erid="<%=typeCore1.Id %>">
                    <%=typeCore1.Title %></a>
                <%} %>
            </div>
        </div>
        <div class="home_2">
            <div class="pro_left">
                <a href="#">
                    <img src="images/genghuan2.png"></a>
            </div>
            <% foreach (ProTypeCore typeCore1 in ProTypeErJiMethod(typeCore.Id))
               {
            %>
            <div class="pro_cont" id="tdiv<%=typeCore1.Id %>">
                <% foreach (ProductInfoCore infoCore in ProductInfoMethod(typeCore1.Id, "精品"))
                   {
                %>
                <dl>
                    <dt><a href="ProductInfo_<%=infoCore.Id %>_<%=infoCore.Type %>.aspx">
                        <img src="<%=infoCore.ImgName ==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+infoCore.ImgName) %>"
                            alt="<%=infoCore.Title %>" title="<%=infoCore.Title %>" /></a></dt>
                    <dd class="dd1">
                        <a href="ProductInfo_<%=infoCore.Id %>_<%=infoCore.Type %>.aspx">
                            <%=infoCore.Title %></a>
                    </dd>
                    <dd class="dd2">
                        ￥<%=infoCore.XPrice%>
                    </dd>
                </dl>
                <%} %>
            </div>
            <%} %>
            <div class="pro_right">
                <% foreach (ProductInfoCore youCore in ProductInfoYouMethod(typeCore.Id, "热销"))
                   {
                %>
                <div class="kuang">
                    <div class="pro_right_pro">
                        <a href="ProductInfo_<%=youCore.Id %>_<%=youCore.Type %>.aspx">
                            <img src="<%=youCore.ImgName ==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+youCore.ImgName) %>"
                                alt="<%=youCore.Title %>" title="<%=youCore.Title %>" /></a>
                    </div>
                    <div class="pro_right_word">
                        <p>
                            <a href="ProductInfo_<%=youCore.Id %>_<%=youCore.Type %>.aspx">
                                <%=youCore.Title%></a></p>
                        <dl>
                            <dt>￥<%=youCore.XPrice%></dt>
                            <%--<dd>
                                <del>￥<%=youCore.ShiChangJia%></del></dd>--%>
                        </dl>
                        <img src="images/chakan.png">
                    </div>
                </div>
                <%} %>
            </div>
        </div>
    </div>
    <%} %>
    <uc1:Foot ID="Foot1" runat="server" />
</body>
</html>
