$(document).ready(function () {
    $('.zhuan_6 a').click(function () {
        var zijin = $.trim($("#txt_jine").val()); //转账资金

        var regzj = /^[0-9]*[1-9][0-9]*$/;
        if (!regzj.test(zijin)) {
            layer.msg('充值金额为正整数，请验证');
            return false;
        }
        layer.load(0, { shade: [0.1, '#000'] });
        var query = "{money:" + zijin + "}";
        layer.confirm('确定申请充值？', { title: '提示信息',
            btn: ['确定', '取消'] //按钮
        }, function () {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/AddChongZhiMehod",
                data: query,
                dataType: "json",
                success: function (result) {
                    layer.closeAll('loading');
                    if (result.d[0] == "1") {
                        $("#txt_jine").val('0');
                        layer.msg('申请成功，等待审核', { icon: 1 });
                    }
                    if (result.d[0] == "2") {
                        layer.msg('申请失败，请刷新重试', { icon: 2 });
                    }
                },
                error: function () {
                    layer.closeAll('loading');
                }
            });
        }, function () {
            layer.closeAll('loading');
        });
    });
});