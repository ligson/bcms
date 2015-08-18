$(function () {
    $("#btn-login").click(function () {
        var username = $("#username").val();
        var password = $("#password").val();
        location.href = "/bcms/admin/usermgr/userMgr.jsp";
        $.post("/bcms/proxy", {method: "post", url: "login/", username: username, password: password}, function (data) {
            var result = jQuery.parseJSON(data);
            if (result.success) {

            } else {
                alert(result.msg);
            }
        });
    });
});

