$(document).ready(function () {
    //刷新时，根据存入Session的页面链接地址，跳转
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "StaticMethod/Info.aspx/GetSessionPage",
        data: '',
        dataType: "json",
        success: function (result) {
            if (result.d) {
                $("#rightMain").removeProp("src");
                $("#rightMain").prop("src", "" + result.d + "");
            }
        },
        error: function () {
            alert('出现错误,请刷新后重试!');
        }
    });
    //点击左侧，提取当前位置
    $(".sideMenu ul li a").click(function () {
        $(".placeul").html('');
        $(".placeul").append("<li><a href='right.aspx' target='rightMain'>首页</a></li>");
        var lid = $(this).attr("lid"); //当前参数
        var query = "{lid:" + lid + "}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod/Info.aspx/GetLocation",
            data: query,
            dataType: "json",
            success: function (result) {
                var loval = "<li>" + result.d[0] + "</li><li>" + result.d[1] + "</li>";
                $(".placeul").append(loval);
            },
            error: function () {
                alert('出现错误,请刷新后重试!');
            }
        });
    });
});