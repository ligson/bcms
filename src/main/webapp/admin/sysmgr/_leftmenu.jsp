<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .tree-title a {
        text-decoration: none;
        color: #000;
    }

   .tree-title a:hover {
        color: yellow;
        font-weight: bold;
    }
</style>
<div data-options="region:'west',split:true" title="系统菜单" style="width:150px;"  iconCls="icon-application_side_boxes">
    <ul class="easyui-tree">
        <li iconCls="icon-config"><span><a href="./sysconf.jsp">系统配置</a></span></li>
        <li iconCls="icon-cdr_go"><span><a href="./convertconf.jsp">转码配置</a></span></li>
        <li iconCls="icon-control_equalizer_blue"><span><a href="./mediaserverconf.jsp">流媒体配置</a></span></li>
        <li iconCls="icon-drive_disk"><span><a href="./storeconf.jsp">存储配置</a></span></li>
    </ul>
</div>