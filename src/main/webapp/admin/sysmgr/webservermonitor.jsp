<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">Web服务状态监测</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/Highcharts-4.1.7/js/highcharts.js"></script>
</rapid:override>
<rapid:override name="mainName">Web服务状态监测</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'Web服务状态监测'" iconCls="icon-control_equalizer_blue" style="padding:10px;">
           <%-- <div id="container">
            </div>--%>
<iframe style="width:100%;height: 650px;" src="http://42.62.52.40:8001/#/accounts"></iframe>

</div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/systemmgr-base.jsp" %>
