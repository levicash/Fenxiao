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
    //获取cookies中存的登录账号
    var re = new RegExp("(\;|^)[^;]*(" + "WEB-SANJIFENXIAO" + ")\=([^;]*)(;|$)");
    var res = re.exec(document.cookie);
    var cookies = res != null ? res[3] : null;
    if (cookies != null || cookies != '000000' || cookies != '') {
        $("#reg_tuijian").val(cookies);
    }
    $("#reg_uname").blur(function () {
        var uname = $.trim($("#reg_uname").val()); //用户名
        if (uname == "") {
            swal("OMG!", "请输入用户名", "error");
            return false;
        }
        var query = "{LoginName:'" + uname + "'}";
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "StaticMethod.aspx/isExist",
            data: query,
            dataType: "json",
            success: function (result) {
                if (result.d[0] == "1") {
                    $(".sp1").html('');
                    $(".sp1").html('*&nbsp;此帐号已被注册');
                    return false;
                }
                if (result.d[0] == "2") {
                    $(".sp1").html('');
                    $(".sp1").html('*&nbsp;此帐号可以注册');
                    return false;
                }
            },
            error: function () {
                swal("OMG!", "出现错误,请刷新后重试", "error");
            }
        });
    });
    //注册
    $("#btn_reg").click(function () {
        //swal("GOOD!", "注册成功,请等待激活", "success");
        //window.location.reload();

        //return false;
        var uname = $.trim($("#reg_uname").val()); //手机号码
        var pass = $.trim($("#reg_pass").val()); //密码
        var conpass = $.trim($("#reg_conpass").val()); //确认密码
//        var pass1 = $.trim($("#reg_pass1").val()); //二级密码
//        var conpass1 = $.trim($("#reg_conpass1").val()); //确认二级密码
        var name = $.trim($("#reg_name").val()); //姓名
        var shenfenzheng = $.trim($("#reg_shenfenzheng").val()); //身份证
        var tuijianren = $.trim($("#reg_tuijian").val()); //推荐人姓名
        var province = $('#loc_province').select2('data').text; //省份
        var city = $('#loc_city').select2('data').text; //市级
        var area = $('#loc_town').select2('data').text; //区级
        var address = $.trim($("#reg_address").val()); //收货地址
        var kahao = $.trim($("#reg_kahao").val()); //银行卡卡号
        var kaihuhang = $.trim($("#reg_kaihuhang").val()); //开户行名称
        var kaihuren = $.trim($("#reg_kaihuren").val()); //开户人名称
        if (uname == "") {
            swal("OMG!", "登录帐号不能为空，请验证", "error");
            return false;
        }
        if (pass == "") {
            swal("OMG!", "登录密码不能为空，请验证", "error");
            return false;
        }
        if (conpass != pass) {
            swal("OMG!", "两次密码不一致，请验证", "error");
            return false;
        }
//        if (pass1 == "") {
//            swal("OMG!", "二级密码不能为空，请验证", "error");
//            return false;
//        }
//        if (conpass1 != pass1) {
//            swal("OMG!", "两次二级密码不一致，请验证", "error");
//            return false;
//        }
        if (tuijianren == "") {
            swal("OMG!", "推荐人不能为空，请验证", "error");
            return false;
        }
        if (name == "") {
            swal("OMG!", "会员姓名不能为空，请验证", "error");
            return false;
        }
        if (shenfenzheng == "") {
            swal("OMG!", "身份证号不能为空，请验证", "error");
            return false;
        }
        if (province == "省份" || city == "地级市" || area == "市、县、区") {
            swal("OMG!", "所属区域不能为空，请验证", "error");
            return false;
        }
        var query = "{rname:'" + uname + "',rpass:'" + pass + "', tuijianren:'" + tuijianren + "', uname:'" + name + "', card:'" + shenfenzheng + "', province:'" + province + "', city:'" + city + "', county:'" + area + "', address:'" + address + "', kahao:'" + kahao + "', kaihuhang:'" + kaihuhang + "', kaihuren:'" + kaihuren + "'}";

        swal({
            title: "确定注册当前会员？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "确认",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: "StaticMethod.aspx/RegisterMethod",
                data: query,
                dataType: "json",
                success: function (result) {
                    if (result.d[0] == "2") {
                        swal("GOOD!", "注册成功,请等待激活", "success");
                        return false;
                    }
                    if (result.d[0] == "7") {
                        swal("OMG!", "此推荐人不存在，注册失败", "error");
                        return false;
                    }
                    if (result.d[0] == "3") {
                        swal("OMG!", "注册失败，请刷新后重试", "error");
                        return false;
                    }
                    if (result.d[0] == "5") {
                        swal("OMG!", "此帐号已被注册", "error");
                        return false;
                    }
                },
                error: function () {
                    swal("OMG!", "出现错误,请刷新后重试", "error");
                }
            });
        });
    });
});