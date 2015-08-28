<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .tree-title a {
        text-decoration: none;
        color: #000;
    }

   .tree-title a:hover {
        color: yellow;
        font-weight: bold;
    }
</style>
    <div class="easyui-accordion" data-options="region:'west',split:true" title="服务管理" style="width:240px;">
        <div title="Web服务">
            <ul class="easyui-tree">
                <li iconCls="icon-config"><span><a href="./webconf.jsp">Web服务配置</a></span></li>
                <li iconCls="icon-config"><span><a href="./webservermonitor.jsp">Web服务器状态监测</a></span></li>
            </ul>
        </div>
        <div title="转码服务">
            <ul class="easyui-tree">
                <li iconCls="icon-drive_disk"><span><a href="./convertconf.jsp">转码配置</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convpolicy.jsp">转码策略配置</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convqueue.jsp">转码队列</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convsuccess.jsp">已转码文件</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convmonitor.jsp">转码统计</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./convservermonitor.jsp">转码服务器监测</a></span></li>
            </ul>
        </div>
        <div title="流媒体服务">
            <ul class="easyui-tree">
                <li iconCls="icon-drive_disk"><span><a href="./mediaserverconf.jsp">流媒体配置</a></span></li>
                <li iconCls="icon-drive_disk"><span><a href="./mediaservermonitor.jsp">流媒体服务器监测</a></span></li>
            </ul>
        </div>
        <div title="存储服务">
            <ul class="easyui-tree">
                <li iconCls="icon-drive_disk"><span><a href="./storeconf.jsp">存储配置</a></span></li>
            </ul>
        </div>
    </div>
