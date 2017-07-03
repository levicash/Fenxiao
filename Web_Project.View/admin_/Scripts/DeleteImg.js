function DeleteImg(biaoming) {
    $("#btn_delete").click(function () {
        var query = "{biaoming:'" + biaoming + "'}";
        if (confirm("确定删除图片？")) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../StaticMethod/Info.aspx/DeleteAboutImg",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d[0] == "1") {
                        location.reload();
                    }
                    if (result.d[0] == "2") {
                        alert("当前没有图片");
                    }
                },
                error: function () {
                    alert("出现错误,请刷新后重试");
                }
            });
        }
    });
}