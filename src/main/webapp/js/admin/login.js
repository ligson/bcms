
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
                location.href = "/bcms/admin/usermgr/userMgr.jsp";
            }
        });
    });
});

