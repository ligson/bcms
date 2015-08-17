<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/12
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>存储配置</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
    <style type="text/css">
        .combo-panel .panel-body .panel-body-noheader {
            height: 150px;
        }
    </style>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'存储配置'" iconCls="icon-drive_disk">
    <div id="container">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>存储协议:</td>
                    <td>
                        <select class="easyui-combobox" name="language">
                            <option value="hdfs">HDFS</option>
                            <option value="http">HTTP</option>
                            <option value="bdcloud">百度云</option>
                            <option value="local">File(本地文件)</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>地址:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>端口:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>参数:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true"/></td>
                </tr>
            </table>
        </form>
        <div style="text-align:left;">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">保存</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
        </div>
    </div>
</div>
</body>
</html>
