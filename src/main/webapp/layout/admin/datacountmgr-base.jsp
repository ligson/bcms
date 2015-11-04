<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title><rapid:block name="title"/>-数据统计</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <script type="text/javascript" src="../../js/Highcharts-4.1.7/js/highcharts.js"></script>
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
        <div title="数据统计" iconCls="icon-cd_magnify">
            <ul class="easyui-tree">
                <li iconCls="icon-cd_play"><span><a href="./resourceplaycount.jsp">资源点播统计</a></span></li>
                <li iconCls="icon-chart_line"><span><a href="./useraccesscount.jsp">访问量统计</a></span></li>
            </ul>
        </div>
        <%--<div title="资源统计" iconCls="icon-cd_magnify">
            <ul class="easyui-tree">
                <li iconCls="icon-cd_play"><span><a href="./datacout.jsp">点播统计</a></span></li>
                <li iconCls="icon-package_down"><span><a href="./downloadcout.jsp">下载统计</a></span></li>
                <li iconCls="icon-chart_curve"><span><a href="./resourcecount.jsp">资源量统计</a></span></li>
                <li iconCls="icon-chart_pie"><span><a href="./mediatypecount.jsp">类型统计</a></span></li>
                <li iconCls="icon-page_world"><span><a href="./libcout.jsp">资源库统计</a></span></li>
            </ul>
        </div>--%>
       <%-- <div title="用户统计" iconCls="icon-user">
            <ul class="easyui-tree">
                <li iconCls="icon-control_play_blue"><span><a href="./userplaycount.jsp">点播量统计</a></span></li>
                <li iconCls="icon-download"><span><a href="./userdownloadcount.jsp">下载量统计</a></span></li>
                <li iconCls="icon-chart_line"><span><a href="./useraccesscount.jsp">访问量统计</a></span></li>
                <li iconCls="icon-disk_upload"><span><a href="./useruploadcount.jsp">上传量统计</a></span></li>
            </ul>
        </div>--%>

    </div>
</div>

<div data-options="region:'center',title:'<rapid:block name="mainName"/>'" iconCls="<rapid:block name="mainIcon"/>">
    <rapid:block name="body"/>
</div>

</body>
</html>
