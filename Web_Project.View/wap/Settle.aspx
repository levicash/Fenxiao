<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settle.aspx.cs" Inherits="Web_Project.View.wap.Settle" %>

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
    <script src="js/jiesuan.js" type="text/javascript"></script>
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
                            确认订单</div>
                    </div>
                </div>
            </div>
            <div style="height: 70px">
            </div>
            <div class="aui-wei-cell">
                <ul>
                    <li><a href="javascript:void(0)">
                        <div class="" style="padding-left: 15px">
                            <i class="aui-cell-i"></i>
                        </div>
                        <div>
                            <div class="aui-add-cell">
                                <span class="aui-add-fix">
                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></span><span><asp:Literal
                                        ID="Literal2" runat="server"></asp:Literal></span></div>
                            <div class=" aui-add-title" style="padding-bottom: 10px">
                                <asp:Literal ID="Literal3" runat="server"></asp:Literal></div>
                        </div>
                    </a></li>
                </ul>
                <div class="aui-s-border" style="margin-bottom: 10px">
                </div>
            </div>
            <div class="main_con" style="margin: 0;">
                <div class="main_con_goods">
                    <ul>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <li style="margin-bottom: 0;" pid="<%#Eval("Pid") %>" price="<%#ProXinPinPrice(Eval("Pid").ToString())%>">
                                    <div class="auicrl_1">
                                        <div class="aui-crl">
                                            <img src="<%#Eval("ImgName").ToString()==""?"../admin_/Images/no_pic.gif":("../admin_/Images/proImg/"+Eval("ImgName").ToString()) %>" />
                                        </div>
                                        <div class="aui-crl1">
                                            <h2>
                                                <%#Eval("Title")%></h2>
                                            <p class="money">
                                                <em class="aui-redd">￥<span><%#ProXinPinPrice(Eval("Pid").ToString())%></span></em>
                                                <em class="emnum" style="color: #999; font-size: 1.2rem">x<span><%#Eval("Num")%></span></em>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
            <div class="aui-list-cells">
                <a href="javascript:;" class="aui-list-cell">
                    <div class="aui-list-cell-cn">
                        配送方式</div>
                    <div class="aui-list-cell-fr">
                        包邮</div>
                </a>
            </div>
            <div class="devider b-line">
            </div>
            <div style="height: 33px">
            </div>
            <!--内容信息 end-->
            <!--结算信息 start-->
            <div class="settlement t-line">
                <div class="settlement_left">
                    <font class="zongji">总计：</font><font class="money">￥<span>0</span></font><br />
                    （共<span class="sp1">0</span>件，不含运费）
                </div>
                <div class="settlement_right">
                    <a href="javascript:void(0)" class="btn_jiesuan">提交订单</a>
                </div>
            </div>
            <!--结算信息 end-->
        </div>
    </div>
    </form>
</body>
</html>
