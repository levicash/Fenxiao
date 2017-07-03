function showLocation(province, city, town) {
    var loc = new Location();
    var title = ['省份', '地级市', '市、县、区'];
    $.each(title, function (k, v) {
        title[k] = '<option value="">' + v + '</option>';
    });
    $('#loc_province').append(title[0]);
    $('#loc_city').append(title[1]);
    $('#loc_town').append(title[2]);
    $("#loc_province,#loc_city,#loc_town").select2();
    $('#loc_province').change(function () {
        $('#loc_city').empty();
        $('#loc_city').append(title[1]);
        loc.fillOption('loc_city', '0,' + $('#loc_province').val());
        $('#loc_city').change();
    });
    $('#loc_city').change(function () {
        $('#loc_town').empty();
        $('#loc_town').append(title[2]);
        loc.fillOption('loc_town', '0,' + $('#loc_province').val() + ',' + $('#loc_city').val());
    });
    $('#loc_town').change(function () {
        $('input[name=location_id]').val($(this).val());
    });
    if (province) {
        loc.fillOption('loc_province', '0', province);
        if (city) {
            loc.fillOption('loc_city', '0,' + province, city);
            if (town) {
                loc.fillOption('loc_town', '0,' + province + ',' + city, town);
            }
        }
    } else {
        loc.fillOption('loc_province', '0');
    }
}
$(document).ready(function () {
    showLocation(); //省市区三级联动
    $("body").showLoading();
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "StaticMethod.aspx/LUserInfoMethod",
        data: "",
        dataType: "json",
        success: function (result) {
            if (result.d) {
                $('#select2-chosen-1').html("" + result.d[1] + "");
                $('#select2-chosen-2').html("" + result.d[2] + "");
                $('#select2-chosen-3').html("" + result.d[3] + "");
                //隐藏窗口
                $("body").hideLoading();
            }
        }
    });
    //修改会员资料
    $("#btn_reg").click(function () {
        var pass = $.trim($("#reg_pass").val()); //密码
        var conpass = $.trim($("#reg_conpass").val()); //确认密码
        var name = $.trim($("#reg_name").val()); //姓名
        var province = $('#loc_province').select2('data').text; //省份
        var city = $('#loc_city').select2('data').text; //市级
        var area = $('#loc_town').select2('data').text; //区级
        var address = $.trim($("#reg_address").val()); //收货地址
        var kahao = $.trim($("#reg_kahao").val()); //银行卡卡号
        var kaihuhang = $.trim($("#reg_kaihuhang").val()); //开户行名称
        var kaihuren = $.trim($("#reg_kaihuren").val()); //开户人名称

        if (pass != "" && conpass == "") {
            alert("两次密码不一致，请验证");
            return false;
        }
        if (pass == "" && conpass != "") {
            alert("两次密码不一致，请验证");
            return false;
        }
        if (pass != "" && conpass != "" && pass != conpass) {
            alert("两次密码不一致，请验证");
            return false;
        }
        if (name == "") {
            alert("会员姓名不能为空，请验证");
            return false;
        }
        if (province == "省份" || city == "地级市" || area == "市、县、区") {
            alert("所属区域不能为空，请验证");
            return false;
        }
        $("body").showLoading();
        var query = "{rpass:'" + pass + "',uname:'" + name + "', province:'" + province + "', city:'" + city + "', county:'" + area + "', address:'" + address + "', kahao:'" + kahao + "', kaihuhang:'" + kaihuhang + "', kaihuren:'" + kaihuren + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/UpdateUserMethod",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d) {
                    alert("修改成功");
                    window.location.reload();
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
            }
        });
    });
});