<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="Member.aspx.cs" Inherits="Web_Project.View.Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="right_box">
        <div class="right_top">
            <div class="mkuang_1">
                <div class="kuang_top">
                    <img src="images/touxing.png">
                    <div class="kuang_right">
                        <p>
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal></p>
                        <p>
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal></p>
                        <p>
                            <a href="" style="color: #09c;">了解代理级别>></a></p>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <p class="mkuang_2" style="margin: 7px 0 0;">
                    <a href="UserMod.aspx" style="color: #09c;">修改密码 </a>&nbsp; | &nbsp;<a href="UserMod.aspx"
                        style="color: #09c;"> 修改基本资料</a></p>
            </div>
            <div class="mkuang">
                <h1 style="margin-top: 20px; font-weight: bold;">
                    账户余额</h1>
                <h1 style="margin-top: 40px;">
                    ￥<span style="color: red; font-size: 18px;">
                        <asp:Literal ID="Literal5" runat="server"></asp:Literal></span></h1>
            </div>
            <div class="mkuang">
                <h1 style="margin-top: 20px; font-weight: bold;">
                    提现比例</h1>
                <h1 style="margin-top: 40px;">
                    <span style="color: red; font-size: 18px;">
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal></span>&nbsp;%</h1>
            </div>
            <div class="mkuang" style="border: none">
                <h1 style="margin-top: 20px; font-weight: bold;">
                    奖金账户</h1>
                <h1 style="margin-top: 40px;">
                    ￥<span style="color: red; font-size: 18px;"><asp:Literal ID="Literal4" runat="server"></asp:Literal></span></h1>
            </div>
            <div class="clearfix">
            </div>
        </div>
        <div class="right_bottom">
            <div class="right_bottom_1">
                <div class="right_bottom_2">
                    <a href="MyOrder.aspx">我的订单</a>
                </div>
                <div class="right_bottom_3">
                    总订单：<span><asp:Literal ID="Literal6" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;未发货：<span><asp:Literal
                        ID="Literal7" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;已发货：<span><asp:Literal
                            ID="Literal8" runat="server"></asp:Literal></span>
                </div>
                <div class="right_bottom_2">
                    <a href="javascript:void(0)">推荐二维码</a>
                </div>
                <div class="right_bottom_4">
                    <asp:Image ID="Image1" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
