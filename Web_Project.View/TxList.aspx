<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="TxList.aspx.cs" Inherits="Web_Project.View.TxList" %>

<%@ Register Src="~/Contrl/Pager.ascx" TagName="Pager" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
    <script>
        $(document).ready(function () {
            $(".left_box p a").removeClass("mea");
            $(".left_box p a.atixian").addClass("mea");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m_right">
        <div class="mright_1">
            <span>奖金提现列表</span>
            <div class="mright_2 fr">
                <a href="TiXian.aspx">申请提现</a>
            </div>
        </div>
        <div class="mright_3">
            您总共提现：<span><asp:Literal ID="Literal1" runat="server"></asp:Literal></span>&nbsp;元；已审核：<span><asp:Literal
                ID="Literal2" runat="server"></asp:Literal></span>&nbsp;元；未审核：<span><asp:Literal
                    ID="Literal3" runat="server"></asp:Literal></span>&nbsp;元
        </div>
        <div class="tab_list">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <th height="35px">
                        提现金额
                    </th>
                    <th width="11%">
                        提现比例
                    </th>
                    <th width="15%">
                        到账金额
                    </th>
                    <th width="12%">
                        审核状态
                    </th>
                    <th width="23%">
                        审核时间
                    </th>
                    <th width="23%">
                        提现时间
                    </th>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("JinEr")%>
                            </td>
                            <td>
                                <%#Eval("LiLv")%>
                            </td>
                            <td>
                                <%#Eval("HouMoney")%>
                            </td>
                            <td>
                                <%#Eval("ShenHe").ToString() == "2" ? "未审核" :"<span style='color:red'>已审核</span>"%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "ShTime", "{0:yyyy-MM-dd HH:mm:dd}")%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd HH:mm:dd}")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <div class="clear">
            </div>
            <div class="page">
                <uc3:Pager ID="Pager1" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
