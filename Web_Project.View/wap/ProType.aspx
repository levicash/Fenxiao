<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProType.aspx.cs" Inherits="Web_Project.View.wap.ProType" %>

<%@ Import Namespace="Web_Project.Core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="target-densitydpi=device-dpi,width=640px, user-scalable=no" />
    <meta name="MobileOptimized" content="640" />
    <meta name="Iphone-content" content="640" />
    <script src="../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="css/ui.css" rel="stylesheet" type="text/css" />
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function ($) {
            $(".j-content").eq(0).show();
            $('#sidebar ul li').click(function () {
                $(this).addClass('active').siblings('li').removeClass('active');
                var index = $(this).index();
                $('.j-content').eq(index).show().siblings('.j-content').hide();
            });
        });
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="bodycenter">
        <div class="header">
            <div class="header-background">
            </div>
            <div class="toolbar statusbar-padding">
                <button class="bar-button back-button" onclick="history.go(-1);" dwz-event-on-click="click">
                    <i class="icon icon-back"></i>
                </button>
                <div class="header-title">
                    <div class="title">
                        分类</div>
                </div>
            </div>
        </div>
        <div class="con">
            <aside>
		<div class="menu-left scrollbar-none r-line" id="sidebar">
			<ul>
			    <asp:Repeater ID="Repeater1" runat="server">
			        <ItemTemplate>
			            <li class="<%#(Container.ItemIndex+1).ToString()=="1"?"active":"" %>"><%#Eval("Title") %></li>
			        </ItemTemplate>
			    </asp:Repeater>
				
			</ul>
		</div>
	</aside>
            <% foreach (ProTypeCore typeCore in GetProType())
               {
            %>
            <section class="menu-right padding-all j-content">
		<h5><%=typeCore.Title %></h5>
		<ul>
		    <% foreach (ProTypeCore typeCore1 in GetProType1(typeCore.Id))
         {
                        %>
			<li class="w-3"><a href="Product.aspx?id=<%=typeCore1.Id %>"></a> <img src="<%=typeCore1.ImgName.ToString()==""?"../admin_/Images/no_pic.gif":("../admin_/Images/proImg/"+typeCore1.ImgName.ToString()) %>"
                                            alt="<%=typeCore1.Title %>" title="<%=typeCore1.Title %>" /><span><%=typeCore1.Title %></span></li>
            <%} %>
		</ul>
	</section>
            <%} %>
        </div>
        <div style="height: 110px">
        </div>
        <div class="tab-bar tab-bottom">
            <a class="tab-button" href="Index.aspx"><i class="tab-button-icon icon icon-home"></i>
                <span class="tab-button-txt">首页</span></a> <a class="tab-button active" href="ProType.aspx">
                    <i class="tab-button-icon icon icon-service"></i><span class="tab-button-txt">分类</span></a>
            <a class="tab-button cached" href="ShopCart.aspx"><i class="tab-button-icon icon icon-car">
            </i><span class="tab-button-txt">购物车</span></a> <a class="tab-button cached" href="Member.aspx">
                <i class="tab-button-icon icon icon-my"></i><span class="tab-button-txt">我的</span></a>
        </div>
    </div>
    </form>
</body>
</html>
