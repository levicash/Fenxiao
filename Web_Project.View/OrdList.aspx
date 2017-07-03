<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdList.aspx.cs" Inherits="Web_Project.View.OrdList1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/common.css" rel="stylesheet" type="text/css" />
    <link href="Styles/member.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <div class="m_right" style="float: inherit; width: 100%;">
        <div class="myorder">
            <div class="myorder_3">
                订单号码：<span><asp:Literal ID="Literal1" runat="server"></asp:Literal></span>&nbsp;&nbsp;&nbsp;发货状态：<span><asp:Literal
                    ID="Literal2" runat="server"></asp:Literal></span><br />
                快递单号：<span><asp:Literal ID="Literal3" runat="server"></asp:Literal></span><br />
                快递公司：<span><asp:Literal ID="Literal4" runat="server"></asp:Literal></span>
            </div>
            <div class="tab_list tab_order">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <th height="35px">
                            商品信息
                        </th>
                        <th width="12%">
                            单价
                        </th>
                        <th width="12%">
                            数量
                        </th>
                        <th width="13%">
                            金额
                        </th>
                    </tr>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="td1">
                                    <img src="<%#Eval("bimgname").ToString()==""?"admin_/Images/no_pic.gif":("admin_/Images/proImg/"+Eval("bimgname").ToString()) %>"
                                        alt="<%#Eval("btitle") %>" title="<%#Eval("btitle") %>" />
                                    <%#Eval("btitle") %>
                                </td>
                                <td>
                                    <%#Eval("DanJia")%>
                                </td>
                                <td>
                                    <%#Eval("Num")%>
                                </td>
                                <td>
                                    <%#Eval("Zprice")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
