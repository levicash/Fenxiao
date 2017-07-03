<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="LastOrder.aspx.cs" Inherits="Web_Project.View.LastOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/nei.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="xiang_box">
        <div class="jiesuan">
            <div class="jiesuan_1">
                <div class="jiesuan_2">
                    您已成功付款&nbsp;<span><asp:Literal ID="Literal2" runat="server"></asp:Literal></span>&nbsp;元
                </div>
                <div class="jiesuan_3">
                    订单编号：<span><asp:Literal ID="Literal1" runat="server"></asp:Literal></span>
                </div>
                <div class="jiesuan_4">
                    <a href="MyOrder.aspx"></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
