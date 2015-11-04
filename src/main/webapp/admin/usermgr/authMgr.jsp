<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">权限管理</rapid:override>
<rapid:override name="head">
    <script type="text/javascript" src="../../js/admin/user/auth.js"></script>
</rapid:override>
<rapid:override name="mainName">权限管理</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
    <div data-options="region:'center',title:'权限管理'">
    <div id="container">

        <table id="auth_table"></table>
    </div>
</div>



<div id="modify_auth_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#modify_auth_dlg_buttons">
    <div class="ftitle">
        修改权限
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
                目标部门</label>
            <input class="easyui-combotree department_tree" name="departments" style="height: auto"
                    />
        </div>
        <div class="fitem">
            <label>
                目标资源库</label>
            <input class="easyui-combotree resourcelib_tree" name="resources" style="height: auto"
                    />
        </div>
        <div class="fitem">
            <label>
                备注</label>
            <input name="description" class="easyui-validatebox" required="true" type="text" />
        </div>
    </form>
</div>

<div id="modify_auth_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_auth_dlg').dialog('close')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_auth_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>


<div id="add_auth_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_auth_dlg_buttons">
    <div class="ftitle">
        添加权限范围
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
                目标部门</label>
            <input class="easyui-combotree department_tree" name="departments" style="height: auto"
                    />
        </div>
        <div class="fitem">
            <label>
                目标资源库</label>
            <input class="easyui-combotree resourcelib_tree" name="resources" style="height: auto"
                    />
        </div>
        <div class="fitem">
            <label>
                备注</label>
            <input name="description" class="easyui-validatebox" required="true" type="text" />
        </div>
    </form>
</div>
<div id="add_auth_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveAuth();" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_auth_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/umgr-base.jsp" %>
