﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="UserMod.aspx.cs" Inherits="Web_Project.View.UserMod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
    <%--loading加载中  样式--%>
    <link href="showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%-- 省市区三级联动--%>
    <script type="text/javascript" src="liandong/location.js"></script>
    <script type="text/javascript" src="liandong/select2.js"></script>
    <script type="text/javascript" src="liandong/select2_locale_zh-CN.js"></script>
    <link href="Styles/select2.css" rel="stylesheet" type="text/css" />
    <%--修改个人资料--%>
    <script src="Scripts/usermod.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $(".left_box p a").removeClass("mea");
            $(".left_box p a.aziliao").addClass("mea");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m_right">
        <div class="mright_1">
            <span>个人资料</span>
        </div>
        <div class="reg">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td class="td1">
                        会员名：
                    </td>
                    <td style="width: 50%;">
                        <input class="shuru" id="reg_uname" type="text" value="<%=rname %>" disabled="disabled" />
                    </td>
                    <td>
                        <span class="sp1"></span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        密&nbsp;码：
                    </td>
                    <td>
                        <input class="mima" id="reg_pass" type="password" placeholder="请输入密码" />
                    </td>
                    <td>
                        <span style="color: Red;">*不修改请保持为空</span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        确认密码：
                    </td>
                    <td>
                        <input class="mima" id="reg_conpass" type="password" placeholder="请再次确认密码" />
                    </td>
                    <td>
                        <span style="color: Red;">*不修改请保持为空</span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        推荐人：
                    </td>
                    <td>
                        <input class="shuru" id="reg_tuijian" value="<%=tuijianren %>" disabled="disabled"
                            type="text" />
                    </td>
                    <td>
                        <span style="color: Red;">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        姓名：
                    </td>
                    <td>
                        <input class="shuru" id="reg_name" value="<%=uname %>" type="text" placeholder="请输入您的真实姓名" />
                    </td>
                    <td>
                        <span style="color: Red;">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        身份证号：
                    </td>
                    <td>
                        <input class="shuru" id="reg_shenfenzheng" type="text" value="<%=card %>" disabled="disabled" />
                    </td>
                    <td>
                        <span style="color: Red;">*</span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        所属区域：
                    </td>
                    <td colspan="2" style="padding-left: 15px;" id="city_china">
                        <select id="loc_province" style="width: 120px;">
                        </select>
                        <select id="loc_city" style="width: 120px; margin-left: 10px">
                        </select>
                        <select id="loc_town" style="width: 120px; margin-left: 10px">
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        收货地址：
                    </td>
                    <td colspan="2">
                        <input class="shuru" id="reg_address" type="text" value="<%=address %>" placeholder="请输入收货地址" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        银行卡卡号：
                    </td>
                    <td colspan="2">
                        <input class="shuru" id="reg_kahao" type="text" value="<%=kahao %>" placeholder="请输入银行卡卡号" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        开户行名称：
                    </td>
                    <td colspan="2">
                        <input class="shuru" id="reg_kaihuhang" type="text" value="<%=kaihuhang %>" placeholder="请输入银行卡开户行名称" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        开户人名称：
                    </td>
                    <td colspan="2">
                        <input class="shuru" id="reg_kaihuren" type="text" value="<%=kaihuren %>" placeholder="请输入银行卡开户人名称" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        &nbsp;
                    </td>
                    <td colspan="2">
                        <input class="btn_reg" id="btn_reg" type="button" value="提  交" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
