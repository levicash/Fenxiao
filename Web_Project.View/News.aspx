<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="Web_Project.View.News" %>

<%@ Register Src="~/Contrl/Pager.ascx" TagName="Pager" TagPrefix="uc3" %>
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
                <div class="sgbox_4 new_list">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <dl>
                                <dt><a href="NewsInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                                    <%#Eval("Title") %>
                                </a></dt>
                                <dd class="arc_into">
                                    发布时间：<%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd}")%>&nbsp;&nbsp;
                                    来源：<%#Eval("Laiyuan") %></dd>
                                <dd class="arc_desp">
                                    <a href="NewsInfo_<%#Eval("Id") %>_<%#Eval("Type") %>.aspx">
                                        <img title="<%#Eval("Title") %>" alt="<%#Eval("Title") %>" src="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>" />
                                    </a>
                                    <%# Html(Eval("Desp").ToString()).Length > 500 ? Html(Eval("Desp").ToString()).Substring(0, 500) + "..." : Html(Eval("Desp").ToString())%>
                                </dd>
                            </dl>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="clear">
                    </div>
                    <div class="page">
                        <uc3:Pager ID="Pager1" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
