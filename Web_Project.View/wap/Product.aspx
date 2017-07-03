<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Web_Project.View.wap.Product" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div class="bodycenter">
        <div class="header">
            <div class="header-background">
            </div>
            <div class="toolbar statusbar-padding">
                <button class="bar-button back-button" onclick="history.go(-1);">
                    <i class="icon icon-back"></i>
                </button>
                <div class="header-title">
                    <div class="title">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
                </div>
            </div>
        </div>
        <div style="height: 60px">
        </div>
        <div class="indexpro">
            <asp:Repeater ID="Repeater1" runat="server">
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
            <a class="tab-button" href="Index.aspx"><i class="tab-button-icon icon icon-home"></i>
                <span class="tab-button-txt">首页</span></a> <a class="tab-button active" href="ProType.aspx">
                    <i class="tab-button-icon icon icon-service"></i><span class="tab-button-txt">分类</span></a>
            <a class="tab-button cached" href="ShopCart.aspx"><i class="tab-button-icon icon icon-car">
            </i><span class="tab-button-txt">购物车</span></a> <a class="tab-button cached" href="Member.aspx">
                <i class="tab-button-icon icon icon-my"></i><span class="tab-button-txt">我的</span></a>
        </div>
    </div>
    </form>
</body>
</html>
