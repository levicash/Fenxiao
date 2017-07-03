$(document).ready(function () {
    $(".btn_gwc").click(function () {
        //获取cookies中存的验证码
        var re = new RegExp("(\;|^)[^;]*(" + "WEB-SANJIFENXIAO" + ")\=([^;]*)(;|$)");
        var res = re.exec(document.cookie);
        var cookies = res != null ? res[3] : null;
        if (cookies == null || cookies == '000000' || cookies == '') {
            swal("OMG!", "抱歉，您还未登录", "error");
            return false;
        }
        var pid = $(this).attr("pid"); //当前产品ID
        if (pid <= 0) {
            swal("OMG!", "请先选择一款产品", "error");
            return false;
        }
        var price = $.trim($(".xiang_jiage dd.dd1").html());//价格
        var num = $(".Amount").val(); //数量
        var query = "{pid:" + pid + ", num:" + num + ", price:" + price + "}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/JoinGwcMethod",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d[0] == "1") {
                    swal({
                        title: "加入成功，是否去购物车结算？",
                        type: "warning",
                        showCancelButton: true,
                        closeOnConfirm: false,
                        confirmButtonText: "确认",
                        confirmButtonColor: "#ec6c62"
                    }, function () {
                        window.location.href = "ShopCart.aspx";
                    });
                }
                if (result.d[0] == "2") {
                    swal("OMG!", "加入失败，请刷新重试", "error");
                    return false;
                }
                if (result.d[0] == "3") {
                    swal("OMG!", "没有当前产品", "error");
                    return false;
                }
                if (result.d[0] == "4") {
                    swal("OMG!", "没有当前会员", "error");
                    return false;
                }
                if (result.d[0] == "5") {
                    swal("OMG!", "您的账户余额不足，不能购买", "error");
                    return false;
                }
            },
            error: function () {
                swal("OMG!", "出现错误,请刷新后重试", "error");
            }
        });
    });
});