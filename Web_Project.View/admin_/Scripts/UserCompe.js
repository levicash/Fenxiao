function Operating(biaoming) {
    //全选
    $("#checkAll").click(function () {
        $("input[name=checkbox]").each(function () {
            $(this).prop("checked", "checked");
        });
    });
    //反选
    $("#checkAllBack").click(function () {
        $("input[name=checkbox]").each(function () {
            $(this).removeProp("checked");
        });
    });
    //删除全部
    $("#BtnDeleteAll").click(function () {
        $("#hidTopId").val('');
        $("input[name=checkbox]").each(function () {
            if ($(this).prop("checked")) {
                $("#hidTopId").val($("#hidTopId").val() + $(this).attr("id") + ",");
            }
        });
        if ($("#hidTopId").val() == "") {
            alert("还没有选择项！请先选择......");
            return false;
        }
        var query = "{HiTopId:'" + $("#hidTopId").val() + "'}";
        if (confirm("删除一级权限，也会删除对应的二级权限，是否删除？")) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../ManagesUser/UserCompe.aspx/BtnDeleteAll",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        window.location = "../ManagesUser/UserCompe.aspx";
                    }
                },
                error: function () {
                    alert('出现错误,请刷新后重试!');
                }
            });
        }
    });
    //单一删除第一级权限
    $("#DiYiSingleDel").on("click", function () {
        var compyiid = $(this).attr("compyiid");
        var query = "{compyiid:" + compyiid + "}";
        if (confirm("删除一级权限，也会删除对应的二级权限，是否删除？")) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../ManagesUser/UserCompe.aspx/BtnDiYiSingleDel",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        window.location = "../ManagesUser/UserCompe.aspx";
                    }
                    else {
                        alert("删除失败");
                    }
                },
                error: function () {
                    alert('出现错误,请刷新后重试!');
                }
            });
        }
    });
    //单一删除第二级权限
    $(".rightinfo").on("click", "#DiErSingleDel", function () {
        var comperid = $(this).attr("comperid");
        var query = "{comperid:" + comperid + "}";
        if (confirm("确定删除当前二级权限？")) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../ManagesUser/UserCompe.aspx/BtnDiErSingleDel",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        window.location = "../ManagesUser/UserCompe.aspx";
                    }
                    else {
                        alert("删除失败");
                    }
                },
                error: function () {
                    alert('出现错误,请刷新后重试!');
                }
            });
        }
    });
    //修改顺序
    $("#BtnUpOrder").click(function () {
        var hre = window.location.href;
        var len = $(".inp_order").length;
        var quanbu = "";
        if (len > 0) {
            $("body").showLoading();
            for (var i = 0; i < len; i++) {
                var id = $(".inp_order").eq([i]).attr("id");
                var val = $(".inp_order").eq([i]).attr("val");
                var order = $(".inp_order").eq([i]).val();
                //验证顺序是否是正整数
                var rec = /^[0-9]*[1-9][0-9]*$/;
                if (!rec.test(order)) {
                    alert('顺序请输入正整数');
                    $("body").hideLoading();
                    $(".inp_order").eq([i]).val('');
                    $(".inp_order").eq([i]).val(val);
                    return false;
                }
                quanbu += id + "." + order + "|";
            }
            var query = "{quanbu:'" + quanbu + "',biaoming:'" + biaoming + "'}";
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../StaticMethod/Info.aspx/UpdateOrders",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        alert("修改成功");
                        location.href = hre;
                    }
                    else {
                        alert("修改失败");
                        $("body").hideLoading();
                        return false;
                    }
                },
                error: function () {
                    alert("出现错误,请刷新后重试");
                    $("body").hideLoading();
                    return false;
                }
            });
        }
    });
}