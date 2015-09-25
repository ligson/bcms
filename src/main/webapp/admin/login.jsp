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
    <script type="text/javascript" src="../js/jquery-easyui-1.4.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/admin/login.js"></script>
</head>
<body>
<div class="login-container">
    <h2 style="padding-bottom:5px;font-size:14px;font-weight:bold;padding-left:10px;border-bottom:1px solid gainsboro;">
        后台登陆</h2>

    <div>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input id="username" type="text" class="form-control" placeholder="请输入用户名" aria-describedby="basic-addon1">
        </div>
        <div class="input-group" style="margin-top:10px;">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input id="password" type="password" class="form-control" placeholder="请输入密码"
                   aria-describedby="basic-addon1">
        </div>
    </div>
    <div style="margin-top:10px;">
        <input id="btn-login" class="btn btn-success" type="submit" value="登陆" style="float:right;margin-right:10px;">
    </div>
</div>
<div class="ui-mask-box">


    <div class="ui-mask-container">
        <h1>您的浏览器有点古董了,换个新的吧!</h1>

        <div class="ui-mask-list">
            <a href="http://chrome.360.cn/" title="360极速浏览器"><img src="../images/browser/360chrome.png"/></a>
            <a href="http://rj.baidu.com/soft/detail/14744.html?ald" title="谷歌chrome极速浏览器"><img
                    src="../images/browser/compatible_chrome.gif"/></a>
            <a href="http://www.firefox.com.cn/download/" title="火狐浏览器"><img src="../images/browser/compatible_firefox.gif"/></a>
            <a href="http://windows.microsoft.com/zh-cn/internet-explorer/ie-9-worldwide-languages"  title="IE9浏览器"><img
                    src="../images/browser/compatible_ie.gif"/></a>
        </div>
    </div>
</div>
</body>
</html>
