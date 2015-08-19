<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户组管理</title>
    <jsp:include page="_header.jsp"/>
    <script src="../../js/admin/user/auth.js" type="text/javascript"></script>
    <style type="text/css">
        #add_auth_form #modify_auth_form
        {
            margin: 0;
            padding: 10px 30px;
        }
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
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
<div data-options="region:'center',title:'权限管理'">
    <div id="container">

        <table id="auth_table"></table>
    </div>
</div>


<div id="add_auth_dlg" class="easyui-dialog" style="width: 400px; height: 200px; padding: 10px 20px;"
     closed="true" buttons="#add_auth_dlg_buttons">
    <div class="ftitle">
        添加权限
    </div>
    <form id="add_role_form" method="post">
        <div class="fitem">
            <label>
                权限名称
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                权限代码</label>
            <input name="codename" class="easyui-validatebox" required="true" type="text" />
        </div>
    </form>
</div>

<div id="add_auth_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveAuth()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_auth_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_auth_dlg" class="easyui-dialog" style="width: 400px; height: 200px; padding: 10px 20px;"
     closed="true" buttons="#modify_auth_dlg_buttons">
    <div class="ftitle">
        添加权限
    </div>
    <form id="modify_role_form" method="post">
        <div class="fitem">
            <label>
                权限名称
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                权限代码</label>
            <input name="codename" class="easyui-validatebox" required="true" type="text" />
        </div>
    </form>
</div>

<div id="modify_auth_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyAuth()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_auth_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

</body>
</html>
