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
    <script type="text/javascript" src="../../js/admin/resourcemgr/filelist.js"></script>

</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>

<div data-options="region:'center',title:'资源库统计'" iconCls="icon-page_world">
    <div id="container">
        <table id="fileGrid" class="easyui-datagrid"
               data-options="rownumbers:true,singleSelect:true,url:'./filelist.json',method:'post'"
               pagination="true" toolbar="#rGridTbr">
            <thead>
            </thead>
        </table>
    </div>
</div>

</body>
</html>
