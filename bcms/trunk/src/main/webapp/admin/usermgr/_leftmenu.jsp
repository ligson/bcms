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
<div data-options="region:'west',split:true" title="系统菜单" style="width:150px;" id="treeMenu"
     iconCls="icon-application_side_boxes">
    <ul class="easyui-tree">
        <li><a href="./userMgr.jsp"><span>用户</span></a></li>
        <li><span><a href="./groupMgr.jsp">用户组</a></span></li>
        <li><span><a href="./roleMgr.jsp">角色</a></span></li>
        <li><span><a href="./authMgr.jsp">权限</a></span></li>
    </ul>

</div>
