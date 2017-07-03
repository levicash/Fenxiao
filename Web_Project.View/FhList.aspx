<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="FhList.aspx.cs" Inherits="Web_Project.View.FhList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
    <script>
        $(document).ready(function () {
            $(".left_box p a").removeClass("mea");
            $(".left_box p a.ayeb").addClass("mea");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m_right">
        <div class="mright_1">
            <span>订单详情</span>
        </div>
        <div class="myorder">
            <div class="myorder_3">
                订单号码：<span><asp:Literal ID="Literal1" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;发货状态：<span><asp:Literal
                    ID="Literal2" runat="server"></asp:Literal></span><br />
                快递单号：<span><asp:Literal ID="Literal3" runat="server"></asp:Literal></span><br />
                快递公司：<span><asp:Literal ID="Literal4" runat="server"></asp:Literal></span>
            </div>
            <div class="tab_list tab_order">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <th height="35px">
                            商品信息
                        </th>
                        <th width="12%">
                            单价
                        </th>
                        <th width="12%">
                            数量
                        </th>
                        <th width="13%">
                            金额
                        </th>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="td1">
                                    <img src="<%#Eval("bimgname").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("bimgname").ToString()) %>"
                                        alt="<%#Eval("btitle") %>" title="<%#Eval("btitle") %>" />
                                    <%#Eval("btitle") %>
                                </td>
                                <td>
                                    <%#Eval("DanJia")%>
                                </td>
                                <td>
                                    <%#Eval("Num")%>
                                </td>
                                <td>
                                    <%#Eval("Zprice")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <div class="clear">
                </div>
                <div class="myorder_4">
                    <asp:Button ID="Button2" runat="server" Text="返回" OnClick="Button2_Click" CssClass="btn_res" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
