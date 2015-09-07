<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title><rapid:block name="title"/>-社会化管理</title>
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
        <div iconCls="icon-script" title="社会化管理">
            <ul class="easyui-tree">
                <li iconCls="icon-user"><a href="./informationMgr.jsp"><span>资讯管理</span></a></li>
                <li iconCls="icon-group"><span><a href="./commentMgr.jsp">评论管理</a></span></li>
                <li iconCls="icon-group-key"><span><a href="./scoreMgr.jsp">评分管理</a></span></li>
                <li iconCls="icon-organ"><a href="./tagMgr.jsp"><span>标签管理</span></a></li>
                <li iconCls="icon-organ"><a href="./noteMgr.jsp"><span>笔记管理</span></a></li>
                <li iconCls="icon-organ"><a href="./questionMgr.jsp"><span>提问管理</span></a></li>
                <li iconCls="icon-organ"><a href="./messageMgr.jsp"><span>站内消息管理</span></a></li>
            </ul>
        </div>

    </div>
</div>

<div data-options="region:'center',title:'<rapid:block name="mainName"/>'" iconCls="<rapid:block name="mainIcon"/>">
    <rapid:block name="body"/>
</div>

</body>
</html>
