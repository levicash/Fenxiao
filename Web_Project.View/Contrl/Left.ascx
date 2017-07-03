<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Left.ascx.cs" Inherits="Web_Project.View.Contrl.Left" %>
<div class="nav_left">
    <div class="nav_left_top_tit">
        回收产品
    </div>
    <div class="nav_left_top_con">
        <div class="list">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <a href="Product_<%#Eval("Id") %>.aspx">
                        <%#Eval("Title") %></a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="lxwm">
        <div class="lxwm_cen">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>
    </div>
</div>
