<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftNav.ascx.cs" Inherits="Web_Project.View.Contrl.LeftNav" %>
<%@ Import Namespace="Web_Project.Core" %>
<script>
    $(document).ready(function () {
        $(".xb").hover(function () {
            $(".left_nav").show();
        }, function () {
            $(".left_nav").hide();
        });
    });
</script>
<div class="xb fl">
    <div class="xb_1">
        全部商品分类
    </div>
    <div class="left_nav">
        <ul id="nav">
            <% foreach (ProTypeCore typeCore in ProType())
               {
            %>
            <li class="mainCate">
                <h3>
                    <a href="Product_<%=typeCore.Id %>.aspx">
                        <%=typeCore.Title %></a></h3>
                <div class="subCate">
                    <% foreach (ProTypeCore typeCore1 in ProType1(typeCore.Id))
                       {
                    %>
                    <ul id="sub-ul-1">
                        <h4>
                            <a href="Product_<%=typeCore1.Id %>.aspx">
                                <%=typeCore1.Title %></a></h4>
                        <li><span>
                            <% foreach (ProductInfoCore infoCore in ProductInfoMethod(typeCore1.Id))
                               {
                            %>
                            <a href="ProductInfo_<%=infoCore.Id %>_<%=infoCore.Type %>.aspx">
                                <%=infoCore.Title%></a>
                            <%} %>
                        </span></li>
                    </ul>
                    <%} %>
                </div>
            </li>
            <%} %>
        </ul>
        <script type="text/javascript">
            jQuery("#nav").slide({
                type: "menu", //效果类型
                titCell: ".mainCate", // 鼠标触发对象
                targetCell: ".subCate", // 效果对象，必须被titCell包含
                delayTime: 0, // 效果时间
                triggerTime: 0, //鼠标延迟触发时间
                defaultPlay: false, //默认执行
                returnDefault: true//返回默认
            });
        </script>
    </div>
</div>
