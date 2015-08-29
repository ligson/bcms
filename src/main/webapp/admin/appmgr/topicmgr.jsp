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
    <title>专题管理</title>
    <jsp:include page="_header.jsp"/>
    <script type="text/javascript" src="../../js/admin/topicmgr.js"></script>
    <style type="text/css">
        #add_topic_form #modify_topic_form
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
<div id="rGridTbr" style="height:30px;line-height:30px;">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="addTopic()" plain="true"
       iconCls="icon-add"
       title="添加">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-ok"
       title="修改">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-remove"
       title="删除">删除</a>|<label>名称:<input type="text" class="easyui-textbox" name="name"/></label>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="loadLocal()" plain="true" iconCls="icon-search"
       title="搜索"></a>
</div>
<div data-options="region:'center',title:'专题管理'" iconCls="icon-page_world">
    <div id="container">
        <table id="rGrid" class="easyui-datagrid"
               data-options="rownumbers:true,singleSelect:true,url:'./caseliblist.json',method:'post'" pagination="true"
               toolbar="#rGridTbr">
            <thead>
            </thead>
        </table>
    </div>
</div>

<div id="add_topic_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#add_topic_dlg_buttons">
    <div class="ftitle">
        添加专题
    </div>
    <form id="add_tag_form" method="post">
        <div class="fitem">
            <label>
                专题名称
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                状态
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                专题海报
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                检索
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" />
        </div>
        <div class="fitem">
            <label>
                描述
            </label>
            <input class="easyui-textbox" data-options="multiline:true" style="height:100px">
        </div>
    </form>
</div>

<div id="add_topic_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_topic_dlg').dialog('close')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#add_topic_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

<div id="modify_topic_dlg" class="easyui-dialog" style="width: 400px; height: auto; padding: 10px 20px;"
     closed="true" buttons="#modify_topic_dlg_buttons">
    <div class="ftitle">
        编辑标签
    </div>
    <form id="modify_topic_form" method="post">
        <div class="fitem">
            <label>
                专题名称
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                描述
            </label>
            <input class="easyui-textbox" data-options="multiline:true" style="width:300px;height:100px">
        </div>
        <div class="fitem">
            <label>
                状态
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                专题海报
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
        <div class="fitem">
            <label>
                检索
            </label>
            <input name="name" class="easyui-validatebox" required="true" type="text" value="" />
        </div>
    </form>
</div>

<div id="modify_topic_dlg_buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_tag_dlg').dialog('close')" iconcls="icon-save">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#modify_tag_dlg').dialog('close')"
       iconcls="icon-cancel">取消</a>
</div>

</body>
</html>
