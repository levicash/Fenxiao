$(document).ready(function () {

    String.prototype.trim = function () { return this.replace(/(^\s*)|(\s*$)/g, ""); }
    //获取cookies中存的验证码
    var re = new RegExp("(\;|^)[^;]*(" + "WEB-SANJIFENXIAO" + ")\=([^;]*)(;|$)");
    var res = re.exec(document.cookie);
    var cookies = res != null ? res[3] : null;
    if (cookies == null || cookies == '000000' || cookies == '') {
        $(".denglu").html("<a href='Login.aspx' class='btn_log'>会员登录</a>");
    }
    else {
        var query = "{LoginName:'" + cookies + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/isExist",
            data: query,
            dataType: 'json',
            success: function (result) {
                if (result.d[0] == "1") {
                    $(".denglu").html("<a href='Member.aspx'>" + cookies + "</a>");
                }
            }
        });
    }
});