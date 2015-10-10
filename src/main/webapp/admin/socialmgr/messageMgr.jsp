<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/28
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">站内消息管理</rapid:override>
<rapid:override name="head">
  <script type="text/javascript" src="../../js/admin/social/messagemgr.js"></script>
  <script type="text/javascript" src="../../js/ckeditor/ckeditor.js"></script>
</rapid:override>
<rapid:override name="mainName">站内消息管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">

  <div id="message_tabs" class="easyui-tabs">
    <div title="消息列表" style="padding:10px">
      <table id="message_table"></table>
    </div>

  </div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/socialmgr-base.jsp" %>