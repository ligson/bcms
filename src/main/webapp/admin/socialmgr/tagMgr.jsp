<%--
  Created by IntelliJ IDEA.
  User: Ruby
  Date: 2015/8/18
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>标签管理</title>
    <jsp:include page="_header.jsp"/>
  <script src="../../js/admin/social/tagmgr.js" type="text/javascript"></script>
    <style type="text/css">
        #add_tag_form #modify_tag_form
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
<div region="center">
      <div style="padding:5px;background:#fafafa;border:1px solid #ccc">
        <input id="search_tag" style="width: 300px;align-items: center; display: none;">
      </div>
      <ul id="tag_tree" class="easyui-tree" data-options="url:'../../js/admin/social/tag_test_tree.json'">
      </ul>
      <div style="padding-:5px;background:#fafafa;border:1px solid #ccc">
        <a href="#" onclick="clickAddTag();" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
        <a href="#" onclick="clickAddNextTag();" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加下级标签</a>
        <a href="#" onclick="clickModifyTag();" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a>
        <a href="#" onclick="delTag();" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">删除</a>
</div>
</div>

<div id="add_tag_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_tag_dlg_buttons">
    <div class="ftitle">
        添加标签
    </div>
    <form id="add_tag_form" method="post">
        <div class="fitem">
            <label>
                标签名
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
        </div>

    </form>
</div>

<div id="add_tag_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_tag_dlg').dialog('close')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_tag_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_tag_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#modify_tag_dlg_buttons">
    <div class="ftitle">
        编辑标签
    </div>
    <form id="modify_tag_form" method="post">
        <div class="fitem">
            <label>
                标签名
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="标签1234" />
        </div>

    </form>
</div>

<div id="modify_tag_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_tag_dlg').dialog('close')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_tag_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

</body>
</html>
