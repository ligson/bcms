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
    <title>课程管理</title>
    <jsp:include page="_header.jsp"/>
    <script type="text/javascript" src="../../js/admin/casemgr.js"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div id="rGridTbr" style="height:30px;line-height:30px;">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true"
       iconCls="icon-add"
       title="添加">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-ok"
       title="审核">审核</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-remove"
       title="删除">删除</a>|<label>名称:<input type="text" class="easyui-textbox" name="name"/></label>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-search"
       title="搜索"></a>
</div>
<div data-options="region:'center',title:'课程管理'" iconCls="icon-page_world">
    <div id="container">
        <table id="rGrid" class="easyui-datagrid"
               data-options="rownumbers:true,singleSelect:true,url:'./caseliblist.json',method:'post'" pagination="true"
               toolbar="#rGridTbr">
            <thead>
            </thead>
        </table>
    </div>
</div>

</body>
</html>
