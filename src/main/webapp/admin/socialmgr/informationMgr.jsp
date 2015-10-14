<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">资讯管理</rapid:override>
<rapid:override name="head">
  <script type="text/javascript" src="../../js/admin/social/informationmgr.js"></script>
  <script type="text/javascript" src="../../js/ckeditor/ckeditor.js"></script>
</rapid:override>
<rapid:override name="mainName">资讯管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div id="information_tabs" class="easyui-tabs">
  <div title="资讯列表" style="padding:10px">
    <table id="information_table"></table>
  </div>
</div>
  <div id="tb" style="padding:3px">
      <a href="#" onclick="newInformation();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>
        标题: <input class="easyui-textbox" style="width:200px" id="name">
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadgrid();">搜索</a>
  </div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/socialmgr-base.jsp" %>


