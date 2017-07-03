function Operating(biaoming) {
    //单一删除
    $(".rightinfo").on("click", "#SingleDel", function () {
        var id = $(this).attr("pid");
        var oid = $(this).attr("oid");
        var query = "{id:" + id + ",biaoming:'" + biaoming + "',oid:'" + oid + "'}";
        if (confirm("确定删除当前数据？")) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../StaticMethod/Info.aspx/BtnDiErSingleDelOrder",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        $(".tr" + id).remove();
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