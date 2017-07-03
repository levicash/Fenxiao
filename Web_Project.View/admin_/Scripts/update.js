$(document).ready(function () {
    //点击审核升级
    $(".cshenhe").on("click", function () {
        var href = location.href;
        $("body").showLoading();
        var cid = $.trim($(this).attr("cid"));
        var uname = $.trim($(this).attr("uname"));
        var otjr = $.trim($(this).attr("otjr"));
        var xtjr = $.trim($(this).attr("xtjr"));
        var xleveltype = $.trim($(this).attr("xleveltype"));
        var xlevel = $.trim($(this).attr("xlevel"));
        var query = "{uid:" + cid + ",uname:'" + uname + "',otjr:'" + otjr + "',xtjr:'" + xtjr + "',xleveltype:'" + xleveltype + "',xlevel:" + xlevel + "}";
        if (confirm('确定审核当前会员升级记录？')) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../StaticMethod/Info.aspx/IsShengJiMethod",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d[0] == "2") {
                        alert("审核成功");
                        window.location.href = href;
                    }
                    if (result.d[0] == "3") {
                        alert("审核失败");
                        $("body").hideLoading();
                        return false;
                    }
                    if (result.d[0] == "4") {
                        alert("没有当前会员记录");
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