$(document).ready(function () {
    //点击发货
    $(".fahuo").on("click", function (event) {
        $("#Hidden1").val('');
        $("#Hidden2").val('');
        $("#Hidden3").val('');
        $("#name").val('');
        $("#pass").val('');
        var jhid = $.trim($(this).attr("jhid"));
        var uname = $.trim($(this).attr("uname"));
        var zprice = $.trim($(this).attr("zprice"));
        $("#Hidden1").val(jhid);
        $("#Hidden2").val(uname);
        $("#Hidden3").val(zprice);
        //窗口效果
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
    $(".btn_queding").click(function () {
        var href = window.location.href;
        var jhid = $("#Hidden1").val();
        var uname = $("#Hidden2").val();
        var zprice = $("#Hidden3").val();
        var danhao = $("#name").val();
        var gongsi = $("#pass").val();
        if (danhao == "") {
            layer.open({ content: '请输入快递单号', skin: 'msg', time: 2 });
            return false;
        }
        if (gongsi == "") {
            layer.open({ content: '请输入快递公司', skin: 'msg', time: 2 });
            return false;
        }
        var index = layer.open({ type: 2, content: '加载中' });
        var query = "{jhid:" + jhid + ",uname:'" + uname + "',zprice:'" + zprice + "',danhao:'" + danhao + "',gongsi:'" + gongsi + "'}";
        layer.open({
            content: '确认发货？'
    , btn: ['是的', '不要']
    , yes: function () {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/IsFaHuoMethod",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d[0] == "1") {
                    window.location.href = href;
                }
                if (result.d[0] == "2") {
                    layer.close(index);
                    layer.open({ content: '发货失败，请刷新重试', skin: 'msg', time: 2 });
                }
                if (result.d[0] == "3") {
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

    //点击关闭按钮
    $("a.btn_back").click(function () {
        $(".heian").hide();
        $(".ptan").animate({ bottom: "-425px" });
    });
});