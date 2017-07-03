$(document).ready(function () {
    $("#btn_back").click(function () {
        window.location.href = "TxList.aspx";
    });
    $("#txt_txjr").blur(function () {
        $("body").showLoading();
        var trbi = $.trim($("#txt_txjr").val());
        var bili = $.trim($("#HiddenField1").val());
        var regemail = /^([1-9][0-9]*)+(.[0-9]{1,2})?$/;
        if (!regemail.test(trbi)) {
            swal("OMG!", "请输入提现金额（正整数或者带两位小数）", "error");
            $("body").hideLoading();
            return false;
        }
        $("#Label1").html('');
        $("#Label1").html((trbi * bili).toFixed(2));
        $("body").hideLoading();
    });
    //点击提现
    $("#btn_tixian").click(function () {
        var trbi = $.trim($("#txt_txjr").val());
        var bili = $.trim($("#HiddenField1").val());
        var money = $.trim($("#Label1").html());
        var regemail = /^([1-9][0-9]*)+(.[0-9]{1,2})?$/;
        if (!regemail.test(trbi)) {
            swal("OMG!", "请输入提现金额（正整数或者带两位小数）", "error");
            return false;
        }

        var query = "{zzbi:" + trbi + ",bili:" + bili + ",money:" + money + "}";
        swal({
            title: "您确定要提现？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "确认",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/TiXianMethod",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d[0] == "1") {
                        swal("OMG!", "您的提现奖金为0，不能提现", "error");
                        return false;
                    }
                    if (result.d[0] == "2") {
                        swal("OMG!", "您的提现奖金不足，不能提现", "error");
                        return false;
                    }
                    if (result.d[0] == "4") {
                        swal("OMG!", "没有当前会员记录", "error");
                        return false;
                    }
                    if (result.d[0] == "5") {
                        swal("GOOD!", "提现成功，请等待审核...", "success");
                        $("#txt_txjr").val('0');
                        $("#Label1").html('0');
                        return false;
                    }
                    if (result.d[0] == "6") {
                        swal("OMG!", "提现失败", "error");
                        return false;
                    }
                    if (result.d[0] == "10") {
                        swal("OMG!", "出现错误，请联系网站管理员", "error");
                        return false;
                    }
                },
                error: function () {
                    swal("OMG!", "出现错误,请刷新后重试", "error");
                }
            });
        });
    });
});