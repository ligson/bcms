<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    #treeMenu .tree-title a {
        text-decoration: none;
        color: #000;
    }

    #treeMenu .tree-title a:hover {
        color: yellow;
        font-weight: bold;
    }
</style>
<div class="easyui-accordion" data-options="region:'west',split:true" title="数据统计" style="width:240px;">
    <div title="资源统计" iconCls="icon-cd_magnify">
        <ul class="easyui-tree">
            <li iconCls="icon-cd_play"><span><a href="./datacout.jsp">点播统计</a></span></li>
            <li iconCls="icon-package_down"><span><a href="./downloadcout.jsp">下载统计</a></span></li>
            <li iconCls="icon-chart_curve"><span><a href="./resourcecount.jsp">资源量统计</a></span></li>
            <li iconCls="icon-chart_pie"><span><a href="./mediatypecount.jsp">类型统计</a></span></li>
            <li iconCls="icon-page_world"><span><a href="./libcout.jsp">资源库统计</a></span></li>
        </ul>
    </div>
    <div title="用户统计" iconCls="icon-user">
        <ul class="easyui-tree">
            <li iconCls="icon-control_play_blue"><span><a href="./userplaycount.jsp">点播量统计</a></span></li>
            <li iconCls="icon-download"><span><a href="./userdownloadcount.jsp">下载量统计</a></span></li>
            <li iconCls="icon-chart_line"><span><a href="./useraccesscount.jsp">访问量统计</a></span></li>
            <li iconCls="icon-disk_upload"><span><a href="./useruploadcount.jsp">上传量统计</a></span></li>
        </ul>
    </div>

</div>