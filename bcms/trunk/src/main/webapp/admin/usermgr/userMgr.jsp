<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <script src="../../js/admin/usermgr.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<div data-options="region:'west',split:true" title="系统菜单" style="width:150px;">
    <ul class="easyui-tree">
        <li iconCls="icon-user"><span><a>用户</a></span></li>
        <li><span>用户组</span></li>
        <li><span>角色</span></li>
        <li><span>权限</span></li>
    </ul>
</div>
<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
</div>

</body>
</html>
