$(document).ready(function () {
    $(".shenhe").click(function () {
        var href = window.location.href;
        var href1 = "";
        if (href.indexOf("page") > 0) {
            href1 = href.substring(0, href.lastIndexOf("?"));
        } else {
            href1 = href;
        }
        var zid = $.trim($(this).attr("zid"));
        var zname = $.trim($(this).attr("zname"));
        var zprice = $.trim($(this).attr("zprice"));
        var page = $.trim($(this).attr("page"));
        layer.load(0, { shade: [0.1, '#000'] });
        layer.confirm('确认审核当前充值记录？', { title: '提示信息',
            btn: ['确定', '取消'] //按钮
        }, function () {
            var dquery = "{zid:" + zid + ",zname:'" + zname + "',zprice:" + zprice + "}";
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../StaticMethod/Info.aspx/ChongZhiMehod",
                data: dquery,
                dataType: "json",
                success: function (result) {
                    layer.closeAll('loading');
                    if (result.d[0] == "1") {
                        layer.msg('充值成功', { icon: 2 });
                        window.location.href = href1 + "?page=" + page;
                    }
                    if (result.d[0] == "2") {
                        layer.msg('充值失败，请刷新重试', { icon: 2 });
                    }
                },
                error: function () {
                    layer.msg('出现错误，请联系网站管理员', { icon: 2 });
                    layer.closeAll('loading');
                }
            });
        }, function () {
            layer.closeAll('loading');
        });
    });
});