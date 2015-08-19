<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">

</style>
<div data-options="region:'west',split:true" title="系统菜单" style="width:150px;" id="treeMenu"
     iconCls="icon-application_side_boxes">
    <div class="easyui-accordion" >
        <div title="用户管理" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
        <ul class="easyui-tree" style="display:block">
            <li iconCls="icon-user"><a href="./informationMgr.jsp"><span>资讯管理</span></a></li>
            <li iconCls="icon-organ"><a href="./tagMgr.jsp"><span>标签管理</span></a></li>
            <li iconCls="icon-group"><span><a href="./commentMgr.jsp">评论管理</a></span></li>
            <li iconCls="icon-group-key"><span><a href="./scoreMgr.jsp">评分管理</a></span></li>
        </ul>
            </div>
    </div>

</div>
