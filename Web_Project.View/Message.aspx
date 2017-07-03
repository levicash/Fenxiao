<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Message.aspx.cs" Inherits="Web_Project.View.Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $("#navul > li").removeClass("current");
            $("#navul > li").eq(7).addClass("current");
        });
    </script>
    <%--  loading加载中  样式--%>
    <link href="showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <script src="Scripts/message.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="nav_left">
            <div class="nav_left_top_tit">
                联系我们
            </div>
            <div class="nav_left_top_con">
                <div class="list">
                    <a href="Message.aspx">客户留言</a> <a href="Contact.aspx">联系我们</a>
                </div>
            </div>
            <div class="lxwm">
                <div class="lxwm_cen">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <div class="nav_right">
            <div class="nav_right_top">
                <div class="nav_right_top_left">
                    客户留言
                </div>
                <div class="nav_right_top_right">
                    您当前的位置：<a href="Index.aspx">首页</a> >> <a href="Message.aspx">客户留言</a>
                </div>
            </div>
            <div class="nav_right_cen">
                <div class="mes_tab">
                    <a href="Message.aspx" class="tcur">客户留言</a> <a href="Mlist.aspx">留言列表</a>
                </div>
                <table border="0" cellpadding="0" cellspacing="0" style="margin-top: 20px;" width="100%">
                    <tr>
                        <td style="width: 20%; text-align: right; height: 50px;">
                            你的问题：<span style="color: Red; font-weight: bold;">*</span>
                        </td>
                        <td colspan="2">
                            <input type="text" class="mes_tit" id="mes_tit" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; height: 170px;">
                            留言内容：<span style="color: Red; font-weight: bold;">*</span>
                        </td>
                        <td colspan="2">
                            <textarea class="mes_textarea" id="mes_textarea"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; height: 50px;">
                            你的姓名：<span style="color: Red; font-weight: bold;">*</span>
                        </td>
                        <td colspan="2">
                            <input type="text" class="mes_tit" id="mes_name" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; height: 50px;">
                            联系电话：<span style="color: Red; font-weight: bold;">*</span>
                        </td>
                        <td colspan="2">
                            <input type="text" class="mes_tit" id="mes_tel" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; text-align: right; height: 50px;">
                            验证码：<span style="color: Red; font-weight: bold;">*</span>
                        </td>
                        <td style="width: 100px;">
                            <input type="text" class="mes_code" id="mes_code" />
                        </td>
                        <td>
                            <img src="admin_/Code.ashx" id="CheckCodeImg" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; height: 50px;">
                            &nbsp;
                        </td>
                        <td colspan="2">
                            <input type="button" class="mes_tijiao" id="mes_tijiao" value="提   交" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
