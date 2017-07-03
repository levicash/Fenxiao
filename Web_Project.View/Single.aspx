<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Single.aspx.cs" Inherits="Web_Project.View.Single" %>

<%@ Import Namespace="Web_Project.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/nei.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sg_box">
        <div class="sgbox_1">
            <div class="cont_left_box">
                <dl>
                    <% foreach (SingleTypeCore typeCore in SingleTypeMethod())
                       {
                    %>
                    <dt>
                        <%=typeCore.Title %></dt>
                    <% foreach (SingleInfoCore infoCore in SingleInfoMethod(typeCore.Id))
                       {
                    %>
                    <dd>
                        <a href="Single_<%=infoCore.Id %>.aspx">&gt;
                            <%=infoCore.Title%></a></dd>
                    <%} %>
                    <%} %>
                </dl>
            </div>
            <div class="sgbox_2">
                <div class="sgbox_3">
                    <span>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal></span>
                </div>
                <div class="sgbox_4">
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
