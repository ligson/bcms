<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">

</style>
<div data-options="region:'west',split:true" title="系统菜单" style="width:200px;" id="treeMenu"
     iconCls="icon-application_side_boxes">
    <ul class="easyui-tree">
        <li iconCls="icon-user"><a href="./userMgr.jsp"><span>用户管理</span></a></li>
        <li iconCls="icon-zhuanti"><a href="./departmentMgr.jsp"><span>部门管理</span></a></li>
        <li iconCls="icon-user_home"><span><a href="./groupMgr.jsp">用户组管理</a></span></li>
        <li iconCls="icon-user_suit"><span><a href="./roleMgr.jsp">角色管理</a></span></li>
        <li iconCls="icon-table_key"><span><a href="./authMgr.jsp">权限管理</a></span></li>
    </ul>

</div>
