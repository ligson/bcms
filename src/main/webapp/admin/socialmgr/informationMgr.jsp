<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资讯管理</title>
  <jsp:include page="_header.jsp"/>
  <script src="../../js/admin/social/informationmgr.js" type="text/javascript"></script>
  <script src="//cdn.ckeditor.com/4.5.3/standard/ckeditor.js"></script>
  <style type="text/css">
    #add_information_form #modify_information_form
    {
      margin: 0;
      padding: 10px 30px;
    }
    .ftitle
    {
      font-size: 14px;
      font-weight: bold;
      padding: 5px 0;
      margin-bottom: 10px;
      border-bottom: 1px solid #ccc;
    }
    .fitem
    {
      margin-bottom: 5px;
    }
    .fitem label
    {
      display: inline-block;
      width: 80px;
    }
  </style>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'资讯管理'">
  <div id="container">
    <table id="information_table"></table>
  </div>
</div>


</body>
</html>
