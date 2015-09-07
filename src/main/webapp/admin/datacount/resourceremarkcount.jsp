<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">资源评论统计</rapid:override>
<rapid:override name="head">
    <script src="../../js/admin/resourceremarkcount.js" type="text/javascript"></script>
</rapid:override>
<rapid:override name="mainName">资源评论统计</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center',title:'资源评论列表'" iconCls="icon-comments">
    <%--<jsp:include page="_searchtoolbar.jsp"/>--%>
    <table id="dataGrid" class="easyui-datagrid"
           data-options="fit:true,rownumbers:true,singleSelect:true,url:'remarkdata.json',method:'get',toolbar:toolbar,pagination:true">
    </table>
    <script type="text/javascript">
        var toolbar = [{
            text: '删除',
            iconCls: 'icon-add',
            handler: function () {
                alert('add')
            }
        }];
    </script>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/datacountmgr-base.jsp" %>
