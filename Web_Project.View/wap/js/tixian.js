$(document).ready(function () {
    $("#btn_back").click(function () {
        window.location.href = "TxList.aspx";
    });
    $("#txt_txjr").blur(function () {
        var index = layer.open({ type: 2, content: '加载中' });
        var trbi = $.trim($("#txt_txjr").val());
        var bili = $.trim($("#HiddenField1").val());
        var regemail = /^([1-9][0-9]*)+(.[0-9]{1,2})?$/;
        if (!regemail.test(trbi)) {
            layer.close(index);
            layer.open({ content: '提现金额只能输入数字或2位小数', skin: 'msg', time: 2 });
            return false;
        }
        $("#Label1").html('');
        $("#Label1").html((trbi * bili).toFixed(2));
        layer.close(index);
    });
    //点击提现
    $("#btn_tixian").click(function () {
        var index = layer.open({ type: 2, content: '加载中' });
        var trbi = $.trim($("#txt_txjr").val());
        var bili = $.trim($("#HiddenField1").val());
        var money = $.trim($("#Label1").html());
        var regemail = /^([1-9][0-9]*)+(.[0-9]{1,2})?$/;
        if (!regemail.test(trbi)) {
            layer.close(index);
            layer.open({ content: '提现金额只能输入数字或2位小数', skin: 'msg', time: 2 });
            return false;
        }

        var query = "{zzbi:" + trbi + ",bili:" + bili + ",money:" + money + "}";
        layer.open({
            content: '确认提现？'
    , btn: ['是的', '不要']
    , yes: function () {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/TiXianMethod",
            data: query,
            dataType: "json",
            success: function (result) {
                layer.close(index);
                if (result.d[0] == "1") {
                    layer.open({ content: '您的提现奖金为0，不能提现', skin: 'msg', time: 2 });
                    return false;
                }
                if (result.d[0] == "2") {
                    layer.open({ content: '您的提现奖金不足，不能提现', skin: 'msg', time: 2 });
                    return false;
                }
                if (result.d[0] == "4") {
                    layer.open({ content: '没有当前会员记录', skin: 'msg', time: 2 });
                    return false;
                }
                if (result.d[0] == "5") {
                    layer.open({ content: '提现成功，请等待审核...', skin: 'msg', time: 2 });
                    $("#txt_txjr").val('0');
                    $("#Label1").html('0');
                    return false;
                }
                if (result.d[0] == "6") {
                    layer.open({ content: '提现金额只能输入数字或2位小数', skin: 'msg', time: 2 });
                    return false;
                }
                if (result.d[0] == "10") {
                    layer.open({ content: '出现错误，请联系网站管理员', skin: 'msg', time: 2 });
                    return false;
                }
            },
            error: function () {
                layer.close(index);
                layer.open({ content: '出现错误,请刷新后重试', skin: 'msg', time: 2 });
            }
        });
    }
    , no: function () {
        layer.close(index);
    }
        });
    });
});