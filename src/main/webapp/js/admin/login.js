
$(function () {
    if (typeof(Worker) == "undefined") {
        $(".login-container").hide();
        $(".ui-mask-box").show();
    }

    $("#btn-login").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        $.post("/bcms/proxy", {method: "post", url: "login/", username: username, password: password}, function (result) {
            var obj=jQuery.parseJSON(result);
            if (obj.success==false) {
                alert(obj.msg);
            } else {
                $.post("/bcms/proxy", {method: "get", url: "login/user"}, function (result) {
                    var obj=jQuery.parseJSON(result);
                    if (obj.success==false) {
                        alert(obj.msg);
                    }else{
                        $.cookie("bcms_user_id", obj.id,{path:'/'});
                        $.cookie("bcms_user_name", obj.username,{path:'/'});
                        location.href = "/bcms/admin/usermgr/userMgr.jsp";
                    }
                });
            }
        });
    });
});

