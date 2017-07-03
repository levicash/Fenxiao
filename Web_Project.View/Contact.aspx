<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="Web_Project.View.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
    <script>
        $(document).ready(function () {
            $("#navul > li").removeClass("current");
            $("#navul > li").eq(7).addClass("current");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="nav_left">
            <div class="nav_left_top_tit">
                联系我们
            </div>
            <div class="nav_left_top_con">
                <div class="list">
                    <a href="Contact.aspx">联系我们</a> <a href="Message.aspx">客户留言</a>
                </div>
            </div>
        </div>
        <div class="nav_right">
            <div class="nav_right_top">
                <div class="nav_right_top_left">
                    联系我们
                </div>
                <div class="nav_right_top_right">
                    您当前的位置：<a href="Index.aspx">首页</a> >> <a href="Contact.aspx">联系我们</a>
                </div>
            </div>
            <div class="nav_right_cen">
                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                <div style="width: 697px; height: 550px; border: #ccc solid 1px; margin-top: 30px;" id="dituContent">
                </div>
                <script type="text/javascript">
                    //创建和初始化地图函数：
                    function initMap() {
                        createMap(); //创建地图
                        setMapEvent(); //设置地图事件
                        addMapControl(); //向地图添加控件
                        addMarker(); //向地图中添加marker
                    }

                    //创建地图函数：
                    function createMap() {
                        var map = new BMap.Map("dituContent"); //在百度地图容器中创建一个地图
                        var point = new BMap.Point(118.423599, 35.287355); //定义一个中心点坐标
                        map.centerAndZoom(point, 16); //设定地图的中心点和坐标并将地图显示在地图容器中
                        window.map = map; //将map变量存储在全局
                    }

                    //地图事件设置函数：
                    function setMapEvent() {
                        map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
                        map.enableScrollWheelZoom(); //启用地图滚轮放大缩小
                        map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)
                        map.enableKeyboard(); //启用键盘上下左右键移动地图
                    }

                    //地图控件添加函数：
                    function addMapControl() {
                        //向地图中添加缩放控件
                        var ctrl_nav = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
                        map.addControl(ctrl_nav);
                        //向地图中添加比例尺控件
                        var ctrl_sca = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
                        map.addControl(ctrl_sca);
                    }

                    //标注点数组
                    var markerArr = [{ title: "山东聚全废旧物资回收有限公司", content: "企业地址：山东省临沂市兰山区李官镇华东有色金属城长葛街18号", point: "118.422198|35.287311", isOpen: 0, icon: { w: 23, h: 25, l: 23, t: 21, x: 9, lb: 12} }
		 ];
                    //创建marker
                    function addMarker() {
                        for (var i = 0; i < markerArr.length; i++) {
                            var json = markerArr[i];
                            var p0 = json.point.split("|")[0];
                            var p1 = json.point.split("|")[1];
                            var point = new BMap.Point(p0, p1);
                            var iconImg = createIcon(json.icon);
                            var marker = new BMap.Marker(point, { icon: iconImg });
                            var iw = createInfoWindow(i);
                            var label = new BMap.Label(json.title, { "offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20) });
                            marker.setLabel(label);
                            map.addOverlay(marker);
                            label.setStyle({
                                borderColor: "#808080",
                                color: "#333",
                                cursor: "pointer"
                            });

                            (function () {
                                var index = i;
                                var _iw = createInfoWindow(i);
                                var _marker = marker;
                                _marker.addEventListener("click", function () {
                                    this.openInfoWindow(_iw);
                                });
                                _iw.addEventListener("open", function () {
                                    _marker.getLabel().hide();
                                })
                                _iw.addEventListener("close", function () {
                                    _marker.getLabel().show();
                                })
                                label.addEventListener("click", function () {
                                    _marker.openInfoWindow(_iw);
                                })
                                if (!!json.isOpen) {
                                    label.hide();
                                    _marker.openInfoWindow(_iw);
                                }
                            })()
                        }
                    }
                    //创建InfoWindow
                    function createInfoWindow(i) {
                        var json = markerArr[i];
                        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
                        return iw;
                    }
                    //创建一个Icon
                    function createIcon(json) {
                        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w, json.h), { imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1), offset: new BMap.Size(json.x, json.h) })
                        return icon;
                    }

                    initMap(); //创建和初始化地图
                </script>
            </div>
        </div>
    </div>
</asp:Content>
