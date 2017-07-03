<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderInfo.aspx.cs" Inherits="Web_Project.View.admin_.OrderList.OrderInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/neiStyle.css" rel="stylesheet" type="text/css" />
    <title>订单详细信息</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="rightinfo">
        <div class="tools">
            <div class="serdiv fl">
                <dl>
                    <dt>订单号：</dt>
                    <dd>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal></dd>
                </dl>
                <dl style="margin-left: 15px;">
                    <dt>发货状态：</dt>
                    <dd>
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal></dd>
                </dl>
                <dl style="margin-left: 15px;">
                    <dt>收货人姓名：</dt>
                    <dd>
                        <asp:Literal ID="Literal3" runat="server"></asp:Literal></dd>
                </dl>
                <dl style="margin-left: 15px;">
                    <dt>收货地址：</dt>
                    <dd>
                        <asp:Literal ID="Literal4" runat="server"></asp:Literal></dd>
                </dl>
            </div>
        </div>
        <table class="tablelist">
            <thead>
                <tr>
                    <th width="7%">
                        编号
                    </th>
                    <th>
                        商品信息
                    </th>
                    <th width="13%">
                        单价
                    </th>
                    <th width="10%">
                        数量
                    </th>
                    <th width="10%">
                        金额
                    </th>
                    <th width="20%">
                        添加时间
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%#Eval("id") %>
                            </td>
                            <td>
                                <%# Eval("btitle")%>
                            </td>
                            <td>
                                <%# Eval("DanJia")%>
                            </td>
                            <td>
                                <%# Eval("Num")%>
                            </td>
                            <td>
                                <%# Eval("Zprice")%>
                            </td>
                            <td>
                                <%#DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy/MM/dd HH:mm:ss}")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
        <div class="clear">
        </div>
    </div>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    </form>
</body>
</html>
