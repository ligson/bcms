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
    <title>必选字段</title>
    <jsp:include page="_header.jsp"/>
    <script src="../../js/admin/metadata/candata.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
<jsp:include page="../../layout/admin/adminbody.jsp"/>
<%--<div data-options="region:'east',split:true" title="East" style="width:100px;"></div>--%>
<jsp:include page="_leftmenu.jsp"/>
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

</body>
</html>
