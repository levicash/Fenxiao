$(document).ready(function () {
    $(".scart_4").html('');
    var leg = $(".scart_2 table tr").length;
    if (leg > 0) {
        var zongjia = 0;
        var znum = 0;
        $(".scart_2 table .td4").each(function () {
            zongjia += +$.trim($(this).find("span").html());
            var num = $(this).parent().find(".td2 .shuliang").val();
            znum += +$.trim(parseInt(num));
        });
        $("#Label2").html('');
        $("#Label2").html(znum);
        $("#Label1").html('');
        $("#Label1").html(zongjia.toFixed(2));
        $(".scart_4").html("<a href='Settle.aspx'>结&nbsp;&nbsp;算</a>");
    } else {
        $(".scart_4").html("<a href='javascript:void(0)'>结&nbsp;&nbsp;算</a>");
    }
    //全选
    $("input[name=checkbox]").click(function () {
        if ($(this).prop("checked")) {
            $("input[name=checkbox1]").each(function () {
                $(this).prop("checked", "checked");
            });
        } else {
            $("input[name=checkbox1]").each(function () {
                $(this).removeProp("checked");
            });
        }
    });
    //删除全部
    $("#BtnDeleteAll").click(function () {
        var hidTopId = "";
        $("input[name=checkbox1]").each(function () {
            if ($(this).prop("checked")) {
                hidTopId = hidTopId + $(this).prop("id") + ",";
            }
        });
        if (hidTopId == "") {
            swal("OMG!", "还没有选择项！请先选择......", "error");
            return false;
        }
        var query = "{hiTopId:'" + hidTopId + "'}";

        swal({
            title: "确定删除当前数据？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "确认",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/BtnDeleteAll",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        window.location.reload();
                    } else {
                        swal("OMG!", "删除失败,请刷新后重试", "error");
                    }
                },
                error: function () {
                    swal("OMG!", "出现错误,请刷新后重试", "error");
                }
            });
        });
    });
    //单一删除
    $(".SingleDel").on("click", function () {
        var id = $(this).attr("jhid");
        var query = "{id:" + id + "}";
        swal({
            title: "确定删除当前数据？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "确认",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/BtnDiErSingleDel",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        window.location.reload();
                    }
                    else {
                        swal("OMG!", "删除失败,请刷新后重试", "error");
                    }
                },
                error: function () {
                    swal("OMG!", "出现错误,请刷新后重试", "error");
                }
            });
        });
    });
    //清空购物车
    $("#btnQingkong").click(function () {
        swal({
            title: "确定清空购物车？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "确认",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/BtnDeleteQingKong",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        window.location.reload();
                    }
                    else {
                        swal("OMG!", "清空失败,请刷新后重试", "error");
                    }
                },
                error: function () {
                    swal("OMG!", "出现错误,请刷新后重试", "error");
                }
            });
        });
    });
    //减号
    $(".jianhao").click(function () {
        var zongjia = 0;
        var znum = 0;
        $("body").showLoading();
        var jhid = $(this).attr("jhid");
        var danjia = $.trim($(this).parent().parent().find(".tddiv_2 span").html());
        var oldValue = parseInt($("#sl" + jhid).val()); //取出现在的值，并使用parseInt转为int类型数据
        if (oldValue == 1) {
            $("body").hideLoading();
            return false;
        }
        oldValue--; //自减1
        $("#sl" + jhid).val(oldValue); //将增加后的值付给原控件
        var td4 = $(this).parent().parent().find(".td4");
        td4.find("span").html('');
        td4.find("span").html((danjia * oldValue).toFixed(2));
        $(".scart_2 table .td4").each(function () {
            zongjia += +$.trim($(this).find("span").html());
            var num = $(this).parent().find(".td2 .shuliang").val();
            znum += +$.trim(parseInt(num));
        });
        $("#Label2").html('');
        $("#Label2").html(znum);
        $("#Label1").html('');
        $("#Label1").html(zongjia.toFixed(2));
        var query = "{bid:" + jhid + ", num:" + oldValue + "}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/UpdateBuyListMethod",
            data: query,
            dataType: "json",
            success: function (result) {
            }
        });
        $("body").hideLoading();
    });
    $(".jiahao").click(function () {
        var zongjia = 0;
        var znum = 0;
        $("body").showLoading();
        var jhid = $(this).attr("jhid");
        var danjia = $.trim($(this).parent().parent().find(".tddiv_2 span").html());
        var oldValue = parseInt($("#sl" + jhid).val()); //取出现在的值，并使用parseInt转为int类型数据
        oldValue++; //自加1
        $("#sl" + jhid).val(oldValue); //将增加后的值付给原控件
        var td4 = $(this).parent().parent().find(".td4");
        td4.find("span").html('');
        td4.find("span").html((danjia * oldValue).toFixed(2));
        $(".scart_2 table .td4").each(function () {
            zongjia += +$.trim($(this).find("span").html());
            var num = $(this).parent().find(".td2 .shuliang").val();
            znum += +$.trim(parseInt(num));
        });
        $("#Label2").html('');
        $("#Label2").html(znum);
        $("#Label1").html('');
        $("#Label1").html(zongjia.toFixed(2));
        var query = "{bid:" + jhid + ", num:" + oldValue + "}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/UpdateBuyListMethod",
            data: query,
            dataType: "json",
            success: function (result) {
            }
        });
        $("body").hideLoading();
    });
    $(".shuliang").keyup(function () {
        $(this).val($(this).val().replace(/\D|^0/g, ''));
    }).bind("paste", function () {
        $(this).val($(this).val().replace(/\D|^0/g, '1'));
    }).css("ime-mode", "disabled");
    $(".shuliang").blur(function () {
        var zongjia = 0;
        var znum = 0;
        $("body").showLoading();
        var num = $(this).attr("num");
        var jhid = $(this).attr("jhid");
        var danjia = $.trim($(this).parent().parent().find(".tddiv_2 span").html());
        var xznum = $(this).val();
        var regemail = /^[0-9]*[1-9][0-9]*$/;
        if (!regemail.test(xznum)) {
            swal("OMG!", "数量为正整数", "error");
            $(this).val(num);
            return false;
        }
        if (xznum != num) {
            if ($(this).val() == "" || $(this).val() == "0") {
                $(this).val(num);
            }
            var td4 = $(this).parent().parent().find(".td4");
            td4.find("span").html('');
            td4.find("span").html((danjia * xznum).toFixed(2));
            $(".scart_2 table .td4").each(function () {
                zongjia += +$.trim($(this).find("span").html());
                var num = $(this).parent().find(".td2 .shuliang").val();
                znum += +$.trim(parseInt(num));
            });
            $("#Label2").html('');
            $("#Label2").html(znum);
            $("#Label1").html('');
            $("#Label1").html(zongjia.toFixed(2));
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
        $("body").hideLoading();
    });
});