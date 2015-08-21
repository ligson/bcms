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
    <script src="../../js/admin/user/role.js" type="text/javascript"></script>
    <style type="text/css">
        #add_role_form #modify_role_form
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
<div region="center" style="overflow-y: hidden">
    <div class="easyui-layout" fit="true">
        <div region="west" title="角色列表" style="width: 200px;">
            <div style="padding:5px;background:#fafafa;width:100%;border:1px solid #ccc">
                <a href="#" onclick="clickAddRole();" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
                <a href="#" onclick="clickModifyRole();" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
                <a href="#" onclick="delRole();" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
            </div>
            <ul id="role_tree">
            </ul>
        </div>
        <div region="center">
            <div id="role_auth_grid" fit="true">
            </div>
        </div>
    </div>
</div>

<div id="add_role_dlg" class="easyui-dialog" style="width: 400px; height: 200px; padding: 10px 20px;"
     closed="true" buttons="#add_role_dlg_buttons">
    <div class="ftitle">
        信息编辑
    </div>
    <form id="add_role_form" method="post">
        <div class="fitem">
            <label>
                角色名
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                权限</label>
            <input class="easyui-combobox" name="auths" data-options="multiple:true,editable:false,required:true,valueField:'id',textField:'name',multiple:true,panelHeight:'100'" style="height: auto"
                    />
        </div>
    </form>
</div>

<div id="add_role_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveRole()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_role_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_role_dlg" class="easyui-dialog" style="width: 400px; height: 200px; padding: 10px 20px;"
     closed="true" buttons="#modify_role_dlg_buttons">
    <div class="ftitle">
        信息编辑
    </div>
    <form id="modify_role_form" method="post">
        <div class="fitem">
            <label>
                角色名
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                权限</label>
            <input class="easyui-combobox" name="auths" data-options="multiple:true,editable:false,required:true,valueField:'id',textField:'name',multiple:true,panelHeight:'100'" style="height: auto"
                    />
        </div>
        <input type="hidden" name="id"  />
    </form>
</div>

<div id="modify_role_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyRole()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_role_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

</body>
</html>
