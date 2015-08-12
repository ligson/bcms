

$(function () {
     $("#btn-login").click(function () {
        var username=$("#login-username").val();
        var password = $("#login-password").val();
         $("#return_message").text("干你妈逼");
        $.post("/index/checkLogin", {url:"login/", username: username, password: password }, function (data) {
            if(data.success){
                location.href = "/user/index";
            }else{
                $("#return_message").text("干你妈逼");
            }
        });
    });
    
});

