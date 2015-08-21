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
    <script src="../../js/admin/user/group.js" type="text/javascript"></script>
    <style type="text/css">
        #add_group_form #modify_group_form
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
           <div region="west" title="用户组列表" style="width: 200px;">
               <div style="padding:5px;background:#fafafa;width:100%;border:1px solid #ccc">
                   <a href="#" onclick="clickAddGroup();" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
                   <a href="#" onclick="clickModifyGroup();" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
                   <a href="#" onclick="delGroups();" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
               </div>
               <ul id="group_tree">
               </ul>
           </div>
           <div region="center">
               <div class="easyui-tabs" data-options="fit:true,plain:true">
                   <div title="用户组对应用户列表" style="padding:10px">
                       <div id="group_user_grid" fit="true">
                       </div>
                   </div>
                   <div title="用户组对应角色列表" style="padding:10px">
                       <div id="group_role_grid" fit="true">
                       </div>
                   </div>

               </div>
           </div>
       </div>
    </div>

<div id="add_group_dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
     closed="true" buttons="#add_group_dlg_buttons">
    <div class="ftitle">
        添加用户组
    </div>
    <form id="add_group_form" method="post">
        <div class="fitem">
            <label>
                用户组名称
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                角色</label>
            <input class="easyui-combobox roles" name="roles" data-options="multiple:true,editable:false,required:true,valueField:'id',textField:'name',multiple:true,panelHeight:'100'" style="height: auto"
                    />
        </div>
    </form>
</div>
<div id="add_group_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveGroup()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_group_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_group_dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
     closed="true" buttons="#modify_group_dlg_buttons">
    <div class="ftitle">
        修改用户组
    </div>
    <form id="modify_group_form" method="post">
        <div class="fitem">
            <label>
                用户组名称
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                角色</label>
            <input class="easyui-combobox roles" name="roles" data-options="multiple:true,editable:false,required:true,valueField:'id',textField:'name',multiple:true,panelHeight:'100'" style="height: auto"
                    />
        </div>
    </form>
</div>
<div id="modify_group_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyGroup()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_group_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

</body>
</html>
