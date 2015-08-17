

$(function () {
     $("#btn-login").click(function () {
        var username=$("#username").val();
        var password = $("#password").val();
        $.post("/bcms/proxy", {method:"post",url:"login/", username: username, password: password }, function (data) {
            var result = jQuery.parseJSON(data);
            if(result.success){
                location.href = "/bcms/admin/usermgr/userMgr.jsp";
            }else{
                alert(result.msg);
            }
        });
    });
});

