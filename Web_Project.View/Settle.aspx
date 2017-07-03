<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Settle.aspx.cs" Inherits="Web_Project.View.Settle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/nei.css" rel="stylesheet" type="text/css" />
    <%--弹出框  样式--%>
    <link href="Styles/sweetalert.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/sweetalert.min.js" type="text/javascript"></script>
    <script src="Scripts/jiesuan.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="xiang_box">
        <div class="scart">
            <div class="scart_1">
                <span>商品确认</span>
            </div>
            <div class="scart_2">
                <table cellpadding="0" cellspacing="0" width="100%" border="0" class="tablelist">
                    <tr>
                        <th>
                            商品信息
                        </th>
                        <th width="15%">
                            单价(元)
                        </th>
                        <th width="15%">
                            数量
                        </th>
                        <th width="15%">
                            金额(元)
                        </th>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr class="tr" pid="<%#Eval("Pid") %>" price="<%#ProXinPinPrice(Eval("Pid").ToString())%>">
                                <td class="td1">
                                    <a href="ProductInfo_<%#Eval("Pid") %>_<%#Eval("btype") %>.aspx">
                                        <img src="<%#Eval("ImgName").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("ImgName").ToString()) %>"
                                            alt="<%#Eval("Title") %>" title="<%#Eval("Title") %>" /></a> <a href="ProductInfo_<%#Eval("Pid") %>_<%#Eval("btype") %>.aspx">
                                                <%#Eval("Title")%></a>
                                </td>
                                <td>
                                    <div class="tddiv_2">
                                        ￥<span><%#ProXinPinPrice(Eval("Pid").ToString())%></span>
                                    </div>
                                </td>
                                <td class="td2">
                                    <%#Eval("Num")%>
                                </td>
                                <td class="td4">
                                    ￥<span><%#  Convert.ToDecimal(ProXinPinPrice(Eval("Pid").ToString())) * Convert.ToInt32(Eval("Num"))%></span>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div class="scart_3">
                <div class="scart_5 fl">
                    &nbsp;&nbsp;<a href="ShopCart.aspx">&lt;&lt;返回购物车</a>
                </div>
                <div class="scart_4 fr">
                </div>
                <div class="fr">
                    一共&nbsp;<span style="color: red; font-size: 16px; font-weight: bold;"><asp:Label
                        ID="Label2" runat="server" ClientIDMode="Static" Text=""></asp:Label></span>&nbsp;件，商品总价：<span
                            style="color: red; font-size: 16px; font-weight: bold;"><asp:Label ID="Label1" runat="server"
                                ClientIDMode="Static" Text=""></asp:Label></span>&nbsp;元
                </div>
            </div>
        </div>
    </div>
    <form id="formid" method='post' action='LastOrder.aspx'>
    <input id="Hidden1" name="Hidden1" type="hidden" />
    <input id="Hidden2" name="Hidden2" type="hidden" />
    </form>
    <script type="text/javascript">
        $('.scart_2 table tr:odd').addClass('odd');
    </script>
</asp:Content>
