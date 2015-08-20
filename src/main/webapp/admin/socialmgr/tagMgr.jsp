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
    <title>标签管理</title>
    <jsp:include page="_header.jsp"/>
  <script src="../../js/admin/social/tagmgr.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<jsp:include page="_leftmenu.jsp"/>
<div region="center" style="overflow-y: hidden">
  <div class="easyui-layout" fit="true">
    <div region="west" title="标签树结构" style="width: 400px;">
      <div style="padding:5px;background:#fafafa;width:385px;border:1px solid #ccc">
        <a href="#" onclick="" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
        <a href="#" onclick="" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
        <a href="#" onclick="" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
        <br/>
        <input type="text">
      </div>
      <ul id="tag_tree" class="easyui-tree" data-options="url:'../../js/admin/social/tag_test_tree.json'">
      </ul>
    </div>
    <div region="center">
      <div id="role_auth_grid" fit="true">
      </div>
    </div>
  </div>
</div>

</body>
</html>
