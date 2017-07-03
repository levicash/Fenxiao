$(document).ready(function () {
    String.prototype.trim = function () { return this.replace(/(^\s*)|(\s*$)/g, ""); }
    //获取cookies中存的验证码
    var re = new RegExp("(\;|^)[^;]*(" + "WEB-SANJIFENXIAO" + ")\=([^;]*)(;|$)");
    var res = re.exec(document.cookie);
    var cookies = res != null ? res[3] : null;
    if (cookies == null || cookies == '000000' || cookies == '') {
        $(".my-vip").hide();
    }
    else {
        $(".my-vip").show();
    }
    //退出
    $('#aquit').click(function () {
        layer.open({
            content: '您确定要退出当前账号吗？'
    , btn: ['是的', '不要']
    , yes: function (index) {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../StaticMethod.aspx/Aquit",
            success: function () {
                window.location.href = "Index.aspx";
            }
        });
    }
        });
    });
});