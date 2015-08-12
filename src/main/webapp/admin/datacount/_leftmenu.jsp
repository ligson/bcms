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
<div data-options="region:'west',split:true" title="系统菜单" style="width:150px;">
    <div class="easyui-accordion" style="width:100%;height:180px;" id="treeMenu">
        <div title="资源统计" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><span><a href="./datacout.jsp">点播统计</a></span></li>
                <li><span><a href="./downloadcout.jsp">下载统计</a></span></li>
                <li><span><a href="./resourcecount.jsp">资源量统计</a></span></li>
                <li><span><a href="./mediatypecount.jsp">资源类型统计</a></span></li>
                <li><span><a href="./libcout.jsp">资源库统计</a></span></li>

            </ul>
        </div>
        <div title="用户统计" style="overflow:auto;padding:10px;">
            <ul class="easyui-tree">
                <li><span><a href="./userplaycount.jsp">点播量统计</a></span></li>
                <li><span><a href="./userdownloadcount.jsp">下载量统计</a></span></li>
                <li><span><a href="./useraccesscount.jsp">访问量统计</a></span></li>
                <li><span><a href="./useruploadcount.jsp">上传量统计</a></span></li>
            </ul>
        </div>
    </div>
</div>