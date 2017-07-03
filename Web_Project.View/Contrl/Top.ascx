<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Top.ascx.cs" Inherits="Web_Project.View.Contrl.Top" %>
<div class="top">
    <div class="juzhong">
        <dl>
            <dt>欢迎进入优妆国际商城... </dt>
            <dt><a href="Login.aspx" class="btn_log se">请登录</a></dt>
            <dd>
                <a href="javascript:void(0)">用户中心</a></dd>
            <dd>
                <a href="javascript:void(0)">我的订单</a></dd>
        </dl>
    </div>
    <div class="juzhong">
        <dl>
            <dt>欢迎进入优妆国际商城... </dt>
            <dt class="dt1 se"></dt>
            <dt><a href='javascript:void(0)' id='aquit'>退出</a></dt>
            <dd>
                <a href="Member.aspx">用户中心</a></dd>
            <dd>
                <a href="MyOrder.aspx">我的订单</a></dd>
        </dl>
    </div>
</div>
<div class="logo_box">
    <img class="logo" src="images/logo.png">
    <div class="gouwu">
        <ul>
            <li><a href="javascript:void(0)" id="myCart">我的购物车</a></li>
            <li><a href="" class="se">（<asp:Literal ID="Literal1" runat="server"></asp:Literal>）</a></li>
        </ul>
    </div>
    <div class="sousuo">
        <div class="surch">
            <input type="text" placeholder="">
            <a href=""></a>
        </div>
    </div>
    <ul class="nav">
        <li><a href="Index.aspx" class="se">首页</a></li>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <li><a href="Product_<%#Eval("Id") %>.aspx">
                    <%#Eval("Title") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
