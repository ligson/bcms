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
<div class="easyui-accordion" data-options="region:'west',split:true" title="社会化功能管理" style="width:240px;">
    <div title="社会化管理">
        <ul class="easyui-tree">
            <li iconCls="icon-user"><a href="./informationMgr.jsp"><span>资讯管理</span></a></li>
            <li iconCls="icon-group"><span><a href="./commentMgr.jsp">评论管理</a></span></li>
            <li iconCls="icon-group-key"><span><a href="./scoreMgr.jsp">评分管理</a></span></li>
            <li iconCls="icon-organ"><a href="./tagMgr.jsp"><span>标签管理</span></a></li>
            <li iconCls="icon-organ"><a href="./noteMgr.jsp"><span>笔记管理</span></a></li>
            <li iconCls="icon-organ"><a href="./questionMgr.jsp"><span>提问管理</span></a></li>
            <li iconCls="icon-organ"><a href="./messageMgr.jsp"><span>站内消息管理</span></a></li>
        </ul>
    </div>


</div>
