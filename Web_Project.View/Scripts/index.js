$(document).ready(function () {
    //新闻切换
    $(".home_1 a").removeClass("se");
    $(".home_1 a").eq(0).addClass("se");
    $(".home_1 a").click(function () {
        $(".home_1 a").removeClass("se");
        $(this).addClass("se");
        $(".news").hide();
        $(".news").eq($(this).index()).fadeIn();
    });
    //产品楼层效果
    var length = $(".cont_pro_box").length;
    for (var i = 1; i <= length; i++) {
        $("#box" + i).find(".pb_2 a").removeClass("se2");
        $("#box" + i).find(".pb_2 a").eq(0).addClass("se2");
        $("#box" + i).find(".pro_cont").eq(0).show();
    }
    $(".cont_pro_box .pb_2 a").click(function () {
        var bxid = $(this).parent().parent().parent().attr("bxid");
        var erid = $(this).attr("erid");
        $("#box" + bxid).find(".pb_2 a").removeClass("se2");
        $(this).addClass("se2");
        $("#box" + bxid).find(".pro_cont").hide();
        $("#box" + bxid).find("#tdiv" + erid).show();
    });
});