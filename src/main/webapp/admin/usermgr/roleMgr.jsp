<%--
  Created by IntelliJ IDEA.
  User: libruy
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">角色管理</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/admin/user/role.js"></script>
</rapid:override>
<rapid:override name="mainName">角色管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
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

<div id="add_role_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
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

<div id="modify_role_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
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

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/umgr-base.jsp" %>
