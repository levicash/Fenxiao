<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageList.aspx.cs" Inherits="Web_Project.View.admin_.Message.MessageList" %>

<%@ Register Assembly="AspNetPager" TagPrefix="webdiyer" Namespace="Wuqi.Webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>在线留言列表</title>
    <link href="../css/css.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../css/Operating.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Operating("MailInfo");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="table" cellspacing="0" cellpadding="5" width="99%" align="center" border="0">
            <tr>
                <th class="bg_tr" align="left" colspan="2" height="25">
                    留言信息
                </th>
            </tr>
            <tr align="center">
                <td class="td_bg">
                    <div class="pagetit">
                        <table width="99%" cellspacing="0" cellpadding="0" align="center" border="0" height="30">
                            <tbody>
                                <tr>
                                    <td height="30">
                                        问题：
                                        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                                        <asp:Button ID="Button3" runat="server" Text="搜索" CssClass="button button_search" OnClick="Button3_Click" />
                                    </td>
                                    <td align="right" colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td_bg">
                    <table border="0" cellspacing="0" cellpadding="4" width="100%" align="center">
                        <tr>
                            <td class="td_bg biaoti" style="border-bottom: 1px solid #cde6ff; border-left: 1px solid #ddd;"
                                width="10%">
                                选择
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="6%">
                                序号
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;">
                                问题
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="10%">
                                姓名
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="10%">
                                回复状态
                            </td>
                            <td class="td_bg biaoti" style="border: 1px solid #cde6ff; border-right: 0px;" width="15%">
                                添加时间
                            </td>
                            <td class="td_bg biaoti center" style="border: 1px solid #cde6ff;" width="7%">
                                操作
                            </td>
                        </tr>
                        <asp:Repeater ID="repProInfo" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td class="td_bg" style="border-bottom: 1px solid #cde6ff; border-left: 1px solid #ddd;">
                                        <input type='checkbox' name='checkbox' id="<%#Eval("id") %>" />
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;"
                                        width="6%">
                                        <%# Container.ItemIndex+1%>
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;"
                                        title="<%# Eval("Title") %>">
                                        <a href="Info.aspx?id=<%#Eval("Id") %>&page=<%=page %>">
                                            <%# Eval("Title")%></a>
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;"
                                        title="<%# Eval("Name") %>">
                                        <a href="Info.aspx?id=<%#Eval("Id") %>&page=<%=page %>">
                                            <%# Eval("Name")%></a>
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;">
                                        <%# Eval("IsHf").ToString()=="1"?"未回复":"<span style='color:red'>已回复</span>"%>
                                    </td>
                                    <td class="td_bg" style="border: 1px solid #cde6ff; border-top: none; border-right: 0px;">
                                        <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                                    </td>
                                    <td class="td_bg center" style="border: 1px solid #cde6ff; border-top: none;">
                                        <a href='Info.aspx?id=<%# Eval("Id") %>&page=<%=page %>'>查看</a>&nbsp;|&nbsp;<a href="javascript:void(0)"
                                            id="SingleDel" pid="<%#Eval("id") %>">删除</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="td_bg" colspan="3">
                    <div class="pager" runat="server" id="hidediv">
                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" CssClass="anpager" FirstPageText="首页"
                            LastPageText="尾页" NextPageText="&gt;" PrevPageText="&lt;" ShowPageIndexBox="Never"
                            RecordCount="228" CurrentPageButtonClass="cpb" OnPageChanged="AspNetPager1_PageChanged">
                        </webdiyer:AspNetPager>
                        <span>共<asp:Literal ID="Literal1" runat="server" Text=""></asp:Literal>条数据&nbsp;第</span>
                        <input type="text" class="page_txt" id="pagecurrent" runat="server" value="1" readonly />
                        <span>页</span>
                    </div>
                </td>
            </tr>
            <tr align="center">
                <td class="td_bg pt0">
                    <div class="pagetit">
                        <table width="99%" cellspacing="0" cellpadding="0" align="center" border="0" height="30">
                            <tbody>
                                <tr>
                                    <td height="30" width="5%">
                                        <asp:HiddenField ID="hidTopId" runat="server" ClientIDMode="Static" />
                                        <a href="javascript:void(0)" id="checkAll">全选</a>/<a href="javascript:void(0)" id="checkAllBack">反选</a>
                                    </td>
                                    <td>
                                        <input type="button" value="一键删除" id="BtnDeleteAll" class="button button_delete" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
