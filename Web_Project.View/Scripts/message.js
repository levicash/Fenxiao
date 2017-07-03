$(document).ready(function () {
    $("#mes_tijiao").click(function () {
        var tit = $.trim($("#mes_tit").val());
        var content = $.trim($("#mes_textarea").val());
        var name = $.trim($("#mes_name").val());
        var phone = $.trim($("#mes_tel").val());
        var code = $.trim($("#mes_code").val());

        if (tit == "") {
            alert("请输入你的问题！");
            return false;
        }
        if (content == "") {
            alert("请输入留言内容！");
            return false;
        }
        if (name == "") {
            alert("请输入你的姓名！");
            return false;
        }
        if (phone == "") {
            alert("请输入联系电话！");
            return false;
        }
        if (code == "") {
            alert("请输入验证码！");
            return false;
        }
        
        if (code != cookies) {
            alert('验证码不正确！');
            $("#CheckCodeImg").click();
            return false;
        }
       
        var query = "{tit:'" + tit + "',content:'" + content + "',name:'" + name + "',phone:'" + phone + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "Message.aspx/MessageMethod",
            data: query,
            dataType: "json",
            success: function (result) {
                $("body").showLoading();
                if (result.d) {
                    alert("留言成功！");
                    $("body").hideLoading();
                    $("#mes_tit").val('');
                    $("#mes_textarea").val('');
                    $("#mes_name").val('');
                    $("#mes_tel").val('');
                    $("#mes_code").val('');
                }
                else {
                    alert("留言失败，请刷新后重试！");
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
        $("#CheckCodeImg").attr("src", "admin_/Code.ashx?id=" + n);
        return false;
    });
});