$(document).ready(function () {
    String.prototype.trim = function () { return this.replace(/(^\s*)|(\s*$)/g, ""); }

    $('.leftCheck').on('click', function () {
        if ($(this).prop('checked')) {
            $("#div" + $(this).val() + " input").removeProp("disabled");
            $("#div" + $(this).val() + " input").prop("checked", "checked");
        } else {
            $("#div" + $(this).val() + " input").prop("disabled", "disabled");
            $("#div" + $(this).val() + " input").prop("checked", false);
        }
    });
    //保存
    $('#btn_save').on('click', function () {
        //获取所选权限
        var linkstryi = "";
        $("[name='linkcheckboxYi']").each(function () {
            if ($(this).prop("checked")) {
                linkstryi += $(this).val() + ',';
            }
        });
        var linkstrer = "";
        $("[name='linkcheckboxEr']").each(function () {
            if ($(this).prop("checked")) {
                linkstrer += $(this).val() + ',';
            }
        });
        var loginid = getQueryString("logid");
        var query = "{loginid:" + loginid + ",fid:'" + linkstryi + "',sid:'" + linkstrer + "'}";
        if (confirm("确定修改吗？")) {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "../ManagesUser/UserCompeEdit.aspx/UpdateUserCompetence",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d) {
                        alert("修改成功");
                        top.window.location.reload();
                    }
                    else {
                        alert("添加失败");
                    }
                },
                error: function () {
                    alert('出现错误,请刷新后重试!');
                }
            });
        }
        else { }
    });
    //返回
    $('#btn_back').on('click', function () {
        window.location.href = "../ManagesUser/UserList.aspx";
    });
    //jQuery获取URL的参数的方法
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = location.search.substr(1).match(reg);
        if (r != null) return unescape(decodeURI(r[2])); return null;
    }
    //加载管理员信息
    function PageLoad() {
        //        var loginid = cookName.substring(cookName.lastIndexOf('=') + 1); //登录用户ID
        var loginid = getQueryString("logid");
        var query = "{loginid:" + loginid + "}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "../ManagesUser/UserCompeEdit.aspx/GetLink",
            data: query,
            dataType: "json",
            success: function (result) {
                var array = new Array();
                var strlink = result.d.substring(0, result.d.lastIndexOf(','));
                array = strlink.split(',');
                for (var i = 0; i < array.length; i++) {
                    $('#check' + array[i]).attr('checked', true);
                    $("#div" + array[i] + " input").removeAttr("disabled");
                }
            },
            error: function () {
                alert('出现错误,请刷新后重试!');
            }
        });
    }
    PageLoad();
});