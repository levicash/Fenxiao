<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TxInfo.aspx.cs" Inherits="Web_Project.View.admin_.TiXian.TxInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AspNetPager" TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <table class="tablelist">
            <thead>
                <tr>
                    <th width="5%">
                        编号
                    </th>
                    <th>
                        提现会员
                    </th>
                    <th width="10%">
                        姓名
                    </th>
                    <th width="10%">
                        提现金额
                    </th>
                    <th width="10%">
                        提现比例
                    </th>
                    <th width="10%">
                        最终金额
                    </th>
                    <th width="10%">
                        审核状态
                    </th>
                    <th width="15%">
                        审核时间
                    </th>
                    <th width="15%">
                        充值时间
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# Eval("Id")%>
                            </td>
                            <td>
                                <%# Eval("Uname")%>
                            </td>
                            <td>
                                <%# Eval("buname")%>
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
                                <%# Eval("ShenHe").ToString()=="2"?"未审核":"<span style='color:red;'>已审核</span>"%>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, "ShTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                            <td>
                                <%# DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <div class="pager clearfix" runat="server" id="hidediv">
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="anpager" OnPageChanged="AspNetPager1_PageChanged"
                FirstPageText="首页" LastPageText="尾页" NextPageText="&gt;" PrevPageText="&lt;"
                ShowPageIndexBox="Never" RecordCount="228" UrlPaging="True" CurrentPageButtonClass="cpb">
            </webdiyer:AspNetPager>
            <div class="pxi">
                <span>共<asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>条数据&nbsp;第</span>
                <input type="text" class="page_txt" id="pagecurrent" runat="server" value="" onkeydown="javascript:enter(this,$('*[id$=Button1]'))" />
                <span>页</span>
                <asp:Button ID="Button1" runat="server" Text="确&nbsp;定" CssClass="btn_page" OnClick="Button1_Click" /></div>
        </div>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    </form>
</body>
</html>
