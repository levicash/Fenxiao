$(document).ready(function () {

    String.prototype.trim = function () { return this.replace(/(^\s*)|(\s*$)/g, ""); }
    //获取cookies中存的验证码
    var re = new RegExp("(\;|^)[^;]*(" + "WEB-SANJIFENXIAO" + ")\=([^;]*)(;|$)");
    var res = re.exec(document.cookie);
    var cookies = res != null ? res[3] : null;
    if (cookies == null || cookies == '000000' || cookies == '') {
        $(".juzhong").eq(0).show();
        $(".juzhong").eq(1).hide();
    }
    else {
        $(".juzhong").hide();
        var query = "{LoginName:'" + cookies + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/isExist",
            data: query,
            dataType: 'json',
            success: function (result) {
                if (result.d[0] == "1") {
                    $(".juzhong").eq(0).hide();
                    $(".juzhong").eq(1).show();
                    $(".juzhong").eq(1).find(".dt1").html(cookies);
                }
                else {
                    $(".juzhong").eq(0).show();
                    $(".juzhong").eq(1).hide();
                }
            }
        });
    }
    //网站顶部购物车，判断是否登录
    $("#myCart").click(function() {
        //获取cookies中存的验证码
        var re = new RegExp("(\;|^)[^;]*(" + "WEB-SANJIFENXIAO" + ")\=([^;]*)(;|$)");
    var res = re.exec(document.cookie);
    var cookies = res != null ? res[3] : null;
        if (cookies == null || cookies == '000000' || cookies == '') {
            alert("您当前还未登录！");
            return false;
        } else {
            window.location.href = "ShopCart.aspx";
        }
    });
    //记录当前页面
    $(".btn_log").click(function () {
        var moren = window.location.pathname;
        var query = "{url:'" + moren + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/LoginClick",
            data: query,
            dataType: "json"
        });
    });
    //退出
    $('#aquit').click(function () {
        if (confirm('确认退出？')) {
            $(".juzhong").eq(0).show();
            $(".juzhong").eq(1).hide();
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/Aquit",
                success: function () {
                    window.location.href = "Index.aspx";
                }
            });
            return false;
        }
    });
});