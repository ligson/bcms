<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资源评论统计</title>
    <jsp:include page="_header.jsp"/>
    <script src="../../js/admin/resourceremarkcount.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
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

</body>
</html>
