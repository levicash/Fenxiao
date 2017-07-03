function Operating(biaoming) {
    //单一删除
    $(".delete").on("click", function () {
        var href = window.location.href;
        var id = $(this).attr("pid");
        var query = "{id:" + id + ",biaoming:'" + biaoming + "'}";
        if (confirm("确定删除当前数据？")) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/BtnSingleDel",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        window.location.href = href;
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
}