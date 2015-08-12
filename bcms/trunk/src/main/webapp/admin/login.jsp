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
    <link href="../js/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="../css/admin-login.css"/>
    <script type="text/javascript" src="../js/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/admin/login.js"></script>
</head>
<body>
<div class="login-container">
    <h2 style="padding-bottom:5px;font-size:14px;font-weight:bold;padding-left:10px;border-bottom:1px solid gainsboro;">后台登陆</h2>
    <div>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
        </div>
        <div class="input-group" style="margin-top:10px;">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
        </div>
    </div>
    <div style="margin-top:10px;">
        <input class="btn btn-success" type="submit" value="登陆" style="float:right;margin-right:10px;">
    </div>
</div>
</body>
</html>
