<%--
  Created by IntelliJ IDEA.
  User: ligson
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
<div class="easyui-accordion" data-options="region:'west',split:true" title="应用管理" style="width:240px;">
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