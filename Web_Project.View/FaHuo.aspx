<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true"
    CodeBehind="FaHuo.aspx.cs" Inherits="Web_Project.View.FaHuo" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
    <link href="Styles/popup.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/fahuo.js" type="text/javascript"></script>
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
            <span>发货管理</span>
        </div>
        <div class="myorder">
            <div class="myorder_1">
                订单号查询：<asp:TextBox ID="txtTitle" CssClass="txt_order" runat="server"></asp:TextBox><asp:Button
                    ID="Button1" runat="server" CssClass="btn_order" OnClick="BtnSearch_Click" Text="查&nbsp;询" />&nbsp;&nbsp;&nbsp;总订单：<span><asp:Literal
                        ID="Literal2" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;未发货：<span><asp:Literal
                            ID="Literal3" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;已发货：<span><asp:Literal
                                ID="Literal4" runat="server"></asp:Literal></span>
            </div>
            <div class="tab_list tab_order">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <th height="35px">
                            会员号
                        </th>
                        <th width="22%">
                            订单号
                        </th>
                        <th width="13%">
                            金额
                        </th>
                        <th width="19%">
                            下单时间
                        </th>
                        <th width="10%">
                            发货状态
                        </th>
                        <th width="19%">
                            发货时间
                        </th>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr class="tr<%#Eval("Id")%>">
                                <td>
                                    <%#Eval("Rname")%>
                                </td>
                                <td>
                                    <a href="FhList_<%#Eval("Id")%>_<%=page %>.aspx">
                                        <%#Eval("OrderId")%></a>
                                </td>
                                <td>
                                    <%#Eval("Zjiage")%>
                                </td>
                                <td>
                                    <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd HH:mm:dd}")%>
                                </td>
                                <td>
                                    <%#Eval("IsFaHuo").ToString() == "2" ? "<a href='javascript:void(0)' class='fahuo' jhid='" + Eval("Id") + "' uname='" + Eval("Rname") + "' zprice='" + Eval("Zjiage") + "'>未发货</a>" : "<span style='color:red'>已发货</span>"%>
                                </td>
                                <td>
                                    <%#DataBinder.Eval(Container.DataItem, "FaTime", "{0:yyyy-MM-dd HH:mm:dd}")%>
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
                    注：点击订单号查看具体的产品信息
                </div>
            </div>
        </div>
    </div>
    <input id="Hidden1" type="hidden" />
    <input id="Hidden2" type="hidden" />
    <input id="Hidden3" type="hidden" />
    <div id="gray">
    </div>
    <div class="popup" id="popup">
        <div class="top_nav" id='top_nav'>
            <div align="center">
                <span>填写发货信息</span> <a class="guanbi"></a>
            </div>
        </div>
        <div class="min">
            <div class="tc_login">
                <div class="right">
                    <div align="center">
                        <input type="text" name="name" id="name" placeholder="快递单号" autocomplete="off" class="input_yh" />
                        <input type="text" name="pass" id="pass" placeholder="快递公司" autocomplete="off" class="input_mm" />
                    </div>
                    <div align="center">
                        <input type="button" class="btn_queding" value="确定">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
