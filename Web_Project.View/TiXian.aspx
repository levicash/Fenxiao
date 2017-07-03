<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="TiXian.aspx.cs" Inherits="Web_Project.View.TiXian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
    <%--loading加载中  样式--%>
    <link href="showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%--提现--%>
    <script src="Scripts/tixian.js" type="text/javascript"></script>
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
            <span>申请提现</span>
        </div>
        <div class="reg">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td style="width: 25%; text-align: right;">
                        会员名：
                    </td>
                    <td style="width: 50%; padding-left: 15px;">
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        提现奖金：
                    </td>
                    <td style="padding-left: 15px;">
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal>&nbsp;元
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        提现比例：
                    </td>
                    <td style="padding-left: 15px; color: #ff0000;">
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal>&nbsp;%
                        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        提现金额：
                    </td>
                    <td>
                        <input class="txjr" id="txt_txjr" type="text" value="0" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        最终取现：
                    </td>
                    <td style="padding-left: 15px;">
                        <asp:Label ID="Label1" runat="server" Text="0" ClientIDMode="Static"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding-left: 100px;">
                        <input class="btn_reg" id="btn_tixian" type="button" value="确&nbsp;定&nbsp;提&nbsp;现" />
                        <input class="btn_back" id="btn_back" type="button" value="返回列表" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
