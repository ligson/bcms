<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评分管理</title>
  <jsp:include page="_header.jsp"/>
  <script src="../../js/admin/social/scoremgr.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'评分管理'">
  <div id="container">
    <table id="score_table"></table>
  </div>
</div>
</body>
</html>
