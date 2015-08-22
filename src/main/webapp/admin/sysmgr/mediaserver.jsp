<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>流媒体服务</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'流媒体服务'" iconCls="icon-control_equalizer_blue">
    <div id="container">
        <iframe style="width: 100%;height: 100%;" src="http://42.62.105.18:8088/enginemanager/Home.htm#home/_defaultVHost_"></iframe>
    </div>
</div>
</body>
</html>
