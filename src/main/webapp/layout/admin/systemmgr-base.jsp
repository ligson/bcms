<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title><rapid:block name="title"/>-服务管理</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <style type="text/css">
        .ftitle
        {
            font-size: 14px;
            font-weight: bold;
            padding: 5px 0;
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }
        .fitem
        {
            margin-bottom: 5px;
        }
        .fitem label
        {
            display: inline-block;
            width: 80px;
        }
    </style>
    <rapid:block name="head"/>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<div data-options="region:'west',split:true" title="系统菜单" style="width:200px;" iconCls="icon-application_side_boxes">
    <div class="easyui-accordion" style="width:100%;" id="treeMenu">
        <div iconCls="icon-script" title="Web服务">
            <ul class="easyui-tree">
                <li iconCls="icon-config"><span><a href="./webconf.jsp">Web服务配置</a></span></li>
                <li iconCls="icon-config"><span><a href="./webservermonitor.jsp">Web服务器状态监测</a></span></li>
            </ul>
        </div>
        <div iconCls="icon-script" title="转码服务">
            <ul class="easyui-tree">
                <li iconCls="icon-drive_disk"><span><a href="./convertconf.jsp">转码配置</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convpolicy.jsp">转码策略配置</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convqueue.jsp">转码队列</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convsuccess.jsp">已转码文件</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convmonitor.jsp">转码统计</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convservermonitor.jsp">转码服务器监测</a></span></li>
            </ul>
        </div>
        <div iconCls="icon-script" title="流媒体服务">
            <ul class="easyui-tree">
                <li iconCls="icon-drive_disk"><span><a href="./mediaserverconf.jsp">流媒体配置</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./mediaservermonitor.jsp">流媒体服务器监测</a></span></li>
            </ul>
        </div>
        <div iconCls="icon-script" title="存储服务">
            <ul class="easyui-tree">
                <li iconCls="icon-drive_disk"><span><a href="./storeconf.jsp">存储配置</a></span></li>
            </ul>
        </div>
    </div>
</div>

<div data-options="region:'center',title:'<rapid:block name="mainName"/>'" iconCls="<rapid:block name="mainIcon"/>">
    <rapid:block name="body"/>
</div>

</body>
</html>
