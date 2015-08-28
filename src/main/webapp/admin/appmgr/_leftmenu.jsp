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
<div data-options="region:'west',split:true" title="系统菜单" style="width:150px;" iconCls="icon-application_side_boxes">
    <div class="easyui-accordion" style="width:100%;" id="treeMenu">
        <div title="应用管理" style="overflow:auto;padding:5px;padding-top:0px;" iconCls="icon-application_cascade">
            <div style="margin-top:5px;">
                <ul class="easyui-tree">
                  <%--  <li iconCls="icon-book_open">
                        <span>
                            <a href="casemgr.jsp">案例库管理</a>
                        </span>
                    </li>
                    <li iconCls="icon-drive_cd">
                        <span>
                            <a href="videomgr.jsp">视频库管理</a>
                        </span>
                    </li>
                    <li iconCls="icon-double_people">
                        <span>
                            <a href="coursemgr.jsp">课程管理</a>
                        </span>
                    </li>--%>
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
</div>