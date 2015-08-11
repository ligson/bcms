

$(function () {
     $("#btn_login").click(function () {
        var username=$("#login-username").val();
        var password = $("#login-password").val();
        $.post("/index/checkLogin", {url:"login/", username: username, password: password }, function (data) {
            if(data.success){
                location.href = "/user/index";
            }else{
                alert(data.msg);
            }
        });
    });
    
});

