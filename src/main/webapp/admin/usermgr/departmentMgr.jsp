<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门管理</title>
  <jsp:include page="_header.jsp"/>
  <script src="../../js/admin/user/department.js" type="text/javascript"></script>
  <style type="text/css">
    #add_department_form #modify_department_form
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
<jsp:include page="_leftmenu.jsp"/>

<div region="center" style="overflow-y: hidden">
  <div class="easyui-layout" fit="true">
    <div region="west" title="部门组结构树" style="width: 200px;">
      <div style="padding:5px;background:#fafafa;width:185px;border:1px solid #ccc">
        <a href="#" onclick="clickAddDepartment();" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
        <a href="#" onclick="clickModifyDepartment();" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
        <a href="#" onclick="delDepartments();" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
      </div>
      <ul id="department_tree">
      </ul>
    </div>
    <div region="center" title="部门用户列表">
      <div id="department_user_grid" fit="true">
      </div>
    </div>
  </div>
</div>

<div id="add_department_dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
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

<div id="modify_department_dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
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
  </form>
</div>
<div id="modify_department_dlg_buttons">
  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyDepartment()" iconcls="icon-save">保存</a>
  <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_department_dlg').dialog('close')"
     iconcls="icon-cancel">取消</a>
</div>

</body>
</html>
