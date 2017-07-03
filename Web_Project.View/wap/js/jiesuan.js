$(document).ready(function () {
    var leg = $(".main_con_goods ul li").length;
    if (leg > 0) {
        var zongjia = 0;
        var znum = 0;
        $(".main_con_goods ul li").each(function () {
            var danjia = $(this).find(".aui-redd span").html();
            var num = $(this).find(".emnum span").html();
            zongjia += +$.trim(danjia * parseInt(num));
            znum += +$.trim(parseInt(num));
        });
        $(".settlement_left .money span").html('');
        $(".settlement_left .money span").html(zongjia.toFixed(2));
        $(".settlement_left span.sp1").html('');
        $(".settlement_left span.sp1").html(znum);
    }
    $(".btn_jiesuan").click(function () {
        var pid = "";
        var price = "";
        $(".main_con_goods ul li").each(function () {
            pid += $.trim($(this).attr("pid")) + ",";
            price += $.trim($(this).attr("price")) + ",";
        });
        var zprice = $.trim($(".settlement_left .money span").html());
        var znum = $.trim($(".settlement_left span.sp1").html());
        var query = "{zprice:" + zprice + ",znum:" + znum + ",pid:'" + pid + "',price:'" + price + "'}";

        var index = layer.open({ type: 2, content: '加载中' });
        layer.open({
            content: '确认提交订单？'
          , shadeClose: false
    , btn: ['是的', '不要']
    , yes: function () {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/TrueJieSuanMethod",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d[0] == "1") {
                    window.location.href = "LastOrder.aspx?oid=" + result.d[1];
                }
                if (result.d[0] == "2") {
                    layer.close(index);
                    layer.open({ content: '结算失败，请刷新重试', skin: 'msg', time: 2 });
                }
                if (result.d[0] == "3") {
                    layer.close(index);
                    layer.open({ content: '您的奖金账户不足，请充值', skin: 'msg', time: 2 });
                }
                if (result.d[0] == "4") {
                    layer.close(index);
                    layer.open({ content: '没有当前会员记录', skin: 'msg', time: 2 });
                }
                if (result.d[0] == "10") {
                    layer.close(index);
                    layer.open({ content: '出现错误,请联系网站管理员', skin: 'msg', time: 2 });
                }
            },
            error: function () {
                layer.close(index);
                layer.open({ content: '出现错误,请联系网站管理员', skin: 'msg', time: 2 });
            }
        });
    }
    , no: function () {
        layer.close(index);
    }
        });
    });
});