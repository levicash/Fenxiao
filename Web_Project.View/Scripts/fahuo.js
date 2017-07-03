$(document).ready(function () {
    //窗口水平居中
    $(window).resize(function () {
        tc_center();
    });
    function tc_center() {
        var _top = ($(window).height() - $(".popup").height()) / 2;
        var _left = ($(window).width() - $(".popup").width()) / 2;

        $(".popup").css({ top: _top, left: _left });
    }
    //点击发货
    $(".fahuo").on("click", function () {
        $("#Hidden1").val('');
        $("#Hidden2").val('');
        $("#Hidden3").val('');
        $("#name").val('');
        $("#pass").val('');
        var jhid = $.trim($(this).attr("jhid"));
        var uname = $.trim($(this).attr("uname"));
        var zprice = $.trim($(this).attr("zprice"));
        $("#Hidden1").val(jhid);
        $("#Hidden2").val(uname);
        $("#Hidden3").val(zprice);
        //窗口效果
        $("#gray").show();
        $("#popup").show(); //查找ID为popup的DIV show()显示#gray
        tc_center();
    });

    $(".btn_queding").click(function () {
        var href = window.location.href;
        var jhid = $("#Hidden1").val();
        var uname = $("#Hidden2").val();
        var zprice = $("#Hidden3").val();
        var danhao = $("#name").val();
        var gongsi = $("#pass").val();
        if (danhao == "") {
            swal("OMG!", "请输入快递单号", "error");
            return false;
        }
        if (gongsi == "") {
            swal("OMG!", "请输入快递公司", "error");
            return false;
        }

        var query = "{jhid:" + jhid + ",uname:'" + uname + "',zprice:'" + zprice + "',danhao:'" + danhao + "',gongsi:'" + gongsi + "'}";

        swal({
            title: "确认发货？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "确认",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/IsFaHuoMethod",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d[0] == "1") {
                        window.location.href = href;
                    }
                    if (result.d[0] == "2") {
                        swal("OMG!", "发货失败，请刷新重试", "error");
                    }
                    if (result.d[0] == "3") {
                        swal("OMG!", "出现错误,请联系网站管理员", "error");
                    }
                },
                error: function () {
                    swal("OMG!", "出现错误,请联系网站管理员", "error");
                }
            });
        });
    });

    //点击关闭按钮
    $("a.guanbi").click(function () {
        $("#gray").hide();
        $("#popup").hide(); //查找ID为popup的DIV hide()隐藏
    });
    $(".top_nav").mousedown(function (e) {
        $(this).css("cursor", "move"); //改变鼠标指针的形状 
        var offset = $(this).offset(); //DIV在页面的位置 
        var x = e.pageX - offset.left; //获得鼠标指针离DIV元素左边界的距离 
        var y = e.pageY - offset.top; //获得鼠标指针离DIV元素上边界的距离 
        $(document).bind("mousemove", function (ev) { //绑定鼠标的移动事件，因为光标在DIV元素外面也要有效果，所以要用doucment的事件，而不用DIV元素的事件 

            $(".popup").stop(); //加上这个之后 

            var _x = ev.pageX - x; //获得X轴方向移动的值 
            var _y = ev.pageY - y; //获得Y轴方向移动的值 

            $(".popup").animate({ left: _x + "px", top: _y + "px" }, 10);
        });
    });
    $(document).mouseup(function () {
        $(".popup").css("cursor", "default");
        $(this).unbind("mousemove");
    });
});