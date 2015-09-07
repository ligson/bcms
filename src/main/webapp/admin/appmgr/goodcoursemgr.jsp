<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">精品课程管理</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/admin/casemgr.js"></script>
</rapid:override>
<rapid:override name="mainName">精品课程管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
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
<div data-options="region:'center',title:'精品课程管理'" iconCls="icon-page_world">
    <div id="container">
        <table id="rGrid" class="easyui-datagrid"
               data-options="rownumbers:true,singleSelect:true,url:'./caseliblist.json',method:'post'" pagination="true"
               toolbar="#rGridTbr">
            <thead>
            </thead>
        </table>
    </div>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/appmgr-base.jsp" %>
