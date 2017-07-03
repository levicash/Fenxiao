<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ProductInfo.aspx.cs" Inherits="Web_Project.View.ProductInfo" %>

<%@ Register Src="~/Contrl/LeftNav.ascx" TagName="LeftNav" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/nei.css" rel="stylesheet" type="text/css" />
    <%--loading加载中  样式--%>
    <link href="Styles/sweetalert.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/sweetalert.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.Spinner.js" type="text/javascript"></script>
    <script src="Scripts/base.js" type="text/javascript"></script>
    <script src="Scripts/product.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var yiSrc = $(".list-h li").eq(0).find("img").prop("src");
            $(".jqzoom img").removeAttr("src");
            $(".jqzoom img").removeAttr("jqimg");
            $(".jqzoom img").attr("src", yiSrc);
            $(".jqzoom img").attr("jqimg", yiSrc);
            $("#d").Spinner({ value: 1, min: 1, len: 4, max: 10000 });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="xiang_box">
        <div class="xiang_biao">
            <uc1:LeftNav ID="LeftNav1" runat="server" />
            <div class="location fl">
                <a href="Index.aspx">首页</a><asp:Literal ID="Literal9" runat="server"></asp:Literal>
            </div>
        </div>
        <div class="xiang_cont_box">
            <div class="xiang_left_box">
                <div class="jqzoom" id="spec-n1">
                    <img src="images/banner.png" jqimg="images/banner.png" />
                </div>
                <div id="spec-n5">
                    <div class="control" id="spec-left">
                        <img src="images/left.gif" />
                    </div>
                    <div id="spec-list">
                        <ul class="list-h">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <img src="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>" />
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div class="control" id="spec-right">
                        <img src="images/right.gif" />
                    </div>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $(".jqzoom").jqueryzoom({
                            xzoom: 400,
                            yzoom: 400,
                            offset: 10,
                            position: "right",
                            preload: 1,
                            lens: 1
                        });
                        $("#spec-list").jdMarquee({
                            deriction: "left",
                            width: 448,
                            height: 56,
                            step: 2,
                            speed: 4,
                            delay: 10,
                            control: true,
                            _front: "#spec-right",
                            _back: "#spec-left"
                        });
                        $("#spec-list img").bind("mouseover", function () {
                            var src = $(this).attr("src");
                            $("#spec-n1 img").eq(0).attr({
                                src: src.replace("\/n5\/", "\/n1\/"),
                                jqimg: src.replace("\/n5\/", "\/n0\/")
                            });
                            $(this).css({
                                "border": "2px solid #ff6600",
                                "padding": "1px"
                            });
                        }).bind("mouseout", function () {
                            $(this).css({
                                "border": "1px solid #ccc",
                                "padding": "2px"
                            });
                        });
                    })
                </script>
                <script src="Scripts/lib.js" type="text/javascript"></script>
                <script src="Scripts/163css.js" type="text/javascript"></script>
            </div>
            <div class="xiang_right_box">
                <div class="xiang_right_biao">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </div>
                <div class="xiang_dl">
                    <dl class="xiang_jiage">
                        <dt>售价 : </dt>
                        <dd class="dd1">
                            <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                        </dd>
                        <dd>
                            &nbsp;<span>元</span>
                        </dd>
                    </dl>
                    <dl class="xiang_dl1">
                        <dt>商品编号 : </dt>
                        <dd>
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal></dd>
                    </dl>
                    <dl class="xiang_dl1">
                        <dt>商品规格 : </dt>
                        <dd>
                            <asp:Literal ID="Literal3" runat="server"></asp:Literal></dd>
                    </dl>
                    <div class="xiang_shu">
                        <span>数量 : </span>
                        <div id="d" class="Spinner">
                        </div>
                    </div>
                </div>
                <div class="xiang_goumai">
                    <input type="button" class="btn_gwc" pid="<%=prid %>" value="加入购物车" />
                </div>
            </div>
        </div>
        <div class="bottom_box">
            <div class="zuijianliulan">
                <div class="liulan_biaoti">
                    相关产品</div>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div class="pro">
                            <a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                                <img src="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                                    alt="<%#Eval("Title") %>" title="<%#Eval("Title") %>" /></a>
                            <p>
                                <a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                                    <%#Eval("Title").ToString()%></a></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="xiangqingye">
                <div class="xiangqing_biaoti">
                    <ul>
                        <li><a href="">产品介绍</a></li>
                    </ul>
                </div>
                <div class="jieshao">
                    <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="clearfix">
            </div>
        </div>
    </div>
</asp:Content>
