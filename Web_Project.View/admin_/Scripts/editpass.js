$(document).ready(function () {
    $("#edit_pwd").click(function () {
        var re = new RegExp("(\;|^)[^;]*(" + "WEB-ADMIN" + ")\=([^;]*)(;|$)");
        var res = re.exec(document.cookie);
        var cookies = res != null ? res[3] : null;
        if (cookies == null || cookies == '000000' || cookies == '') {
            alert('登录超时，请重新登录！');
            return false;
        }
        var txtPwd = $.trim($("#txtPwd").val());
        if (txtPwd == "") {
            alert('新密码不能为空！');
            return false;
        }
        var txtTwicePwd = $.trim($("#txtTwicePwd").val());
        if (txtPwd != txtTwicePwd || txtPwd == "") {
            alert('两次密码不一致！');
            return false;
        }
        var query = "{pwd:'" + txtPwd + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "editpwd.aspx/EditPwd",
            data: query,
            dataType: "json",
            success: function (result) {
                $("body").showLoading();
                if (result.d) {
                    alert("修改成功");
                    $("#txtPwd").val('');
                    $("#txtTwicePwd").val('');
                    $("body").hideLoading();
                }
                else {
                    alert("修改失败");
                    $("body").hideLoading();
                }
            },
            error: function () {
                alert("出现错误,请刷新后重试");
            }
        });
    });
    //验证码生成
    $("#CheckCodeImg").click(function () {
        //生成随机数
        var n = Math.random();
        $("#CheckCodeImg").attr("src", "Code.ashx?id=" + n);
        return false;
    });
});