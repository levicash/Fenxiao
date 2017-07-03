$(document).ready(function () {
    $(".sku-group").click(function (event) {
        event.stopImmediatePropagation(); //取消事件冒泡；
        $(".heian").css("height", $(document).height());
        $(".heian").show();
        $(".ptan").animate({ bottom: "0px" });
    });
    $(document).click(function (event) {
        if ($(event.target).parents(".ptan").length == 0) {
            $(".heian").hide();
            $(".ptan").animate({ bottom: "-425px" });
        }
    });
    $(".aui-car-ear a").click(function (event) {
        event.stopImmediatePropagation(); //取消事件冒泡；
        $(".heian").css("height", $(document).height());
        $(".heian").show();
        $(".ptan").animate({ bottom: "0px" });
    });
    $(".btn_gwc").click(function () {
        //获取cookies中存的验证码
        var re = new RegExp("(\;|^)[^;]*(" + "WEB-SANJIFENXIAO" + ")\=([^;]*)(;|$)");
        var res = re.exec(document.cookie);
        var cookies = res != null ? res[3] : null;
        if (cookies == null || cookies == '000000' || cookies == '') {
            window.location.href = "Login.aspx";
        }
        var pid = $(this).attr("pid"); //当前产品ID
        if (pid <= 0) {
            layer.open({ content: '请先选择一款产品', skin: 'msg', time: 2 });
            return false;
        }
        var price = $.trim($(".ptan_6 span").html()); //价格
        var num = $(".Amount").val(); //数量

        var index = layer.open({ type: 2, content: '加载中' });
        var query = "{pid:" + pid + ", num:" + num + ", price:" + price + "}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/JoinGwcMethod",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d[0] == "1") {
                    layer.close(index);
                    layer.open({
                        content: '加入成功，是否去购物车结算？'
    , btn: ['是的', '不要']
    , yes: function (index) {
        window.location.href = "ShopCart.aspx";
    }
                    });
                }
                if (result.d[0] == "2") {
                    layer.close(index);
                    layer.open({ content: '加入失败，请刷新重试', skin: 'msg', time: 2 });
                    return false;
                }
                if (result.d[0] == "3") {
                    layer.close(index);
                    layer.open({ content: '没有当前产品', skin: 'msg', time: 2 });
                    return false;
                }
                if (result.d[0] == "4") {
                    layer.close(index);
                    layer.open({ content: '没有当前会员', skin: 'msg', time: 2 });
                    return false;
                }
                if (result.d[0] == "5") {
                    layer.close(index);
                    layer.open({ content: '您的奖金账户余额不足，不能购买', skin: 'msg', time: 2 });
                    return false;
                }
            },
            error: function () {
                layer.close(index);
                layer.open({ content: '出现错误,请联系网站管理员', skin: 'msg', time: 2 });
            }
        });
    });
});