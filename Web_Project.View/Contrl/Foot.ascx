<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Foot.ascx.cs" Inherits="Web_Project.View.Contrl.Foot" %>
<%@ Import Namespace="Web_Project.Core" %>
<div class="footer_top">
    <img src="images/xiabu.png" class="footer_top_center">
</div>
<div class="footer_box">
    <div class="footer_center">
        <div class="footer_list_box">
            <% foreach (SingleTypeCore typeCore in SingleTypeMethod())
               {
            %>
            <dl>
                <dt>
                    <%=typeCore.Title %></dt>
                <% foreach (SingleInfoCore infoCore in SingleInfoMethod(typeCore.Id))
                   {
                %>
                <dd>
                    <a href="Single_<%=infoCore.Id %>.aspx">&gt;
                        <%=infoCore.Title%></a></dd>
                <%} %>
            </dl>
            <%} %>
        </div>
        <div class="footer_nav_box">
            <div class="footer_nav1">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <a title="<%#Eval("Title") %>" href="<%#Eval("Address") %>" target="_blank">
                            <%#Eval("Title") %></a>|
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <ul class="honor_box">
                <li class="honor_list">
                    <img src="images/xia1.png"></li>
                <li class="honor_list">
                    <img src="images/xia2.png"></li>
                <li class="honor_list">
                    <img src="images/xia3.png"></li>
                <li class="honor_list">
                    <img src="images/xia4.png"></li>
                <li class="honor_list">
                    <img src="images/xia5.png"></li>
            </ul>
        </div>
    </div>
</div>
