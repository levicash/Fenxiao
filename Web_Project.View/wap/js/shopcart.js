$(document).ready(function () {
    var leg = $(".main_con_goods ul li").length;
    if (leg > 0) {
        $(".you_goods").show();
        $(".no_goods").hide();
        var zongjia = 0;
        var znum = 0;
        $(".main_con_goods ul li").each(function () {
            var danjia = $(this).find(".aui-redd span").html();
            var num = $(this).find(".num").val();
            zongjia += +$.trim(danjia * parseInt(num));
            znum += +$.trim(parseInt(num));
        });
        $(".settlement_left .money span").html('');
        $(".settlement_left .money span").html(zongjia.toFixed(2));
        $(".settlement_left span.sp1").html('');
        $(".settlement_left span.sp1").html(znum);
    } else {
        $(".you_goods").hide();
        $(".no_goods").show();
    }
    //单一删除
    $(".SingleDel").on("click", function () {
        var id = $(this).attr("jhid");
        var query = "{id:" + id + "}";

        layer.open({
            content: '确定删除当前数据？'
    , btn: ['是的', '不要']
    , yes: function () {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/BtnDiErSingleDel",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d) {
                    window.location.reload();
                }
                else {
                    layer.open({ content: '删除失败,请刷新后重试', skin: 'msg', time: 2 });
                }
            },
            error: function () {
                layer.open({ content: '出现错误,请联系网站管理员', skin: 'msg', time: 2 });
            }
        });
    }
        });
    });
    //减号
    $(".del").click(function () {
        var zongjia = 0;
        var jhid = $(this).attr("jhid");
        var oldValue = parseInt($("#sl" + jhid).val()); //取出现在的值，并使用parseInt转为int类型数据
        if (oldValue == 1) {
            return false;
        }
        oldValue--; //自减1
        $("#sl" + jhid).val(oldValue); //将增加后的值付给原控件
        var znum = 0;
        $(".main_con_goods ul li").each(function () {
            var danjia = $(this).find(".aui-redd span").html();
            var num = $(this).find(".num").val();
            zongjia += +$.trim(danjia * parseInt(num));
            znum += +$.trim(parseInt(num));
        });
        $(".settlement_left .money span").html('');
        $(".settlement_left .money span").html(zongjia.toFixed(2));
        $(".settlement_left span.sp1").html('');
        $(".settlement_left span.sp1").html(znum);
        var query = "{bid:" + jhid + ", num:" + oldValue + "}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/UpdateBuyListMethod",
            data: query,
            dataType: "json",
            success: function (result) {
            }
        });
    });
    $(".add").click(function () {
        var zongjia = 0;
        var jhid = $(this).attr("jhid");
        var oldValue = parseInt($("#sl" + jhid).val()); //取出现在的值，并使用parseInt转为int类型数据
        oldValue++; //自加1
        $("#sl" + jhid).val(oldValue); //将增加后的值付给原控件
        var znum = 0;
        $(".main_con_goods ul li").each(function () {
            var danjia = $(this).find(".aui-redd span").html();
            var num = $(this).find(".num").val();
            zongjia += +$.trim(danjia * parseInt(num));
            znum += +$.trim(parseInt(num));
        });
        $(".settlement_left .money span").html('');
        $(".settlement_left .money span").html(zongjia.toFixed(2));
        $(".settlement_left span.sp1").html('');
        $(".settlement_left span.sp1").html(znum);
        var query = "{bid:" + jhid + ", num:" + oldValue + "}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/UpdateBuyListMethod",
            data: query,
            dataType: "json",
            success: function (result) {
            }
        });
    });
    $(".shuliang").keyup(function () {
        $(this).val($(this).val().replace(/\D|^0/g, ''));
    }).bind("paste", function () {
        $(this).val($(this).val().replace(/\D|^0/g, '1'));
    }).css("ime-mode", "disabled");
    $(".shuliang").blur(function () {
        var zongjia = 0;
        var num = $(this).attr("num");
        var jhid = $(this).attr("jhid");
        var xznum = $(this).val();
        var regemail = /^[0-9]*[1-9][0-9]*$/;
        if (!regemail.test(xznum)) {
            layer.open({ content: '数量为正整数', skin: 'msg', time: 2 });
            $(this).val(num);
            return false;
        }
        if (xznum != num) {
            if ($(this).val() == "" || $(this).val() == "0") {
                $(this).val(num);
            }
            var znum = 0;
            $(".main_con_goods ul li").each(function () {
                var danjia = $(this).find(".aui-redd span").html();
                var num = $(this).find(".num").val();
                zongjia += +$.trim(danjia * parseInt(num));
                znum += +$.trim(parseInt(num));
            });
            $(".settlement_left .money span").html('');
            $(".settlement_left .money span").html(zongjia.toFixed(2));
            $(".settlement_left span.sp1").html('');
            $(".settlement_left span.sp1").html(znum);
            var query = "{bid:" + jhid + ", num:" + xznum + "}";
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/UpdateBuyListMethod",
                data: query,
                dataType: "json",
                success: function (result) {
                }
            });
        }
    });
});