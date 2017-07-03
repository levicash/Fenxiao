<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="JiHuo.aspx.cs" Inherits="Web_Project.View.JiHuo" %>

<%@ Import Namespace="Web_Project.Data" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
    <script src="layer/layer.js" type="text/javascript"></script>
    <script src="Scripts/hyshenhe.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $(".left_box p a").removeClass("mea");
            $(".left_box p a.ajihuo").addClass("mea");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m_right">
        <div class="mright_1">
            <span>会员审核</span>
        </div>
        <div class="myorder">
            <div class="myorder_1">
                会员编号：<asp:TextBox ID="txtTitle" CssClass="txt_order" runat="server"></asp:TextBox><asp:Button
                    ID="Button1" runat="server" CssClass="btn_order" OnClick="BtnSearch_Click" Text="查&nbsp;询" />&nbsp;&nbsp;&nbsp;总会员：<span><asp:Literal
                        ID="Literal2" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;未审核：<span><asp:Literal
                            ID="Literal3" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;已审核：<span><asp:Literal
                                ID="Literal4" runat="server"></asp:Literal></span>
            </div>
            <div class="tab_list tab_order">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <th height="35px">
                            会员编号
                        </th>
                        <th width="15%">
                            会员账号
                        </th>
                        <th width="16%">
                            姓名
                        </th>
                        <th width="10%">
                            审核状态
                        </th>
                        <th width="20%">
                            审核时间
                        </th>
                        <th width="20%">
                            注册时间
                        </th>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr class="tr<%#Eval("Id")%>">
                                <td>
                                    <a href="javascript:void(0)" class="bianhao" uid="<%#Eval("Id")%>">
                                        <%#GetUserBianHao.GetUserBianHaoMethod(Eval("Rbianhao").ToString())%></a>
                                </td>
                                <td>
                                    <%#Eval("Rname")%>
                                </td>
                                <td>
                                    <%#Eval("Uname")%>
                                </td>
                                <td>
                                    <%#Eval("IsJiHuo").ToString() == "2" ? "<span style='color:red'>已审核</span>" : "<a href='javascript:void(0)' class='cshenhe' uid='" + Eval("Id") + "' style='color:red;text-decoration:underline;'>未审核</a>"%>
                                </td>
                                <td>
                                    <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd HH:mm:dd}")%>
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
                <div class="pager clearfix" runat="server" id="hidediv">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="anpager" OnPageChanged="AspNetPager1_PageChanged"
                        FirstPageText="首页" LastPageText="尾页" NextPageText="&gt;" PrevPageText="&lt;"
                        ShowPageIndexBox="Never" RecordCount="228" UrlPaging="True" CurrentPageButtonClass="cpb">
                    </webdiyer:AspNetPager>
                    <div class="pxi">
                        <span>共<asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>条数据&nbsp;第</span>
                        <input type="text" class="page_txt" id="pagecurrent" runat="server" value="" onkeydown="javascript:enter(this,$('*[id$=Button1]'))" />
                        <span>页</span>
                        <asp:Button ID="Button2" runat="server" Text="确&nbsp;定" CssClass="btn_page" OnClick="Button1_Click" /></div>
                </div>
                <div class="myorder_2">
                    注：点击会员编号查看会员的具体信息
                </div>
            </div>
        </div>
    </div>
</asp:Content>
