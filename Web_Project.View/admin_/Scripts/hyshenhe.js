$(document).ready(function () {
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