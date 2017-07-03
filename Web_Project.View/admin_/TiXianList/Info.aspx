<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="Web_Project.View.admin_.TiXianList.Info" %>

<%@ Register Src="~/Contrl/Pager.ascx" TagName="Pager" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <%--  loading加载中  样式--%>
    <link href="../showloading/showLoading.css" rel="stylesheet" type="text/css" />
    <script src="../showloading/jquery.showLoading.min.js" type="text/javascript"></script>
    <%--点击审核--%>
    <script src="../Scripts/tixian.js" type="text/javascript"></script>
    <%--调用带删除功能的JS--%>
    <script src="../Scripts/Operating.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Operating("ws_TiXianInfo");
        });
    </script>
    <title>会员提现列表</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <div class="tools">
            <div class="serdiv fl">
                <dl>
                    <dt>会员号：</dt>
                    <dd>
                        <asp:TextBox ID="txtTitle" CssClass="sdfinput" ClientIDMode="Static" runat="server"></asp:TextBox></dd>
                </dl>
                <div class="fl">
                    &nbsp;&nbsp;
                    <asp:Button ID="BtnSearch" runat="server" Text="查&nbsp;&nbsp;询" CssClass="btn" OnClick="BtnSearch_Click" />
                </div>
            </div>
        </div>
        <table class="tablelist">
            <thead>
                <tr>
                    <th width="3%">
                    </th>
                    <th width="4%">
                        编号
                    </th>
                    <th>
                        会员号
                    </th>
                    <th width="13%">
                        银行卡卡号
                    </th>
                    <th width="15%">
                        银行卡开户名称
                    </th>
                    <th width="7%">
                        银行卡开户人
                    </th>
                    <th width="6%">
                        提现金额
                    </th>
                    <th width="5%">
                        提现比例
                    </th>
                    <th width="6%">
                        到账金额
                    </th>
                    <th width="12%">
                        审核时间
                    </th>
                    <th width="5%">
                        审核状态
                    </th>
                    <th width="12%">
                        添加时间
                    </th>
                    <th width="4%">
                        操作
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <input type='checkbox' name='checkbox' id="<%#Eval("id") %>" />
                            </td>
                            <td>
                                <%#Eval("id") %>
                            </td>
                            <td>
                                <%# Eval("Uname")%>
                            </td>
                            <td>
                                <%# Eval("bkahao")%>
                            </td>
                            <td>
                                <%# Eval("bkaihuhang")%>
                            </td>
                            <td>
                                <%# Eval("bkaihuren")%>
                            </td>
                            <td>
                                <%# Eval("JinEr")%>
                            </td>
                             <td>
                                <%# Eval("LiLv")%>
                            </td>
                             <td>
                                <%# Eval("HouMoney")%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "ShTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <%#Eval("ShenHe").ToString() == "2" ? "<a href='javascript:void(0)' class='cshenhe' cid='" + Eval("Id") + "' uname=" + Eval("Uname") + " txjiner=" + Eval("JinEr") + " style='color:Blue;text-decoration:underline;'>未审核</a>" : (Eval("ShenHe").ToString() == "1" ? "<span style='color:red;'>已审核</span>" : "")%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <a href="javascript:void(0)" id="SingleDel" pid="<%#Eval("id") %>" class="tablelink">
                                    删除</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <div class="clear">
        </div>
        <div class="page">
            <uc3:Pager ID="Pager1" runat="server" />
        </div>
        <div class="pagetit">
            <div class="pagetit_1 fl">
                <asp:HiddenField ID="hidTopId" runat="server" ClientIDMode="Static" />
                <a href="javascript:void(0)" id="checkAll">全选</a>&nbsp;/&nbsp;<a href="javascript:void(0)"
                    id="checkAllBack">反选</a>
            </div>
            <div class="pagetit_2 fl">
                <a class="button" id="BtnDeleteAll" href="javascript:void(0)"><span>
                    <img src="../images/delete_btn_bg.png" /></span>一键删除</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    </form>
</body>
</html>
