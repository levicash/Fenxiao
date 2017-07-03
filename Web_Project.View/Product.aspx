<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Product.aspx.cs" Inherits="Web_Project.View.Product" %>

<%@ Register Src="~/Contrl/LeftNav.ascx" TagName="LeftNav" TagPrefix="uc1" %>
<%@ Register Src="~/Contrl/Pager.ascx" TagName="Pager" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/nei.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="xiang_box">
        <div class="xiang_biao">
            <uc1:LeftNav ID="LeftNav1" runat="server" />
            <div class="location fl">
                <a href="Index.aspx">首页</a><asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
    <div class="top_box">
        <div class="tuijian_box">
            <img class="tuijian" src="images/remai.png">
        </div>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="top_pro_box">
                    <a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                        <img src="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                            alt="<%#Eval("Title") %>" title="<%#Eval("Title") %>" /></a>
                    <div class="top_word">
                        <dl>
                            <dd class="dd1">
                                <a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                                    <%#Eval("Title") %></a></dd>
                            <dd class="dd2">
                                售价：<span class="se"><%#Eval("XPrice").ToString()%></span>&nbsp;元</dd>
                            <dt><a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">查看详情</a></dt>
                        </dl>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="cont_box">
        <div class="prolist">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="xinpin_tu">
                        <a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                            <img src="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                                alt="<%#Eval("Title") %>" title="<%#Eval("Title") %>" /></a>
                        <p>
                            <a href="ProductInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                                <%#Eval("Title") %></a></p>
                        <ul>
                            <li style="color: red">￥ <span style="font-size: 16px; color: red; line-height: 25px">
                                <%#Eval("XPrice").ToString()%></span></li>
                        </ul>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="page">
            <uc3:Pager ID="Pager1" runat="server" />
        </div>
    </div>
</asp:Content>
