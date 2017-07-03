<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TiXian.aspx.cs" Inherits="Web_Project.View.wap.TiXian" %>

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
    <script src="../layer/mobile/layer.js" type="text/javascript"></script>
    <script src="js/tixian.js" type="text/javascript"></script>
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
                        我要提现</div>
                </div>
            </div>
        </div>
        <div style="height: 60px">
        </div>
        <div class="tixian_3">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td style="width: 35%; text-align: right;">
                        会员名：
                    </td>
                    <td style="width: 50%; padding-left: 15px;">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        提现奖金：
                    </td>
                    <td style="padding-left: 15px;">
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal>&nbsp;元
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        提现比例：
                    </td>
                    <td style="padding-left: 15px; color: #ff0000;">
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal>&nbsp;%
                        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        提现金额：
                    </td>
                    <td>
                        <input type="text" id="txt_txjr" class="input_yh" value="0" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        最终取现：
                    </td>
                    <td style="padding-left: 15px;">
                        <asp:Label ID="Label1" runat="server" Text="0" ClientIDMode="Static"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left: 100px;">
                        <a href="javascript:void(0)" class="a2" id="btn_tixian">提交</a> <a href="javascript:void(0)"
                            class="a1" id="btn_back">返回</a>
                    </td>
                </tr>
            </table>
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
