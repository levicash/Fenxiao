$(document).ready(function () {
    //登录
    $(".aui-login-l a").click(function () {
        var txtName = $.trim($("#txtLoginName").val());
        var txtPwd = $.trim($("#txtLoginPwd").val());
        if ($.trim($("#txtLoginName").val()) == "") {
            layer.open({ content: '用户名不能为空', skin: 'msg', time: 2 }); //2秒后自动关闭
            return false;
        }
        if ($.trim($("#txtLoginPwd").val()) == "") {
            layer.open({ content: '密码不能为空', skin: 'msg', time: 2 }); //2秒后自动关闭
            return false;
        }
        var index = layer.open({ type: 2, content: '加载中' });
        var query = "{lname:'" + txtName + "',lpwd:'" + txtPwd + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/isLogin",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d[0] == "1") {
                    window.location.href = "Member.aspx";
                }
                if (result.d[0] == "2") {
                    layer.close(index);
                    layer.open({ content: '密码不正确，请验证', skin: 'msg', time: 2 });
                }
                if (result.d[0] == "3") {
                    layer.close(index);
                    layer.open({ content: '该账号不存在，请验证', skin: 'msg', time: 2 });
                }
                if (result.d[0] == "4") {
                    layer.close(index);
                    layer.open({ content: '该账号还未激活，登录失败', skin: 'msg', time: 2 });
                }
            },
            error: function () {
                layer.open({ content: '出现错误,请联系网站管理员', skin: 'msg', time: 2 });
            }
        });
    });
});