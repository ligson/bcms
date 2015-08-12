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
    <title>系统配置</title>
    <jsp:include page="../../layout/admin/adminheader.jsp"/>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'点播统计'">
    <div id="container" style="padding:10px;">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>系统名称:</td>
                    <td><input class="easyui-textbox" type="text" name="name" data-options="required:true"/></td>
                </tr>
                <tr>
                    <td>域名:</td>
                    <td><input class="easyui-textbox" type="text" name="email"
                               data-options="required:true,validType:'email'"/></td>
                </tr>
                <tr>
                    <td>系统logo:</td>
                    <td><input type="file" name="photo" />
                    </td>
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
