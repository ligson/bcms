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
    <title>资源列表</title>
    <jsp:include page="_header.jsp"/>
    <script type="text/javascript" src="../../js/admin/resourcemgr/myfilelist.js"></script>

</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>

<div data-options="region:'center',title:'资源库统计'" iconCls="icon-page_world">
    <div id="rGridTbr" style="height:60px;">
        <a class="easyui-linkbutton" iconCls="icon-disk_upload pull-left" style="margin-top:18px;">上传</a>
        <a class="easyui-linkbutton" iconCls="icon-disk_upload pull-left" style="margin-top:18px;">整理资源</a>
        <a class="easyui-linkbutton" iconCls="icon-remove pull-left" style="margin-top:18px;">删除</a>
        <ol class="breadcrumb pull-left" style="margin-top:12px;">
            <li><a href="#">我的文件</a></li>
            <li><a href="#">文件夹1</a></li>
            <li class="active">文档</li>
        </ol>
    </div>
    <table id="fileGrid" class="easyui-datagrid"
           data-options="rownumbers:true,singleSelect:true,url:'./myfilelist.json',method:'post'"
           toolbar="#rGridTbr" fit="true">
        <thead>
        </thead>
    </table>
</div>

</body>
</html>
