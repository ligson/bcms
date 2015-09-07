<%--
  Created by IntelliJ IDEA.
  User: ligson
  Date: 2015/8/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="title">必选字段</rapid:override>
<rapid:override name="head">
    <script src="../../js/admin/metadata/candata.js" type="text/javascript"></script>
</rapid:override>
<rapid:override name="mainName">必选字段</rapid:override>
<rapid:override name="mainIcon">icon-page_world</rapid:override>
<rapid:override name="body">
<div data-options="region:'center'" title="可选数据">
    <div id="container">
        <div id="candata_table"></div>
    </div>
</div>

<div id="add_group_dlg" class="easyui-dialog" style="width: 400px; height: 280px; padding: 10px 20px;"
     closed="true" buttons="#add_group_dlg_buttons">
    <div class="ftitle">
        信息编辑
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
            <input class="easyui-combobox" name="roles" data-options="multiple:true,editable:false,required:true,valueField:'id',textField:'name',multiple:true,panelHeight:'100'" style="height: auto"
                    />
        </div>
        <div class="fitem">
            <label>
                上级菜单</label>
            <input class="easyui-combobox" name="par" data-options="multiple:true,editable:false,required:true,valueField:'id',textField:'name',multiple:true,panelHeight:'100'" style="height: auto"
                    />
        </div>
    </form>
</div>
<div id="add_group_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveGroup()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_group_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

</rapid:override>

<!-- extends from base.jsp -->
<%@ include file="../../layout/admin/metadatamgr-base.jsp" %>
