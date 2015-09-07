<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title><rapid:block name="title"/>-应用管理</title>
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
        <div title="应用管理" iconCls="icon-cd_magnify">
            <ul class="easyui-tree">
                <li iconCls="icon-zhuanti">
                        <span>
                            <a href="topicmgr.jsp">专题管理</a>
                        </span>
                </li>
                <li iconCls="icon-application_view_gallery">
                        <span>
                            <a href="goodcoursemgr.jsp">精品课程管理</a>
                        </span>
                </li>
            </ul>
        </div>

    </div>
</div>

<div data-options="region:'center',title:'<rapid:block name="mainName"/>'" iconCls="<rapid:block name="mainIcon"/>">
    <rapid:block name="body"/>
</div>

</body>
</html>
