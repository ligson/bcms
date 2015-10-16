<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">部门管理</rapid:override>
<rapid:override name="head">
  <script type="text/javascript" src="../../js/admin/user/department.js"></script>
</rapid:override>
<rapid:override name="mainName">部门管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
  <div class="easyui-layout" fit="true">
    <div region="west" title="部门组结构树" style="width: 240px;">
      <div style="padding:5px;background:#fafafa;width:100%;border:1px solid #ccc">
        <a href="#" onclick="clickAddDepartment();" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
        <a href="#" onclick="clickModifyDepartment();" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
        <a href="#" onclick="delDepartment();" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
      </div>
      <ul id="department_tree">
      </ul>
    </div>
    <div region="center" title="部门用户列表">
      <div id="department_user_grid" fit="true">
      </div>
    </div>
  </div>

<div id="add_department_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_department_dlg_buttons">
  <div class="ftitle">
    添加部门
  </div>
  <form id="add_group_form" method="post">
    <div class="fitem">
      <label>
        部门名称
      </label>
      <input name="name" class="easyui-validatebox" required="true" type="text" />
    </div>
    <div class="fitem">
      <label>
        上级菜单</label>
      <input class="easyui-combotree department_tree" name="parent_id"/>
    </div>
  </form>
</div>
<div id="add_department_dlg_buttons">
  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveDepartment()" iconcls="icon-save">保存</a>
  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_department_dlg').dialog('close')"
     iconcls="icon-cancel">取消</a>
</div>

<div id="modify_department_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#modify_department_dlg_buttons">
  <div class="ftitle">
    修改部门
  </div>
  <form id="modify_group_form" method="post">
    <div class="fitem">
      <label>
        部门名称
      </label>
      <input name="name" class="easyui-validatebox" required="true" type="text" />
    </div>
    <div class="fitem">
      <label>
        上级菜单</label>
      <input class="easyui-combotree department_tree" name="parent"/>
    </div>
    <input type="hidden" name="id" />
  </form>
</div>
<div id="modify_department_dlg_buttons">
  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyDepartment()" iconcls="icon-save">保存</a>
  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_department_dlg').dialog('close')"
     iconcls="icon-cancel">取消</a>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/umgr-base.jsp" %>
