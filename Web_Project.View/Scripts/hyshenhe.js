$(document).ready(function () {
    $(".bianhao").click(function () {
        var uid = $.trim($(this).attr("uid"));
        layer.open({
            type: 2,
            title: '会员详情',
            shadeClose: true,
            shade: 0.8,
            area: ['380px', '500px'],
            content: 'Index.aspx' //iframe的url
        });
        //alert(uid);
    });
    //    layer.load(0, { shade: [0.1, '#000'] });
    //    layer.closeAll('loading');
    //点击激活
    $(".cshenhe").on("click", function () {
        var href = location.href;
        $("body").showLoading();
        var cid = $.trim($(this).attr("cid"));
        var query = "{uid:" + cid + "}";
        if (confirm('确认激活当前会员？')) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../StaticMethod/Info.aspx/HuiYuanShenHeMethod",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        alert("激活成功");
                        window.location.href = href;
                    }
                    else {
                        alert("激活失败");
                        $("body").hideLoading();
                        return false;
                    }
                },
                error: function () {
                    alert("出现错误,请刷新后重试");
                    $("body").hideLoading();
                }
            });
        }
        else {
            $("body").hideLoading();
        }
    });
});