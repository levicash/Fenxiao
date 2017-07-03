<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TxList.aspx.cs" Inherits="Web_Project.View.wap.TxList" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div class="bodycenter">
        <div class="header">
            <div class="header-background">
            </div>
            <div class="toolbar statusbar-padding">
                <button class="bar-button back-button" onclick="history.go(-1);" dwz-event-on-click="click">
                    <i class="icon icon-back"></i>
                </button>
                <div class="header-title">
                    <div class="title">
                        提现记录</div>
                </div>
                <div class="txt_icon" style="">
                    <a href="TiXian.aspx">提现</a>
                </div>
            </div>
        </div>
        <div style="height: 60px">
        </div>
        <div class="tixian">
            <div class="tixian_1">
                <dl>
                    <dt>提现总额</dt>
                    <dd>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>&nbsp;元
                    </dd>
                </dl>
                <dl>
                    <dt>已审核</dt>
                    <dd>
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal>&nbsp;元
                    </dd>
                </dl>
                <dl class="fr">
                    <dt>未审核</dt>
                    <dd>
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal>&nbsp;元
                    </dd>
                </dl>
            </div>
            <div class="tixian_2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%;">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 25%; text-align: right;">
                                    <%#DataBinder.Eval(Container.DataItem,"AddTime","{0:yyyy-MM-dd}") %>
                                </td>
                                <td class="td2">
                                    <span>金额：</span><%#Eval("JinEr")%><br />
                                    <span>比例：</span><%#Eval("LiLv")%>
                                </td>
                                <td style="width: 20%;">
                                    <%#Eval("ShenHe").ToString()=="1"?"<span>已审核</span>":"未审核"%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
        <div style="height: 110px">
        </div>
        <div class="tab-bar tab-bottom">
            <a class="tab-button" href="Index.aspx"><i class="tab-button-icon icon icon-home"></i>
                <span class="tab-button-txt">首页</span></a> <a class="tab-button" href="ProType.aspx">
                    <i class="tab-button-icon icon icon-service"></i><span class="tab-button-txt">分类</span></a>
            <a class="tab-button cached" href="ShopCart.aspx"><i class="tab-button-icon icon icon-car">
            </i><span class="tab-button-txt">购物车</span></a> <a class="tab-button active" href="Member.aspx">
                <i class="tab-button-icon icon icon-my"></i><span class="tab-button-txt">我的</span></a>
        </div>
    </div>
    </form>
</body>
</html>
