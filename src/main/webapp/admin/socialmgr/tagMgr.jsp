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
<div region="center">
      <div style="padding:5px;background:#fafafa;border:1px solid #ccc">
        <input id="search_tag" style="width: 300px;align-items: center; display: none;">
      </div>
      <ul id="tag_tree" class="easyui-tree" data-options="url:'../../js/admin/social/tag_test_tree.json'">
      </ul>
      <div style="padding-:5px;background:#fafafa;border:1px solid #ccc">
        <a href="#" onclick="" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
        <a href="#" onclick="" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加下级标签</a>
        <a href="#" onclick="" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
        <a href="#" onclick="" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
</div>

</div>

</body>
</html>
