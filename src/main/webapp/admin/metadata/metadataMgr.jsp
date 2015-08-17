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
    <jsp:include page="_header.jsp"/>
    <script src="../../js/admin/metadataMgr.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<div data-options="region:'west',split:true" title="元数据管理" style="width:150px;">
    <ul class="easyui-tree" data-options="url:'../../js/admin/test_metadata_tree.js'">

    </ul>
</div>
<div data-options="region:'center'">
    <div id="container">
        dsfdf
    </div>
</div>

</body>
</html>
