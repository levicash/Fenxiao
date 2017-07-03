<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="NewsInfo.aspx.cs" Inherits="Web_Project.View.NewsInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/nei.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sg_box">
        <div class="sgbox_1">
            <div class="cont_left_box">
                <dl>
                    <dt>新闻资讯</dt>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <dd>
                                <a class="li<%#Eval("Id") %>" href="News_<%#Eval("Id") %>.aspx">
                                    <%#Eval("Title") %></a>
                            </dd>
                        </ItemTemplate>
                    </asp:Repeater>
                </dl>
            </div>
            <div class="sgbox_2">
                <div class="sgbox_3">
                    <span>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal></span>
                </div>
                <div class="sgbox_4">
                    <div class="nn_tit">
                        <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                    </div>
                    <div class="nn_info">
                        发布时间：<asp:Literal ID="Literal5" runat="server"></asp:Literal>&nbsp;&nbsp;来源：<asp:Literal
                            ID="Literal6" runat="server"></asp:Literal>
                    </div>
                    <div class="nn_con maximg">
                        <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                    </div>
                    <div class="prev_next">
                        <p>
                            <b>上一篇</b>:
                            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <b>下一篇</b>:
                            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
