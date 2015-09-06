<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">操作日志</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/admin/roplog.js"></script>
</rapid:override>
<rapid:override name="mainName">操作日志</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <table id="logGrid" class="easyui-datagrid"
           data-options="rownumbers:true,singleSelect:true,url:'./roploglist.json',method:'post'"
           pagination="true" toolbar="#rGridTbr">
        <thead>
        </thead>
    </table>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/rmgr-base.jsp" %>
