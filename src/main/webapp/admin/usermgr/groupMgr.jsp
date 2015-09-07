<%--
  Created by IntelliJ IDEA.
  User: libruy
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">用户组管理</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/admin/user/group.js"></script>
</rapid:override>
<rapid:override name="mainName">用户组管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
       <div class="easyui-layout" fit="true">
           <div region="west" title="用户组列表" style="width: 200px;">
               <div style="padding:5px;background:#fafafa;width:100%;border:1px solid #ccc">
                   <a href="#" onclick="clickAddGroup();" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
                   <a href="#" onclick="clickModifyGroup();" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
                   <a href="#" onclick="delGroup();" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
               </div>
               <ul id="group_tree">
               </ul>
           </div>
           <div region="center">
               <div id="group_tabs">
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

<div id="add_group_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
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
    </form>
</div>
<div id="add_group_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveGroup()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_group_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_group_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
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
            <input type="hidden" name="id" />
        </div>
    </form>
</div>
<div id="modify_group_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyGroup()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_group_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="add_group_role_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_group_role_dlg_buttons">
    <div class="ftitle">
        添加用户组角色
    </div>
    <form id="add_group_role_form" method="post">
        <div class="fitem">
            <label>
                用户组名称
            </label>
            <input name="name" class="easyui-validatebox" disabled="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                角色
            </label>
            <input class="easyui-combotree role_tree"/>
            <input type="hidden" name="group_id"/>
        </div>
    </form>
</div>
<div id="add_group_role_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveGroupRole()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_group_role_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="add_group_user_dlg" class="easyui-dialog" style="width: 720px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_group_user_dlg_buttons">
    <div id="cc"  class="easyui-layout" style="width:660px;height:400px;">
        <div data-options="region:'west',title:'部门',split:true" style="width:220px;">
            <div id="department_tree"></div>
        </div>
        <div data-options="region:'center',title:'待选用户'" style="padding:5px;">
           <%-- <div id="user_list" class="easyui-datalist"></div>--%>
               <ul id="user_list" class="easyui-datalist">
               </ul>
        </div>
        <div data-options="region:'east',title:'已选用户',split:true" style="width:220px;padding:5px;">
            <ul id="select_user_list" class="easyui-datalist">
            </ul>
        </div>
    </div>
    <div id="add_group_user_dlg_buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveGroupUser()" iconcls="icon-save">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_group_user_dlg').dialog('close')"
           iconcls="icon-cancel">取消</a>
    </div>
</div>
</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/umgr-base.jsp" %>
