$(document).ready(function () {
    function enter() {
        var event = arguments.callee.caller.arguments[0] || window.event; //消除浏览器差异  
        if (event.keyCode == 13) {
            return true;
        }
        return false;
    }
    $(document).keydown(function () {
        if (enter()) {
            $("#btn_login").click();
        }
    });
    $("#btn_login").click(function () {
        var uid = $.trim($("#txtUserName").val());
        if (uid == "") {
            alert('请填写用户名！');
            return false;
        }
        var pwd = $.trim($("#txtPassword").val());
        if (pwd == "") {
            alert('请填写密码！');
            return false;
        }
        var code = $.trim($("#txtCode").val());
        if (code == "") {
            alert('请填写验证码！');
            return false;
        }
        var re = new RegExp("(\;|^)[^;]*(" + "CheckCode" + ")\=([^;]*)(;|$)");
        var res = re.exec(document.cookie);
        var cookies = res != null ? res[3] : null;
        if (code != cookies) {
            alert('验证码不正确！');
            $("#CheckCodeImg").click();
            return false;
        }
        var query = "{userName:'" + uid + "',userPwd:'" + pwd + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "login.aspx/AdminUserLogin",
            data: query,
            dataType: "json",
            success: function (result) {
                $("body").showLoading();
                if (result.d[0] == "1") {
                    window.location.href = "Index.aspx";
                }
                if (result.d[0] == "2") {
                    alert("密码不正确");
                    $("body").hideLoading();
                }
                if (result.d[0] == "3") {
                    alert("用户名不存在");
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