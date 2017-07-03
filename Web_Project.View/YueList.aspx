<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="YueList.aspx.cs" Inherits="Web_Project.View.YueList" %>

<%@ Register Src="~/Contrl/Pager.ascx" TagName="Pager" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/lhgcore.min.js" type="text/javascript"></script>
    <script src="Scripts/lhgcalendar.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $(".left_box p a").removeClass("mea");
            $(".left_box p a.achongzhi").addClass("mea");
            J('#TextBox2').calendar({ maxDate: '#TextBox3' });
            J('#TextBox3').calendar({ minDate: '#TextBox2' });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m_right">
        <div class="mright_1">
            <span>充值记录</span>
            <div class="mright_2 fr">
                <a href="YueAdd.aspx">申请充值</a>
            </div>
        </div>
        <div class="myorder">
            <div class="myorder_1">
                充值时间：<asp:TextBox ID="TextBox2" CssClass="txt_order" ClientIDMode="Static" runat="server"></asp:TextBox>&nbsp;&nbsp;<asp:TextBox
                    ID="TextBox3" CssClass="txt_order" ClientIDMode="Static" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CssClass="btn_order" OnClick="BtnSearch_Click"
                    Text="查&nbsp;询" />
            </div>
            <div class="tab_list">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>
                                充值金额
                            </th>
                            <th style="width: 15%">
                                状态
                            </th>
                            <th style="width: 20%">
                                审核时间
                            </th>
                            <th style="width: 20%">
                                充值时间
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("Money")%>
                                    </td>
                                    <td>
                                        <%#Eval("ShenHe").ToString() == "1" ? "<span style='color:red' >未审核</span>" : "已审核"%>
                                    </td>
                                    <td>
                                        <%#DataBinder.Eval(Container.DataItem, "ShTime", "{0:yyyy-MM-dd}")%>
                                    </td>
                                    <td>
                                        <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd}")%>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="page">
            <uc3:Pager ID="Pager1" runat="server" />
        </div>
    </div>
</asp:Content>
