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
    <title>数据统计</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <link type="text/css" href="../../js/Highcharts-4.1.7/js/themes/dark-blue.js" rel="stylesheet">
    <script type="text/javascript" src="../../js/Highcharts-4.1.7/js/highcharts.js"></script>
    <script src="../../js/admin/datacount.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<div data-options="region:'west',split:true" title="系统菜单" style="width:150px;">
    <div class="easyui-accordion" style="width:100%;height:180px;">
        <div title="资源统计" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><span><a href="#">点播统计</a></span></li>
                <li><span><a href="#">下载统计</a></span></li>
                <li><span><a href="#">资源量统计</a></span></li>
            </ul>
        </div>
        <div title="用户统计" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><span><a href="#">点播统计</a></span></li>
                <li><span><a href="#">下载统计</a></span></li>
                <li><span><a href="#">资源量统计</a></span></li>
            </ul>
        </div>
    </div>
</div>
<div data-options="region:'center',title:'点播统计'">
    <div id="container"></div>
</div>

</body>
</html>
