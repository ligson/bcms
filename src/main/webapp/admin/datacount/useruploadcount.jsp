<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">上传统计</rapid:override>
<rapid:override name="head">
    <script src="../../js/admin/useruploadcount.js" type="text/javascript"></script>
</rapid:override>
<rapid:override name="mainName">上传统计</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'上传量统计'" iconCls="icon-disk_upload">
    <jsp:include page="_searchtoolbar.jsp"/>
    <div id="container"></div>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/datacountmgr-base.jsp" %>
