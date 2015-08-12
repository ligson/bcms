<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/11
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登陆</title>
  <link href="../js/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />
  <script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
  <script type="text/javascript" src="../js/admin/login.js"></script>
  <style>
    .login_box{
      margin-top:50px;
    }
    .panel-pad{
      padding-top:30px;
    }
    .margT25{
      margin-bottom: 25px;
    }
    .margT10{
      margin-top:10px;
    }

  </style>
</head>
<body>
<div class="container">
  <div class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2 login_box">
    <div class="panel panel-info" >
      <div class="panel-heading">
        <div class="panel-title"> 用户登陆 </div>
      </div>
      <div class="panel-body panel-pad">
        <p class="center-block bg-danger" style="height: 40px;" id="return_message"></p>
        <form id="loginform" class="form-horizontal" role="form">

          <div class="input-group margT25">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
            <input id="login-username" type="text" class="form-control input-lg" name="username" value="" placeholder="请输入用户名">
          </div>
          <div class="input-group margT25">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input id="login-password" type="password" class="form-control input-lg" name="password" placeholder="请输入密码">
          </div>
          <div class="input-group">
            <div class="checkbox">
              <label>
                <input id="login-remember" type="checkbox" name="remember" value="1"> 记住我
              </label>
            </div>
          </div>
          <div class="form-group margT10">
            <div class="col-sm-12 controls">
              <a id="btn-login" href="#" class="btn btn-lg btn-block btn-success">立即登录 </a>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>
