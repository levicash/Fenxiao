$(document).ready(function () {
    //登录
    $("#btn_login").click(function () {
        var txtName = $.trim($("#txtLoginName").val());
        var txtPwd = $.trim($("#txtLoginPwd").val());
        if ($.trim($("#txtLoginName").val()) == "") {
            swal("OMG!", "用户名不能为空，请验证", "error");
            return false;
        }
        if ($.trim($("#txtLoginPwd").val()) == "") {
            swal("OMG!", "密码不能为空，请验证", "error");
            return false;
        }
        var query = "{lname:'" + txtName + "',lpwd:'" + txtPwd + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/isLogin",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d[0] == "1") {
                    window.location.href = result.d[1];
                }
                if (result.d[0] == "2") {
                    swal("OMG!", "密码不正确，请验证", "error");
                }
                if (result.d[0] == "3") {
                    swal("OMG!", "该账号不存在，请验证", "error");
                }
                if (result.d[0] == "4") {
                    swal("OMG!", "该账号还未激活，登录失败", "error");
                }
            },
            error: function () {
                alert("出现错误,请刷新后重试");
            }
        });
    });
});