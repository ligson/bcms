<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">评论管理</rapid:override>
<rapid:override name="head">
  <script type="text/javascript" src="../../js/admin/social/commentmgr.js"></script>
</rapid:override>
<rapid:override name="mainName">评论管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'评论管理'">
  <div id="container">
    <table id="comment_table"></table>
  </div>
</div>
  <div id="tb" style="padding:3px">
    <div style="margin-bottom: 5px;">
      创建者: <input class="easyui-textbox" style="width:150px" id="username">
      是否屏蔽:
      <select class="easyui-combobox" panelHeight="auto" style="width:100px" id="is_blocked">
        <option value="">全部</option>
        <option value="true">是</option>
        <option value="false">否</option>
      </select>
      <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="reloadgrid();">搜索</a>
    </div>
  </div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/socialmgr-base.jsp" %>
