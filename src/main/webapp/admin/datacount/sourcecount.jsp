<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">来源统计</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/admin/datacount/sourcecount.js"></script>
</rapid:override>
<rapid:override name="mainName">来源统计</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'来源统计'">
    <div id="container">
        <table id="source_table"></table>
    </div>
</div>

</rapid:override>

<%@ include file="../../layout/admin/datacountmgr-base.jsp" %>