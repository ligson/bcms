<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/11
  Time: 16:47
  To change this template use File | Settings | File Templates.


--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="ui-mask">
    <p>正在加载页面,请稍后...</p>
</div>
<div data-options="region:'north',border:false" style="height:72px;background:#666;text-align:center">
    <div id="header-inner">
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tbody>
            <tr>
                <td rowspan="2" style="width:20px;">
                </td>
                <td style="height:52px;">
                    <div style="color:#fff;font-size:22px;font-weight:bold;">
                        <a style="color:#fff;font-size:22px;font-weight:bold;text-decoration:none">资源管理平台</a>
                    </div>
                    <div style="color:#fff">
                        <a style="color:#fff;text-decoration:none">让一切资源使用的更方便!</a>
                    </div>
                </td>
                <td style="padding-right:5px;text-align:right;vertical-align:bottom;">
                    <div id="topmenu">
                        <a href="../../admin/usermgr/userMgr.jsp">用户管理</a>
                        <a href="../../admin/resourcemgr/rmgr.jsp">资源管理</a>
                        <a href="../../admin/metadata/metadataMgr.jsp">元数据管理</a>
                        <a href="../../admin/appmgr/topicmgr.jsp">应用管理</a>
                        <a href="../../admin/datacount/datacout.jsp">数据统计</a>
                        <a href="../../admin/sysmgr/webconf.jsp">服务管理</a>
                        <a href="../../admin/socialmgr/informationMgr.jsp">社会化功能管理</a>
                    </div>

                </td>
                <td style="padding-right:5px;text-align:right;vertical-align:bottom;">
                    <div id="user_toolbar">
                        <p>欢迎你,<a style="color:#FFF" iconCls="icon-user" class="easyui-linkbutton" plain="true" id="login_username"></a>&nbsp;&nbsp;
                            <a style="color:#FFF" class="easyui-linkbutton" iconCls="icon-control_power_blue"
                                    plain="true" href="../../admin/login.jsp">退出</a></p>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div data-options="region:'south',split:false" style="height:50px;background:#666;" border="false">
    <p id="footer-inner">Copyright © 2010-2015 www.boful.com</p>
</div>
