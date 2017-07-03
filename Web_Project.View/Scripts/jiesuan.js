$(document).ready(function () {
    $(".scart_4").html('');
    var leg = $(".scart_2 table tr").length;
    if (leg > 1) {
        var zongjia = 0;
        var znum = 0;
        $(".scart_2 table .td4").each(function () {
            zongjia += +$.trim($(this).find("span").html());
            var num = $(this).parent().find(".td2").html();
            znum += +$.trim(parseInt(num));
        });
        $("#Label2").html('');
        $("#Label2").html(znum);
        $("#Label1").html('');
        $("#Label1").html(zongjia.toFixed(2));
        $(".scart_4").html("<a href='javascript:void(0)' class='btn_jiesuan'>提交订单</a>");
    } else {
        $(".scart_4").html("<a href='javascript:void(0)'>提交订单</a>");
    }
    $(".btn_jiesuan").click(function () {
        var pid = "";
        var price = "";
        $(".scart_2 table tr.tr").each(function () {
            pid += $.trim($(this).attr("pid")) + ",";
            price += $.trim($(this).attr("price")) + ",";
        });
        var zprice = $.trim($("#Label1").html());
        var znum = $.trim($("#Label2").html());
        var query = "{zprice:" + zprice + ",znum:" + znum + ",pid:'" + pid + "',price:'" + price + "'}";
        swal({
            title: "确认提交订单？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "确认",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/TrueJieSuanMethod",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d[0] == "1") {
                        $("#Hidden1").val(result.d[1]);
                        $("#Hidden2").val(zprice);
                        $("#formid").submit();
                        //window.location.href = "LastOrder.aspx?oid=" + result.d[1];
                    }
                    if (result.d[0] == "2") {
                        swal("OMG!", "结算失败，请刷新重试", "error");
                    }
                    if (result.d[0] == "3") {
                        swal("OMG!", "您的奖金账户不足，请充值", "error");
                    }
                    if (result.d[0] == "4") {
                        swal("OMG!", "没有当前会员记录", "error");
                    }
                    if (result.d[0] == "10") {
                        swal("OMG!", "出现错误,请联系网站管理员", "error");
                    }
                },
                error: function () {
                    swal("OMG!", "出现错误,请刷新后重试", "error");
                }
            });
        });
    });
});