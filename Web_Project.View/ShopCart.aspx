<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ShopCart.aspx.cs" Inherits="Web_Project.View.ShopCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/nei.css" rel="stylesheet" type="text/css" />
    <%--loading加载中  样式--%>
    <link href="showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%--弹出框  样式--%>
    <link href="Styles/sweetalert.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/sweetalert.min.js" type="text/javascript"></script>
    <script src="Scripts/shopcart.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="xiang_box">
        <div class="scart">
            <div class="scart_1">
                <span>购物车</span>
            </div>
            <div class="scart_2">
                <table cellpadding="0" cellspacing="0" width="100%" border="0" class="tablelist">
                    <tr>
                        <th width="6%">
                            <input type='checkbox' name='checkbox' value="全选" />&nbsp;&nbsp;全选
                        </th>
                        <th>
                            商品信息
                        </th>
                        <th width="10%">
                            单价(元)
                        </th>
                        <th width="12%">
                            数量
                        </th>
                        <th width="10%">
                            金额(元)
                        </th>
                        <th width="10%">
                            操作
                        </th>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr class="tr<%#Eval("Id") %>">
                                <td>
                                    <input type='checkbox' name='checkbox1' value="" id="<%#Eval("Id") %>" />
                                </td>
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
                                    <img src="images/jianhao.png" class="jianhao fl" jhid="<%#Eval("Id") %>" />
                                    <input type="text" class="shuliang fl" id="sl<%#Eval("Id") %>" jhid="<%#Eval("Id") %>"
                                        num="<%#Eval("Num")%>" value="<%#Eval("Num")%>" />
                                    <img src="images/jiahao.png" class="jiahao fl" jhid="<%#Eval("Id") %>" />
                                </td>
                                <td class="td4">
                                    ￥<span><%#  Convert.ToDecimal(ProXinPinPrice(Eval("Pid").ToString())) * Convert.ToInt32(Eval("Num"))%></span>
                                </td>
                                <td class="td3">
                                    <a href="javascript:void(0)" class="SingleDel" jhid="<%#Eval("Id") %>">删&nbsp;除</a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div class="scart_3">
                <div class="fl">
                    <input type='checkbox' name='checkbox' value="全选" />&nbsp;&nbsp;全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                        href="javascript:void(0)" id="BtnDeleteAll">删除选中项</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                            href="javascript:void(0)" id="btnQingkong">清空购物车</a>
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
    <script type="text/javascript">
        $('.scart_2 table tr:odd').addClass('odd');
    </script>
</asp:Content>
