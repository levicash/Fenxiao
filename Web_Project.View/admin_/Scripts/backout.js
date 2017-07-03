
$(document).ready(function () {
    //退出
    $('#backout').click(function () {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "login.aspx/Aquit",
            success: function () {
                $("body").showLoading();
                window.location = "login.aspx";
            }
        });
        return false;
    });
});