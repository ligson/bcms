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
    <title>用户管理</title>
    <jsp:include page="_header.jsp"/>
    <script src="../../js/admin/user/user.js" type="text/javascript"></script>
    <style type="text/css">
        #add_user_form #modify_user_form
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
<div data-options="region:'center',title:'用户管理'">
    <div id="container">
        <table id="user_table"></table>
    </div>
</div>


<div id="add_user_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_user_dlg_buttons">
    <div class="ftitle">
        添加用户
    </div>
    <form id="add_user_form" method="post">
        <div class="fitem">
            <label>
                账号
            </label>
            <input name="name"  class="easyui-validatebox" required="true" type="text"  />
        </div>
        <div class="fitem">
            <label>
                中文名
            </label>
            <input name="cn_name"  class="easyui-validatebox" type="text"  />
        </div>
        <div class="fitem">
            <label>
                密码
            </label>
            <input name="password" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                邮箱
            </label>
            <input name="email" class="easyui-validatebox" type="text" />
        </div>
        <div class="fitem">
            <label>
                手机
            </label>
            <input name="phone" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                编号
            </label>
            <input name="number" class="easyui-validatebox" type="text" />
        </div>
        <div class="fitem">
            <label>
                身份
            </label>
            <input class="easyui-combobox identity_combobox" data-options="valueField:'id',textField:'text',panelHeight:'auto'" name="identity"   />
        </div>
        <div class="fitem">
            <label>
                用户组</label>
            <input class="easyui-combotree group_tree" multiple="true" name="group"/>
        </div>
        <div class="fitem">
            <label>
                部门</label>
            <input class="easyui-combotree department_tree" name="department"/>
        </div>
        <div class="fitem">
            <label>
                性别
            </label>
            <input class="easyui-combobox gender_combobox" data-options="valueField:'id',textField:'text',panelHeight:'auto'" name="gender" required="true"  />
        </div>
        <div class="fitem">
            <label>
                存储(G)
            </label>
            <input name="disk_size" class="easyui-validatebox" type="text" />
        </div>
        <div class="fitem">
            <label>
                备注
            </label>
            <input name="description" class="easyui-validatebox" type="text" />
        </div>
    </form>
</div>

<div id="add_user_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="saveUser()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_user_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_user_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#modify_user_dlg_buttons">
    <div class="ftitle">
        修改用户
    </div>
    <form id="modify_user_form" method="post">
        <div class="fitem">
            <label>
                账号
            </label>
            <input name="name" disabled="true" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                中文名
            </label>
            <input name="cn_name"  class="easyui-validatebox" type="text"  />
        </div>
        <div class="fitem">
            <label>
                邮箱
            </label>
            <input name="email" class="easyui-validatebox" type="text" />
        </div>
        <div class="fitem">
            <label>
                手机
            </label>
            <input name="phone" class="easyui-validatebox" type="text" />
        </div>
        <div class="fitem">
            <label>
                编号
            </label>
            <input name="number" class="easyui-validatebox" type="text" />
        </div>
        <div class="fitem">
            <label>
                身份
            </label>
            <input class="easyui-combobox identity_combobox" data-options="valueField:'id',textField:'text',panelHeight:'auto'" name="identity"   />
        </div>
        <div class="fitem">
            <label>
                用户组</label>
            <input class="easyui-combotree group_tree" required="true"  multiple="true" name="group"/>
        </div>
        <div class="fitem">
            <label>
                部门</label>
            <input class="easyui-combotree department_tree" name="department_id"/>
        </div>
        <div class="fitem">
            <label>
                性别
            </label>
            <input class="easyui-combobox gender_combobox" data-options="valueField:'id',textField:'text',panelHeight:'auto'" name="gender" required="true"  />
        </div>
        <div class="fitem">
            <label>
                存储(G)
            </label>
            <input name="disk_size" class="easyui-validatebox" type="text" />
        </div>
        <div class="fitem">
            <label>
                备注
            </label>
            <input name="description" class="easyui-validatebox" type="text" />
        </div>
        <input type="hidden" name="id"/>
    </form>
</div>

<div id="modify_user_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="modifyUser()" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_user_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>
</body>
</html>
